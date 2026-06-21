-- Game Hat data foundation.

-- Supports composite foreign keys that keep Game Hat participant references
-- within the same session.
create unique index if not exists session_participants_session_id_id_unique_idx
  on public.session_participants (session_id, id);

create table if not exists public.game_hat_prompts (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references public.sessions (id) on delete cascade,
  created_by_participant_id uuid not null,
  prompt_text text not null,
  is_used boolean not null default false,
  created_at timestamptz not null default now(),
  used_at timestamptz,
  constraint game_hat_prompts_creator_in_session_fk
    foreign key (session_id, created_by_participant_id)
    references public.session_participants (session_id, id)
    on delete restrict,
  constraint game_hat_prompts_text_not_blank check (
    btrim(prompt_text) <> ''
  ),
  constraint game_hat_prompts_used_at_valid check (
    (is_used and used_at is not null)
    or (not is_used and used_at is null)
  ),
  constraint game_hat_prompts_session_id_id_unique unique (session_id, id)
);

create table if not exists public.game_hat_rounds (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references public.sessions (id) on delete cascade,
  round_number integer not null,
  active_participant_id uuid not null,
  prompt_id uuid not null,
  winner_participant_id uuid,
  result text,
  status text not null default 'active',
  started_at timestamptz not null default now(),
  ended_at timestamptz,
  constraint game_hat_rounds_active_participant_in_session_fk
    foreign key (session_id, active_participant_id)
    references public.session_participants (session_id, id)
    on delete restrict,
  constraint game_hat_rounds_prompt_in_session_fk
    foreign key (session_id, prompt_id)
    references public.game_hat_prompts (session_id, id)
    on delete cascade,
  constraint game_hat_rounds_winner_in_session_fk
    foreign key (session_id, winner_participant_id)
    references public.session_participants (session_id, id)
    on delete restrict,
  constraint game_hat_rounds_round_number_positive check (round_number > 0),
  constraint game_hat_rounds_status_valid check (
    status in ('active', 'completed')
  ),
  constraint game_hat_rounds_result_not_blank check (
    result is null or btrim(result) <> ''
  ),
  constraint game_hat_rounds_completion_valid check (
    (
      status = 'active'
      and result is null
      and winner_participant_id is null
      and ended_at is null
    )
    or (
      status = 'completed'
      and result is not null
      and ended_at is not null
      and ended_at >= started_at
    )
  ),
  constraint game_hat_rounds_session_round_unique
    unique (session_id, round_number),
  constraint game_hat_rounds_prompt_unique unique (prompt_id)
);

create index if not exists game_hat_prompts_session_unused_idx
  on public.game_hat_prompts (session_id, created_by_participant_id)
  where not is_used;

create index if not exists game_hat_rounds_session_started_at_idx
  on public.game_hat_rounds (session_id, started_at desc);

create unique index if not exists game_hat_rounds_one_active_per_session_idx
  on public.game_hat_rounds (session_id)
  where status = 'active';

alter table public.game_hat_prompts enable row level security;
alter table public.game_hat_rounds enable row level security;

drop policy if exists "Session participants can select Game Hat prompts"
  on public.game_hat_prompts;
create policy "Session participants can select Game Hat prompts"
on public.game_hat_prompts
for select
to authenticated
using (public.is_session_participant(session_id));

drop policy if exists "Session participants can create Game Hat prompts"
  on public.game_hat_prompts;
create policy "Session participants can create Game Hat prompts"
on public.game_hat_prompts
for insert
to authenticated
with check (
  public.is_session_participant(session_id)
  and exists (
    select 1
    from public.session_participants
    where session_participants.id = created_by_participant_id
      and session_participants.session_id = game_hat_prompts.session_id
      and session_participants.user_id = (select auth.uid())
      and session_participants.status in ('accepted', 'active', 'disconnected')
  )
  and not is_used
  and used_at is null
);

drop policy if exists "Session participants can select Game Hat rounds"
  on public.game_hat_rounds;
create policy "Session participants can select Game Hat rounds"
on public.game_hat_rounds
for select
to authenticated
using (public.is_session_participant(session_id));

create or replace function public.submit_prompt(
  session_id uuid,
  prompt_text text
)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  current_user_id uuid := auth.uid();
  creator_participant_id uuid;
  created_prompt_id uuid;
begin
  if current_user_id is null then
    raise exception 'Authentication is required' using errcode = '42501';
  end if;

  if nullif(btrim($2), '') is null then
    raise exception 'Prompt text is required' using errcode = '22023';
  end if;

  select session_participants.id
  into creator_participant_id
  from public.session_participants
  where session_participants.session_id = $1
    and session_participants.user_id = current_user_id
    and session_participants.status in ('accepted', 'active', 'disconnected');

  if creator_participant_id is null then
    raise exception 'Session participation is required'
      using errcode = '42501';
  end if;

  insert into public.game_hat_prompts (
    session_id,
    created_by_participant_id,
    prompt_text
  )
  values ($1, creator_participant_id, btrim($2))
  returning id into created_prompt_id;

  return created_prompt_id;
end;
$$;

create or replace function public.draw_prompt(
  session_id uuid,
  active_participant_id uuid
)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  selected_prompt_id uuid;
  next_round_number integer;
  created_round_id uuid;
begin
  if auth.uid() is null then
    raise exception 'Authentication is required' using errcode = '42501';
  end if;

  -- Lock the session to serialize round numbering and active-round creation.
  perform 1
  from public.sessions
  where sessions.id = $1
  for update;

  if not found then
    raise exception 'Session not found' using errcode = 'P0002';
  end if;

  if not public.can_manage_session($1) then
    raise exception 'Only the host or a Circle manager may draw a prompt'
      using errcode = '42501';
  end if;

  if not exists (
    select 1
    from public.session_participants
    where session_participants.id = $2
      and session_participants.session_id = $1
      and session_participants.status in ('accepted', 'active', 'disconnected')
  ) then
    raise exception 'Active participant not found in session'
      using errcode = '23503';
  end if;

  if exists (
    select 1
    from public.game_hat_rounds
    where game_hat_rounds.session_id = $1
      and game_hat_rounds.status = 'active'
  ) then
    raise exception 'The session already has an active Game Hat round'
      using errcode = '55000';
  end if;

  select game_hat_prompts.id
  into selected_prompt_id
  from public.game_hat_prompts
  where game_hat_prompts.session_id = $1
    and not game_hat_prompts.is_used
    and game_hat_prompts.created_by_participant_id <> $2
  order by random()
  limit 1
  for update skip locked;

  if selected_prompt_id is null then
    raise exception 'No eligible unused prompts remain'
      using errcode = 'P0002';
  end if;

  update public.game_hat_prompts
  set
    is_used = true,
    used_at = now()
  where game_hat_prompts.id = selected_prompt_id;

  select coalesce(max(game_hat_rounds.round_number), 0) + 1
  into next_round_number
  from public.game_hat_rounds
  where game_hat_rounds.session_id = $1;

  insert into public.game_hat_rounds (
    session_id,
    round_number,
    active_participant_id,
    prompt_id
  )
  values ($1, next_round_number, $2, selected_prompt_id)
  returning id into created_round_id;

  return created_round_id;
end;
$$;

create or replace function public.complete_round(
  round_id uuid,
  winner_participant_id uuid,
  result text
)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  target_session_id uuid;
  current_status text;
begin
  if auth.uid() is null then
    raise exception 'Authentication is required' using errcode = '42501';
  end if;

  if nullif(btrim($3), '') is null then
    raise exception 'Round result is required' using errcode = '22023';
  end if;

  select game_hat_rounds.session_id, game_hat_rounds.status
  into target_session_id, current_status
  from public.game_hat_rounds
  where game_hat_rounds.id = $1
  for update;

  if not found then
    raise exception 'Game Hat round not found' using errcode = 'P0002';
  end if;

  if not public.can_manage_session(target_session_id) then
    raise exception 'Only the host or a Circle manager may complete a round'
      using errcode = '42501';
  end if;

  if current_status <> 'active' then
    raise exception 'Only an active round can be completed'
      using errcode = '55000';
  end if;

  if $2 is not null and not exists (
    select 1
    from public.session_participants
    where session_participants.id = $2
      and session_participants.session_id = target_session_id
      and session_participants.status in ('accepted', 'active', 'disconnected')
  ) then
    raise exception 'Winner participant not found in session'
      using errcode = '23503';
  end if;

  update public.game_hat_rounds
  set
    winner_participant_id = $2,
    result = btrim($3),
    status = 'completed',
    ended_at = now()
  where game_hat_rounds.id = $1;

  return $1;
end;
$$;

revoke all on function public.submit_prompt(uuid, text) from public;
revoke all on function public.draw_prompt(uuid, uuid) from public;
revoke all on function public.complete_round(uuid, uuid, text) from public;

grant execute on function public.submit_prompt(uuid, text) to authenticated;
grant execute on function public.draw_prompt(uuid, uuid) to authenticated;
grant execute on function public.complete_round(uuid, uuid, text)
  to authenticated;

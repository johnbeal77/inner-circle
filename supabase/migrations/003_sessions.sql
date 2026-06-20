create table if not exists public.sessions (
  id uuid primary key default gen_random_uuid(),
  circle_id uuid not null references public.circles (id) on delete cascade,
  module_key text not null,
  tool_key text not null,
  host_user_id uuid not null references public.profiles (id) on delete restrict,
  state text not null default 'created',
  settings_json jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  completed_at timestamptz,
  constraint sessions_module_key_not_blank check (btrim(module_key) <> ''),
  constraint sessions_tool_key_not_blank check (btrim(tool_key) <> ''),
  constraint sessions_state_valid check (
    state in (
      'created',
      'inviting',
      'waiting',
      'active',
      'paused',
      'completed',
      'cancelled',
      'expired'
    )
  ),
  constraint sessions_settings_json_object check (
    jsonb_typeof(settings_json) = 'object'
  ),
  constraint sessions_completed_at_valid check (
    completed_at is null or completed_at >= created_at
  )
);

create table if not exists public.session_participants (
  id uuid primary key default gen_random_uuid(),
  session_id uuid not null references public.sessions (id) on delete cascade,
  user_id uuid references public.profiles (id) on delete set null,
  display_name text not null,
  role text not null default 'player',
  status text not null default 'invited',
  score integer not null default 0,
  joined_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint session_participants_display_name_not_blank check (
    btrim(display_name) <> ''
  ),
  constraint session_participants_role_valid check (
    role in ('host', 'player', 'active_player')
  ),
  constraint session_participants_status_valid check (
    status in (
      'invited',
      'accepted',
      'declined',
      'active',
      'disconnected',
      'removed'
    )
  )
);

create index if not exists sessions_circle_state_idx
  on public.sessions (circle_id, state);

create index if not exists sessions_host_user_id_idx
  on public.sessions (host_user_id);

create index if not exists session_participants_session_status_idx
  on public.session_participants (session_id, status);

create index if not exists session_participants_user_status_idx
  on public.session_participants (user_id, status)
  where user_id is not null;

create unique index if not exists session_participants_session_user_unique_idx
  on public.session_participants (session_id, user_id)
  where user_id is not null;

-- Security-definer helpers prevent recursive RLS evaluation between sessions and
-- participant records. They answer only the authorization questions used below.
create or replace function public.is_session_participant(target_session_id uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1
    from public.session_participants
    where session_id = target_session_id
      and user_id = auth.uid()
      and status in ('accepted', 'active', 'disconnected')
  );
$$;

create or replace function public.can_manage_session(target_session_id uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1
    from public.sessions
    where id = target_session_id
      and (
        host_user_id = auth.uid()
        or public.can_manage_circle(circle_id)
      )
  );
$$;

revoke all on function public.is_session_participant(uuid) from public;
revoke all on function public.can_manage_session(uuid) from public;
grant execute on function public.is_session_participant(uuid) to authenticated;
grant execute on function public.can_manage_session(uuid) to authenticated;

alter table public.sessions enable row level security;
alter table public.session_participants enable row level security;

drop policy if exists "Circle members and participants can select sessions"
  on public.sessions;
create policy "Circle members and participants can select sessions"
on public.sessions
for select
to authenticated
using (
  public.is_circle_member(circle_id)
  or public.is_session_participant(id)
);

drop policy if exists "Circle members can create sessions" on public.sessions;
create policy "Circle members can create sessions"
on public.sessions
for insert
to authenticated
with check (
  host_user_id = (select auth.uid())
  and state = 'created'
  and public.is_circle_member(circle_id)
);

drop policy if exists "Circle managers and hosts can update sessions"
  on public.sessions;
create policy "Circle managers and hosts can update sessions"
on public.sessions
for update
to authenticated
using (
  host_user_id = (select auth.uid())
  or public.can_manage_circle(circle_id)
)
with check (
  public.is_circle_member(circle_id)
  and (
    host_user_id = (select auth.uid())
    or public.can_manage_circle(circle_id)
  )
);

drop policy if exists "Circle members and participants can select participants"
  on public.session_participants;
create policy "Circle members and participants can select participants"
on public.session_participants
for select
to authenticated
using (
  public.is_session_participant(session_id)
  or exists (
    select 1
    from public.sessions
    where sessions.id = session_id
      and public.is_circle_member(sessions.circle_id)
  )
);

drop policy if exists "Session managers can insert participants"
  on public.session_participants;
create policy "Session managers can insert participants"
on public.session_participants
for insert
to authenticated
with check (public.can_manage_session(session_id));

drop policy if exists "Session managers can update participants"
  on public.session_participants;
create policy "Session managers can update participants"
on public.session_participants
for update
to authenticated
using (public.can_manage_session(session_id))
with check (public.can_manage_session(session_id));

drop policy if exists "Session managers can delete participants"
  on public.session_participants;
create policy "Session managers can delete participants"
on public.session_participants
for delete
to authenticated
using (public.can_manage_session(session_id));

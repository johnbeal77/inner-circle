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
    where sessions.id = $1
      and (
        sessions.host_user_id = auth.uid()
        or public.can_manage_circle(sessions.circle_id)
      )
  );
$$;

revoke all on function public.can_manage_session(uuid) from public;
grant execute on function public.can_manage_session(uuid) to authenticated;

create or replace function public.create_session(
  circle_id uuid,
  module_key text,
  tool_key text,
  settings_json jsonb default '{}'::jsonb
)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
#variable_conflict use_column
declare
  current_user_id uuid := auth.uid();
  host_display_name text;
  created_session_id uuid;
begin
  if current_user_id is null then
    raise exception 'Authentication is required' using errcode = '42501';
  end if;

  if not public.is_circle_member($1) then
    raise exception 'Accepted Circle membership is required'
      using errcode = '42501';
  end if;

  select profiles.display_name
  into host_display_name
  from public.profiles
  where profiles.id = current_user_id;

  if host_display_name is null then
    raise exception 'A profile is required to create a session'
      using errcode = '23503';
  end if;

  insert into public.sessions (
    circle_id,
    module_key,
    tool_key,
    host_user_id,
    state,
    settings_json
  )
  values (
    $1,
    $2,
    $3,
    current_user_id,
    'created',
    coalesce($4, '{}'::jsonb)
  )
  returning id into created_session_id;

  insert into public.session_participants (
    session_id,
    user_id,
    display_name,
    role,
    status
  )
  values (
    created_session_id,
    current_user_id,
    host_display_name,
    'host',
    'active'
  );

  return created_session_id;
end;
$$;

create or replace function public.join_session(
  session_id uuid,
  display_name text
)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
#variable_conflict use_column
declare
  current_user_id uuid := auth.uid();
  target_circle_id uuid;
  target_state text;
  participant_id uuid;
begin
  if current_user_id is null then
    raise exception 'Authentication is required' using errcode = '42501';
  end if;

  if nullif(btrim($2), '') is null then
    raise exception 'Display name is required' using errcode = '22023';
  end if;

  select sessions.circle_id, sessions.state
  into target_circle_id, target_state
  from public.sessions
  where sessions.id = $1
  for share;

  if not found then
    raise exception 'Session not found' using errcode = 'P0002';
  end if;

  if not public.is_circle_member(target_circle_id) then
    raise exception 'Accepted Circle membership is required'
      using errcode = '42501';
  end if;

  if target_state in ('completed', 'cancelled', 'expired') then
    raise exception 'Session is no longer joinable' using errcode = '55000';
  end if;

  insert into public.session_participants (
    session_id,
    user_id,
    display_name,
    role,
    status
  )
  values ($1, current_user_id, btrim($2), 'player', 'accepted')
  on conflict (session_id, user_id) where user_id is not null
  do update set
    display_name = excluded.display_name,
    status = 'accepted',
    updated_at = now()
  returning id into participant_id;

  return participant_id;
end;
$$;

create or replace function public.leave_session(session_id uuid)
returns void
language plpgsql
security definer
set search_path = ''
as $$
declare
  current_user_id uuid := auth.uid();
begin
  if current_user_id is null then
    raise exception 'Authentication is required' using errcode = '42501';
  end if;

  update public.session_participants
  set
    status = 'removed',
    updated_at = now()
  where session_participants.session_id = $1
    and session_participants.user_id = current_user_id;

  if not found then
    raise exception 'Session participant not found' using errcode = 'P0002';
  end if;
end;
$$;

create or replace function public.set_session_state(
  session_id uuid,
  new_state text
)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  current_state text;
begin
  if auth.uid() is null then
    raise exception 'Authentication is required' using errcode = '42501';
  end if;

  select sessions.state
  into current_state
  from public.sessions
  where sessions.id = $1
  for update;

  if not found then
    raise exception 'Session not found' using errcode = 'P0002';
  end if;

  if not public.can_manage_session($1) then
    raise exception 'Only the host or a Circle manager may change session state'
      using errcode = '42501';
  end if;

  if $2 is null or $2 not in (
    'created',
    'inviting',
    'waiting',
    'active',
    'paused',
    'expired'
  ) then
    raise exception 'Invalid session state' using errcode = '22023';
  end if;

  if current_state in ('completed', 'cancelled', 'expired') then
    raise exception 'A terminal session cannot change state'
      using errcode = '55000';
  end if;

  update public.sessions
  set
    state = $2,
    updated_at = now()
  where sessions.id = $1;

  return $1;
end;
$$;

create or replace function public.complete_session(session_id uuid)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  current_state text;
begin
  if auth.uid() is null then
    raise exception 'Authentication is required' using errcode = '42501';
  end if;

  select sessions.state
  into current_state
  from public.sessions
  where sessions.id = $1
  for update;

  if not found then
    raise exception 'Session not found' using errcode = 'P0002';
  end if;

  if not public.can_manage_session($1) then
    raise exception 'Only the host or a Circle manager may complete a session'
      using errcode = '42501';
  end if;

  if current_state = 'completed' then
    return $1;
  end if;

  if current_state in ('cancelled', 'expired') then
    raise exception 'A terminal session cannot be completed'
      using errcode = '55000';
  end if;

  update public.sessions
  set
    state = 'completed',
    completed_at = now(),
    updated_at = now()
  where sessions.id = $1;

  return $1;
end;
$$;

create or replace function public.cancel_session(session_id uuid)
returns uuid
language plpgsql
security definer
set search_path = ''
as $$
declare
  current_state text;
begin
  if auth.uid() is null then
    raise exception 'Authentication is required' using errcode = '42501';
  end if;

  select sessions.state
  into current_state
  from public.sessions
  where sessions.id = $1
  for update;

  if not found then
    raise exception 'Session not found' using errcode = 'P0002';
  end if;

  if not public.can_manage_session($1) then
    raise exception 'Only the host or a Circle manager may cancel a session'
      using errcode = '42501';
  end if;

  if current_state = 'cancelled' then
    return $1;
  end if;

  if current_state in ('completed', 'expired') then
    raise exception 'A terminal session cannot be cancelled'
      using errcode = '55000';
  end if;

  update public.sessions
  set
    state = 'cancelled',
    completed_at = now(),
    updated_at = now()
  where sessions.id = $1;

  return $1;
end;
$$;

revoke all on function public.create_session(uuid, text, text, jsonb) from public;
revoke all on function public.join_session(uuid, text) from public;
revoke all on function public.leave_session(uuid) from public;
revoke all on function public.set_session_state(uuid, text) from public;
revoke all on function public.complete_session(uuid) from public;
revoke all on function public.cancel_session(uuid) from public;

grant execute on function public.create_session(uuid, text, text, jsonb)
  to authenticated;
grant execute on function public.join_session(uuid, text) to authenticated;
grant execute on function public.leave_session(uuid) to authenticated;
grant execute on function public.set_session_state(uuid, text) to authenticated;
grant execute on function public.complete_session(uuid) to authenticated;
grant execute on function public.cancel_session(uuid) to authenticated;

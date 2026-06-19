create table if not exists public.circles (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text,
  owner_user_id uuid not null references public.profiles (id) on delete restrict,
  status text not null default 'active',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint circles_name_not_blank check (btrim(name) <> ''),
  constraint circles_status_valid check (status in ('active', 'archived', 'deleted'))
);

create table if not exists public.memberships (
  id uuid primary key default gen_random_uuid(),
  circle_id uuid not null references public.circles (id) on delete cascade,
  user_id uuid not null references public.profiles (id) on delete cascade,
  role text not null default 'member',
  status text not null default 'invited',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint memberships_role_valid check (role in ('owner', 'admin', 'member')),
  constraint memberships_status_valid check (
    status in ('invited', 'accepted', 'declined', 'removed', 'left')
  ),
  constraint memberships_circle_user_unique unique (circle_id, user_id)
);

create table if not exists public.enabled_modules (
  id uuid primary key default gen_random_uuid(),
  circle_id uuid not null references public.circles (id) on delete cascade,
  module_key text not null,
  enabled_at timestamptz not null default now(),
  enabled_by_user_id uuid not null references public.profiles (id) on delete restrict,
  constraint enabled_modules_key_not_blank check (btrim(module_key) <> ''),
  constraint enabled_modules_circle_key_unique unique (circle_id, module_key)
);

create index if not exists memberships_user_status_idx
  on public.memberships (user_id, status);

create index if not exists memberships_circle_status_idx
  on public.memberships (circle_id, status);

create index if not exists enabled_modules_circle_id_idx
  on public.enabled_modules (circle_id);

-- These helpers bypass table RLS only to answer the membership questions used by
-- policies below. Keeping the checks in one place also prevents recursive policy
-- evaluation between circles and memberships.
create or replace function public.is_circle_member(target_circle_id uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1
    from public.memberships
    where circle_id = target_circle_id
      and user_id = auth.uid()
      and status = 'accepted'
  );
$$;

create or replace function public.can_manage_circle(target_circle_id uuid)
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select
    exists (
      select 1
      from public.circles
      where id = target_circle_id
        and owner_user_id = auth.uid()
        and status = 'active'
    )
    or exists (
      select 1
      from public.memberships
      join public.circles on circles.id = memberships.circle_id
      where memberships.circle_id = target_circle_id
        and memberships.user_id = auth.uid()
        and memberships.role in ('owner', 'admin')
        and memberships.status = 'accepted'
        and circles.status = 'active'
    );
$$;

revoke all on function public.is_circle_member(uuid) from public;
revoke all on function public.can_manage_circle(uuid) from public;
grant execute on function public.is_circle_member(uuid) to authenticated;
grant execute on function public.can_manage_circle(uuid) to authenticated;

alter table public.circles enable row level security;
alter table public.memberships enable row level security;
alter table public.enabled_modules enable row level security;

drop policy if exists "Members can select their circles" on public.circles;
create policy "Members can select their circles"
on public.circles
for select
to authenticated
using (
  owner_user_id = (select auth.uid())
  or public.is_circle_member(id)
);

drop policy if exists "Users can create their own circles" on public.circles;
create policy "Users can create their own circles"
on public.circles
for insert
to authenticated
with check (
  owner_user_id = (select auth.uid())
  and status = 'active'
);

drop policy if exists "Owners can update their circles" on public.circles;
create policy "Owners can update their circles"
on public.circles
for update
to authenticated
using (owner_user_id = (select auth.uid()))
with check (owner_user_id = (select auth.uid()));

drop policy if exists "Members can select circle memberships" on public.memberships;
create policy "Members can select circle memberships"
on public.memberships
for select
to authenticated
using (
  user_id = (select auth.uid())
  or public.is_circle_member(circle_id)
);

drop policy if exists "Circle managers can insert memberships" on public.memberships;
create policy "Circle managers can insert memberships"
on public.memberships
for insert
to authenticated
with check (
  public.can_manage_circle(circle_id)
  and (
    role <> 'owner'
    or exists (
      select 1
      from public.circles
      where id = circle_id
        and owner_user_id = (select auth.uid())
    )
  )
);

drop policy if exists "Circle managers can update memberships" on public.memberships;
create policy "Circle managers can update memberships"
on public.memberships
for update
to authenticated
using (public.can_manage_circle(circle_id))
with check (
  public.can_manage_circle(circle_id)
  and (
    role <> 'owner'
    or exists (
      select 1
      from public.circles
      where id = circle_id
        and owner_user_id = (select auth.uid())
    )
  )
);

drop policy if exists "Circle managers can delete memberships" on public.memberships;
create policy "Circle managers can delete memberships"
on public.memberships
for delete
to authenticated
using (
  public.can_manage_circle(circle_id)
  and role <> 'owner'
);

drop policy if exists "Members can select enabled modules" on public.enabled_modules;
create policy "Members can select enabled modules"
on public.enabled_modules
for select
to authenticated
using (public.is_circle_member(circle_id));

drop policy if exists "Circle managers can insert enabled modules" on public.enabled_modules;
create policy "Circle managers can insert enabled modules"
on public.enabled_modules
for insert
to authenticated
with check (
  public.can_manage_circle(circle_id)
  and enabled_by_user_id = (select auth.uid())
);

drop policy if exists "Circle managers can update enabled modules" on public.enabled_modules;
create policy "Circle managers can update enabled modules"
on public.enabled_modules
for update
to authenticated
using (public.can_manage_circle(circle_id))
with check (
  public.can_manage_circle(circle_id)
  and enabled_by_user_id = (select auth.uid())
);

drop policy if exists "Circle managers can delete enabled modules" on public.enabled_modules;
create policy "Circle managers can delete enabled modules"
on public.enabled_modules
for delete
to authenticated
using (public.can_manage_circle(circle_id));

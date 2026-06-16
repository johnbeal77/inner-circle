# Local Development

## Overview

Inner Circle uses compile-time Dart defines for local Supabase configuration.

Do not commit Supabase project values, service-role keys, or local secret files.

---

## Required Values

The Flutter app requires:

- `SUPABASE_URL`
- `SUPABASE_ANON_KEY`

These values are passed at run time with `--dart-define`.

---

## Run Locally

```bash
flutter pub get

flutter run \
  --dart-define=SUPABASE_URL=your_supabase_project_url \
  --dart-define=SUPABASE_ANON_KEY=your_supabase_anon_key
```

For Chrome:

```bash
flutter run -d chrome \
  --dart-define=SUPABASE_URL=your_supabase_project_url \
  --dart-define=SUPABASE_ANON_KEY=your_supabase_anon_key
```

If either value is missing, the app shows a readable setup error instead of starting authentication.

---

## Phase 2 Supabase Expectations

Phase 2 uses Supabase for:

- client initialization
- email/password authentication
- authenticated session restoration
- profile lookup
- client-side profile upsert

Phase 2 does not implement:

- Circle creation
- memberships
- Game Night logic
- realtime subscriptions
- sessions
- database behavior beyond the profile foundation

---

## Required Profile Table

The app expects the `profiles` table described in `docs/supabase-schema-v1.md`.

Required fields for Phase 2:

- `id uuid primary key references auth.users(id) on delete cascade`
- `display_name text not null`
- `avatar_url text null`
- `created_at timestamptz default now() not null`
- `updated_at timestamptz default now() not null`

RLS should be enabled before using a shared Supabase project.

Users should only be able to:

- insert their own profile where `id = auth.uid()`
- select their own profile where `id = auth.uid()`
- update their own profile where `id = auth.uid()`

Do not add database triggers for profile creation during Phase 2. The Flutter client performs a profile upsert after authentication.

Example Phase 2 SQL:

```sql
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null,
  avatar_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

alter table public.profiles enable row level security;

create policy "Users can insert their own profile"
on public.profiles
for insert
with check (id = auth.uid());

create policy "Users can read their own profile"
on public.profiles
for select
using (id = auth.uid());

create policy "Users can update their own profile"
on public.profiles
for update
using (id = auth.uid())
with check (id = auth.uid());
```

create table if not exists public.gym_tracker_data (
 user_id uuid primary key references auth.users(id) on delete cascade,
 attendance jsonb not null default '[]'::jsonb,
 weights jsonb not null default '[]'::jsonb,
 workouts jsonb not null default '[]'::jsonb,
 updated_at timestamptz not null default now()
);
alter table public.gym_tracker_data enable row level security;
create policy "read own tracker" on public.gym_tracker_data for select to authenticated using (auth.uid()=user_id);
create policy "insert own tracker" on public.gym_tracker_data for insert to authenticated with check (auth.uid()=user_id);
create policy "update own tracker" on public.gym_tracker_data for update to authenticated using (auth.uid()=user_id) with check (auth.uid()=user_id);

-- Supabase SQL Editor에서 실행합니다.
create table if not exists public.team_members (email text primary key);
create table if not exists public.companies (id uuid primary key default gen_random_uuid(),name text not null,contact text default '',status text default '컨택 예정',reply text default '',created_at timestamptz default now());
create table if not exists public.tasks (id uuid primary key default gen_random_uuid(),company_id uuid not null references public.companies(id) on delete cascade,kind text not null check(kind in ('question','discussion')),content text not null,done boolean not null default false,created_at timestamptz default now());
create or replace function public.is_team_member() returns boolean language sql stable security definer set search_path=public as $$ select exists(select 1 from public.team_members where lower(email)=lower(auth.jwt()->>'email')) $$;
revoke all on function public.is_team_member() from public;
grant execute on function public.is_team_member() to authenticated;
alter table public.team_members enable row level security;
alter table public.companies enable row level security;
alter table public.tasks enable row level security;
drop policy if exists "team companies" on public.companies;
create policy "team companies" on public.companies for all to authenticated using (public.is_team_member()) with check (public.is_team_member());
drop policy if exists "team tasks" on public.tasks;
create policy "team tasks" on public.tasks for all to authenticated using (public.is_team_member()) with check (public.is_team_member());
grant select,insert,update,delete on public.companies,public.tasks to authenticated;
-- 아래 이메일을 실제 팀원 이메일로 바꾸고 실행하세요 (SQL Editor에서만 관리)
-- insert into public.team_members(email) values ('teammate@example.com') on conflict do nothing;
alter publication supabase_realtime add table public.companies;
alter publication supabase_realtime add table public.tasks;

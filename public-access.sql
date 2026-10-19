-- WARNING: Public access. Anyone with the URL and anon key can read, edit and delete all records.
-- Run AFTER schema.sql in Supabase SQL Editor.
drop policy if exists "team companies" on public.companies;
drop policy if exists "team tasks" on public.tasks;
create policy "public companies" on public.companies for all to anon, authenticated using (true) with check (true);
create policy "public tasks" on public.tasks for all to anon, authenticated using (true) with check (true);
grant select, insert, update, delete on public.companies, public.tasks to anon, authenticated;

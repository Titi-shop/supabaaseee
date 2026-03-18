CREATE TABLE IF NOT EXISTS public.addresses (
  id uuid primary key default gen_random_uuid(),

  user_id text not null
    references public.users(pi_uid)
    on delete cascade,

  -- CONTACT
  full_name text not null,
  phone text not null,

  -- LOCATION
  country text not null,
  province text not null,
  district text,
  ward text,
  address_line text not null,
  postal_code text,

  -- TYPE
  label text default 'home'
    check (label in ('home','office','other')),

  is_default boolean not null default false,

  -- SYSTEM
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

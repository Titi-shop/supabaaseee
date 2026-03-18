CREATE TABLE IF NOT EXISTS public.users (
  pi_uid text primary key,

  username text not null unique,

  role text not null default 'customer'
    check (role in ('customer','seller','admin')),

  wallet_address text unique,

  is_verified boolean not null default false,
  is_seller boolean not null default false,
  is_banned boolean not null default false,

  last_login_at timestamptz,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- ❌ CHỈ dùng khi reset DB (không dùng production)
-- drop table if exists public.user_profiles cascade;

CREATE TABLE IF NOT EXISTS public.user_profiles (

  user_id text primary key
    references public.users(pi_uid)
    on delete cascade,

  -- BASIC INFO
  full_name text,
  phone text,
  avatar_url text,
  bio text,
  email text,

  -- ADDRESS
  country text default 'VN',
  province text,
  district text,
  ward text,
  address_line text,
  postal_code text,

  -- SHOP
  shop_name text,
  shop_slug text unique,
  shop_description text,
  shop_banner text,

  -- STATS
  rating numeric(3,2) default 0,
  total_reviews integer default 0,
  total_sales integer default 0,

  -- SYSTEM
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

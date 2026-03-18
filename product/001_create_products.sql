CREATE TABLE IF NOT EXISTS public.products (
  id uuid primary key default gen_random_uuid(),

  name text not null,
  slug text unique not null,

  short_description text default '',
  description text default '',
  detail text default '',

  thumbnail text,
  images text[] not null default '{}',
  detail_images text[] not null default '{}',
  video_url text,

  price numeric(20,8) not null check (price > 0),

  sale_price numeric(20,8)
  check (
    sale_price is null
    or (sale_price > 0 and sale_price <= price)
  ),

  currency text not null default 'PI',

  stock integer not null default 0 check (stock >= 0),
  is_unlimited boolean not null default false,

  category_id integer,

  seller_id text not null
  references public.users(pi_uid)
  on delete cascade,

  views integer not null default 0,
  sold integer not null default 0,

  rating_avg numeric(3,2) not null default 0,
  rating_count integer not null default 0,

  status text not null default 'draft'
  check (
    status in ('draft','active','inactive','archived','banned')
  ),

  is_featured boolean not null default false,
  is_digital boolean not null default false,

  sale_start timestamptz,
  sale_end timestamptz,

  meta_title text,
  meta_description text,

  deleted_at timestamptz,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint sale_time_check
  check (
    sale_start is null
    or sale_end is null
    or sale_start <= sale_end
  )
);

ALTER TABLE products
ADD COLUMN is_active boolean DEFAULT true;

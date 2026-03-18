CREATE TABLE IF NOT EXISTS public.reviews (
  id uuid primary key default gen_random_uuid(),

  order_id uuid not null
    references public.orders(id)
    on delete cascade,

  order_item_id uuid not null
    references public.order_items(id)
    on delete cascade,

  product_id uuid not null
    references public.products(id)
    on delete cascade,

  seller_id text not null
    references public.users(pi_uid)
    on delete cascade,

  user_id text not null
    references public.users(pi_uid)
    on delete cascade,

  -- SNAPSHOT
  product_name text not null,
  product_thumbnail text,

  -- REVIEW DATA
  rating integer not null
    check (rating between 1 and 5),

  comment text,

  is_verified_purchase boolean not null default true,
  is_hidden boolean not null default false,

  seller_reply text,
  seller_replied_at timestamptz,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  -- mỗi order_item chỉ review 1 lần / user
  UNIQUE (order_item_id, user_id)
);

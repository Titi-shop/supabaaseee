DROP TABLE IF EXISTS public.order_items CASCADE;

CREATE TABLE public.order_items (
  id uuid primary key default gen_random_uuid(),

  order_id uuid not null
    references public.orders(id)
    on delete cascade,

  product_id uuid
    references public.products(id)
    on delete set null,

  seller_id text not null
    references public.users(pi_uid)
    on delete cascade,

  product_name text not null,
  product_slug text,

  thumbnail text not null,
  images text[],

  unit_price numeric(20,8) not null check (unit_price >= 0),
  quantity integer not null check (quantity > 0),
  total_price numeric(20,8) not null check (total_price >= 0),

  is_digital boolean not null default false,

  status text not null default 'pending'
    check (status in (
      'pending',
      'confirmed',
      'shipping',
      'completed',
      'returned',
      'cancelled'
    )),

  tracking_code text,

  shipped_at timestamptz,
  delivered_at timestamptz,

  seller_message text,
  seller_cancel_reason text,

  created_at timestamptz not null default now(),

  constraint order_items_shipping_requires_time
    check (
      status != 'shipping'
      or shipped_at is not null
    ),

  constraint order_items_completed_requires_time
    check (
      status != 'completed'
      or delivered_at is not null
    )
);

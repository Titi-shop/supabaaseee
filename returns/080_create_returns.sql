CREATE TABLE IF NOT EXISTS public.returns (
  id uuid primary key default gen_random_uuid(),

  -- RELATION
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

  buyer_id text not null
    references public.users(pi_uid)
    on delete cascade,

  -- SNAPSHOT
  product_name text not null,
  product_thumbnail text,
  quantity integer not null check (quantity > 0),

  -- RETURN INFO
  reason text not null,
  description text,
  images text[],

  refund_amount integer not null check (refund_amount >= 0),

  -- STATUS FLOW
  status text not null default 'pending'
    check (status in (
      'pending',
      'seller_reviewing',
      'approved',
      'rejected',
      'shipping_back',
      'received',
      'refunded',
      'cancelled'
    )),

  seller_note text,
  admin_note text,

  reviewed_by text
    references public.users(pi_uid)
    on delete set null,

  reviewed_at timestamptz,
  refunded_at timestamptz,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  UNIQUE (order_item_id)
);

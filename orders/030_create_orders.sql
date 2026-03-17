CREATE TABLE IF NOT EXISTS public.orders (
  id uuid primary key default gen_random_uuid(),

  order_number text unique not null,

  buyer_id text not null
    references public.users(pi_uid)
    on delete cascade,

  pi_payment_id text not null unique,
  pi_txid text not null unique,

  payment_status text not null default 'paid'
    check (payment_status in ('paid','refunded')),

  paid_at timestamptz not null default now(),
  refunded_at timestamptz,

  subtotal numeric(20,8) not null check (subtotal >= 0),
  shipping_fee numeric(20,8) not null default 0 check (shipping_fee >= 0),
  discount numeric(20,8) not null default 0 check (discount >= 0),
  tax numeric(20,8) not null default 0 check (tax >= 0),
  total numeric(20,8) not null check (total >= 0),

  currency text not null default 'PI',

  status text not null default 'pending'
    check (status in (
      'pending','pickup','shipping','completed','cancelled','refunded'
    )),

  cancel_reason text,
  cancelled_at timestamptz,

  shipping_name text not null,
  shipping_phone text not null,
  shipping_address text not null,
  shipping_provider text,
  shipping_country text,
  shipping_postal_code text,

  buyer_note text,
  admin_note text,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint orders_completed_requires_paid
    check (
      status != 'completed'
      or payment_status = 'paid'
    ),

  constraint orders_no_shipping_if_cancelled
    check (
      status != 'shipping'
      or cancelled_at is null
    )
);

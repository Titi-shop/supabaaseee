CREATE TABLE IF NOT EXISTS public.notifications (
  id uuid primary key default gen_random_uuid(),

  user_id text not null
    references public.users(pi_uid)
    on delete cascade,

  -- TYPE
  type text not null
    check (type in (
      'order_created',
      'order_confirmed',
      'order_shipping',
      'order_completed',
      'order_cancelled',
      'payment_success',
      'payment_failed',
      'review_received',
      'seller_request_approved',
      'seller_request_rejected',
      'return_requested',
      'return_approved',
      'return_rejected',
      'system'
    )),

  title text not null,
  message text not null,

  -- OPTIONAL RELATION
  order_id uuid
    references public.orders(id)
    on delete cascade,

  order_item_id uuid
    references public.order_items(id)
    on delete cascade,

  product_id uuid
    references public.products(id)
    on delete cascade,

  return_id uuid
    references public.returns(id)
    on delete cascade,

  -- STATUS
  is_read boolean not null default false,
  read_at timestamptz,

  created_at timestamptz not null default now()
);

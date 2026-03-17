CREATE INDEX IF NOT EXISTS idx_orders_buyer
ON public.orders (buyer_id);

CREATE INDEX IF NOT EXISTS idx_orders_status
ON public.orders (status);

CREATE INDEX IF NOT EXISTS idx_orders_payment_status
ON public.orders (payment_status);

CREATE INDEX IF NOT EXISTS idx_orders_created
ON public.orders (created_at DESC);

CREATE INDEX IF NOT EXISTS idx_orders_order_number
ON public.orders (order_number);

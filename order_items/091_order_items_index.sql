CREATE INDEX IF NOT EXISTS idx_order_items_order
ON public.order_items (order_id);

CREATE INDEX IF NOT EXISTS idx_order_items_product
ON public.order_items (product_id);

CREATE INDEX IF NOT EXISTS idx_order_items_seller
ON public.order_items (seller_id);

CREATE INDEX IF NOT EXISTS idx_order_items_status
ON public.order_items (status);

CREATE INDEX IF NOT EXISTS idx_order_items_created
ON public.order_items (created_at DESC);

CREATE INDEX IF NOT EXISTS idx_order_items_seller_status
ON public.order_items (seller_id, status);

CREATE INDEX IF NOT EXISTS idx_order_items_seller_created
ON public.order_items (seller_id, created_at DESC);

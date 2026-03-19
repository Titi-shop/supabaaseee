CREATE INDEX IF NOT EXISTS idx_returns_order
ON public.returns(order_id);

CREATE INDEX IF NOT EXISTS idx_returns_seller
ON public.returns(seller_id);

CREATE INDEX IF NOT EXISTS idx_returns_buyer
ON public.returns(buyer_id);

CREATE INDEX IF NOT EXISTS idx_returns_status
ON public.returns(status);

CREATE INDEX IF NOT EXISTS idx_returns_created
ON public.returns(created_at DESC);

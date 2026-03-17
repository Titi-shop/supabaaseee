CREATE INDEX IF NOT EXISTS idx_products_seller ON public.products(seller_id);
CREATE INDEX IF NOT EXISTS idx_products_status ON public.products(status);
CREATE INDEX IF NOT EXISTS idx_products_slug ON public.products(slug);
CREATE INDEX IF NOT EXISTS idx_products_category ON public.products(category_id);
CREATE INDEX IF NOT EXISTS idx_products_featured ON public.products(is_featured);
CREATE INDEX IF NOT EXISTS idx_products_created ON public.products(created_at DESC);
CREATE INDEX IF NOT EXISTS idx_products_sale_window ON public.products(sale_start, sale_end);
CREATE INDEX IF NOT EXISTS idx_products_active ON public.products(status, deleted_at);

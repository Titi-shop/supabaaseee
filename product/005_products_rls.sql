ALTER TABLE public.products ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Public can view active products" ON public.products;
CREATE POLICY "Public can view active products"
ON public.products
FOR SELECT
USING (
  status = 'active'
  AND deleted_at IS NULL
);

DROP POLICY IF EXISTS "Seller can insert own product" ON public.products;
CREATE POLICY "Seller can insert own product"
ON public.products
FOR INSERT
WITH CHECK (seller_id = auth.uid()::text);

DROP POLICY IF EXISTS "Seller can update own product" ON public.products;
CREATE POLICY "Seller can update own product"
ON public.products
FOR UPDATE
USING (seller_id = auth.uid()::text);

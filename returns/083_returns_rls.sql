ALTER TABLE public.returns ENABLE ROW LEVEL SECURITY;


👤 Buyer: xem return của mình
CREATE POLICY "returns_select_buyer"
ON public.returns
FOR SELECT
USING (
  buyer_id = auth.uid()::text
);



🛒 Seller: xem return liên quan
CREATE POLICY "returns_select_seller"
ON public.returns
FOR SELECT
USING (
  seller_id = auth.uid()::text
);


👤 Buyer: tạo request
CREATE POLICY "returns_insert_buyer"
ON public.returns
FOR INSERT
WITH CHECK (
  buyer_id = auth.uid()::text
);


👤 Buyer: tạo request
CREATE POLICY "returns_insert_buyer"
ON public.returns
FOR INSERT
WITH CHECK (
  buyer_id = auth.uid()::text
);



🛒 Seller: xử lý return
CREATE POLICY "returns_update_seller"
ON public.returns
FOR UPDATE
USING (
  seller_id = auth.uid()::text
);

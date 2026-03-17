CREATE POLICY "orders_select_own"
ON public.orders
FOR SELECT
USING (
  buyer_id = auth.uid()::text
);


CREATE POLICY "orders_insert_own"
ON public.orders
FOR INSERT
WITH CHECK (
  buyer_id = auth.uid()::text
);


CREATE POLICY "orders_update_own"
ON public.orders
FOR UPDATE
USING (
  buyer_id = auth.uid()::text
);



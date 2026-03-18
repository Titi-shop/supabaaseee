ALTER TABLE public.reviews ENABLE ROW LEVEL SECURITY;

CREATE POLICY "reviews_select_public"
ON public.reviews
FOR SELECT
USING (is_hidden = false);

CREATE POLICY "reviews_insert_own"
ON public.reviews
FOR INSERT
WITH CHECK (
  user_id = auth.uid()::text
);

CREATE POLICY "reviews_update_own"
ON public.reviews
FOR UPDATE
USING (
  user_id = auth.uid()::text
);


CREATE POLICY "reviews_seller_reply"
ON public.reviews
FOR UPDATE
USING (
  seller_id = auth.uid()::text
);


CREATE UNIQUE INDEX IF NOT EXISTS idx_reviews_unique_order_item
ON public.reviews(order_item_id);

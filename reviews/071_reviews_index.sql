CREATE INDEX IF NOT EXISTS idx_reviews_product
ON public.reviews(product_id);

CREATE INDEX IF NOT EXISTS idx_reviews_seller
ON public.reviews(seller_id);

CREATE INDEX IF NOT EXISTS idx_reviews_user
ON public.reviews(user_id);

CREATE INDEX IF NOT EXISTS idx_reviews_created
ON public.reviews(created_at DESC);

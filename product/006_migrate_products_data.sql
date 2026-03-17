INSERT INTO public.products (
  id, name, slug, short_description, description, detail,
  thumbnail, images, detail_images, video_url,
  price, sale_price, currency,
  stock, is_unlimited,
  category_id, seller_id,
  views, sold,
  rating_avg, rating_count,
  status, is_featured, is_digital,
  sale_start, sale_end,
  meta_title, meta_description,
  deleted_at, created_at, updated_at
)
SELECT
  id, name, slug, short_description, description, detail,
  thumbnail, images, detail_images, video_url,
  price, sale_price, currency,
  stock, is_unlimited,
  category_id, seller_id,
  views, sold,
  COALESCE(rating_avg, 0),
  COALESCE(rating_count, 0),
  status, is_featured, is_digital,
  sale_start, sale_end,
  meta_title, meta_description,
  deleted_at, created_at, updated_at
FROM public.products_backup;

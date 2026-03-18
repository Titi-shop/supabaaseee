CREATE INDEX IF NOT EXISTS idx_user_profiles_country
ON public.user_profiles(country);

CREATE INDEX IF NOT EXISTS idx_user_profiles_shop_slug
ON public.user_profiles(shop_slug);

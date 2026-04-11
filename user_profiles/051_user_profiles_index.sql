/* ================= PRIMARY ================= */
/* auto: user_profiles_pkey (id) */


/* ================= OWNER ================= */

-- 🔥 mỗi user 1 profile (lookup cực nhanh)
CREATE UNIQUE INDEX IF NOT EXISTS idx_user_profiles_user_id
ON public.user_profiles(user_id);


/* ================= SHOP ================= */

-- 🔥 slug shop (route /shop/slug)
CREATE UNIQUE INDEX IF NOT EXISTS idx_user_profiles_shop_slug
ON public.user_profiles(shop_slug);

-- 🔥 tìm theo shop name (search cơ bản)
CREATE INDEX IF NOT EXISTS idx_user_profiles_shop_name
ON public.user_profiles(shop_name);

-- 🔥 filter theo trạng thái shop
CREATE INDEX IF NOT EXISTS idx_user_profiles_shop_status
ON public.user_profiles(shop_status);


/* ================= SELLER ================= */

-- 🔥 danh sách seller
CREATE INDEX IF NOT EXISTS idx_user_profiles_is_seller
ON public.user_profiles(is_seller);

-- 🔥 seller active (PRO)
CREATE INDEX IF NOT EXISTS idx_user_profiles_seller_active
ON public.user_profiles(is_seller, shop_status)
WHERE deleted_at IS NULL;


/* ================= LOCATION ================= */

-- 🔥 filter theo khu vực (quan trọng)
CREATE INDEX IF NOT EXISTS idx_user_profiles_region
ON public.user_profiles(region);

CREATE INDEX IF NOT EXISTS idx_user_profiles_region_district
ON public.user_profiles(region, district);


/* ================= ANALYTICS ================= */

-- 🔥 top seller theo rating
CREATE INDEX IF NOT EXISTS idx_user_profiles_rating
ON public.user_profiles(rating_avg DESC);

-- 🔥 theo số đơn
CREATE INDEX IF NOT EXISTS idx_user_profiles_total_orders
ON public.user_profiles(total_orders DESC);

-- 🔥 theo doanh số
CREATE INDEX IF NOT EXISTS idx_user_profiles_total_sales
ON public.user_profiles(total_sales DESC);

-- 🔥 combo ranking (PRO)
CREATE INDEX IF NOT EXISTS idx_user_profiles_ranking
ON public.user_profiles(rating_avg DESC, total_sales DESC)
WHERE is_seller = true AND deleted_at IS NULL;


/* ================= CONTACT ================= */

-- 🔥 lookup email (optional)
CREATE INDEX IF NOT EXISTS idx_user_profiles_email
ON public.user_profiles(email);

-- 🔥 lookup phone
CREATE INDEX IF NOT EXISTS idx_user_profiles_phone
ON public.user_profiles(phone);


/* ================= GEO ================= */

-- 🔥 map / location query
CREATE INDEX IF NOT EXISTS idx_user_profiles_geo
ON public.user_profiles(latitude, longitude)
WHERE latitude IS NOT NULL AND longitude IS NOT NULL;


/* ================= SOFT DELETE ================= */

-- 🔥 chỉ lấy profile active
CREATE INDEX IF NOT EXISTS idx_user_profiles_not_deleted
ON public.user_profiles(id)
WHERE deleted_at IS NULL;


/* ================= TIME ================= */

-- 🔥 sort profile mới
CREATE INDEX IF NOT EXISTS idx_user_profiles_created_at
ON public.user_profiles(created_at DESC);

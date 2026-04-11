CREATE TABLE user_profiles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

  user_id uuid NOT NULL UNIQUE,

  /* ================= BASIC ================= */

  full_name text NOT NULL DEFAULT '',
  phone text NOT NULL DEFAULT '',
  email text NOT NULL DEFAULT '',

  avatar_url text NOT NULL DEFAULT '',
  bio text NOT NULL DEFAULT '',

  /* ================= LOCATION ================= */

  country text NOT NULL DEFAULT '',
  region text,          -- 🔥 replace province
  district text,
  ward text,
  address_line text,
  postal_code text,

  latitude numeric,
  longitude numeric,

  /* ================= SHOP ================= */

  shop_name text NOT NULL DEFAULT '',
  shop_slug text NOT NULL DEFAULT '',
  shop_description text NOT NULL DEFAULT '',
  shop_banner text NOT NULL DEFAULT '',

  shop_status text NOT NULL DEFAULT 'active'
    CHECK (shop_status IN ('active', 'inactive', 'banned')),

  /* ================= ANALYTICS ================= */

  rating_avg numeric NOT NULL DEFAULT 0,
  rating_count integer NOT NULL DEFAULT 0,

  total_sales integer NOT NULL DEFAULT 0,
  total_orders integer NOT NULL DEFAULT 0,

  /* ================= FLAGS ================= */

  is_seller boolean NOT NULL DEFAULT false,
  is_verified boolean NOT NULL DEFAULT false,

  /* ================= TIME ================= */

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz
);

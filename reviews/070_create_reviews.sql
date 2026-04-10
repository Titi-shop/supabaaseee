CREATE TABLE reviews (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

  /* ================= RELATION ================= */

  user_id uuid NOT NULL,
  seller_id uuid NOT NULL,

  order_id uuid NOT NULL,
  order_item_id uuid NOT NULL,

  product_id uuid NOT NULL,
  variant_id uuid,

  /* ================= SNAPSHOT ================= */

  product_name text NOT NULL DEFAULT '',
  product_slug text NOT NULL DEFAULT '',
  product_thumbnail text NOT NULL DEFAULT '',

  unit_price numeric NOT NULL DEFAULT 0,

  /* ================= RATING ================= */

  rating integer NOT NULL CHECK (rating >= 1 AND rating <= 5),

  /* optional breakdown */
  rating_quality integer,
  rating_shipping integer,
  rating_service integer,

  /* ================= CONTENT ================= */

  comment text NOT NULL DEFAULT '',

  images text[] NOT NULL DEFAULT '{}',
  videos text[] NOT NULL DEFAULT '{}',

  /* ================= FLAGS ================= */

  is_verified_purchase boolean NOT NULL DEFAULT true,
  is_hidden boolean NOT NULL DEFAULT false,

  status text NOT NULL DEFAULT 'published',
  -- published | hidden | pending | rejected

  /* ================= SELLER REPLY ================= */

  seller_reply text,
  seller_replied_at timestamptz,

  /* ================= MODERATION ================= */

  is_flagged boolean NOT NULL DEFAULT false,
  flag_reason text,

  reported_count integer NOT NULL DEFAULT 0,

  /* ================= METADATA ================= */

  ip_address text,
  user_agent text,

  /* ================= TIME ================= */

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz
);

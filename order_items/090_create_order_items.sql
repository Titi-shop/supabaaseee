CREATE TABLE order_items (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  order_id uuid NOT NULL,
  seller_id uuid NOT NULL,
  product_id uuid,
  variant_id uuid,

  product_name text NOT NULL DEFAULT '',
  product_slug text NOT NULL DEFAULT '',
  thumbnail text NOT NULL DEFAULT '',
  images text[] NOT NULL DEFAULT '{}',

  variant_name text NOT NULL DEFAULT '',
  variant_value text NOT NULL DEFAULT '',

  is_digital boolean NOT NULL DEFAULT false,

  unit_price numeric NOT NULL DEFAULT 0,
  quantity integer NOT NULL DEFAULT 1,
  total_price numeric NOT NULL DEFAULT 0,

  currency text NOT NULL DEFAULT 'PI'
    CHECK (currency = 'PI'),

  status text NOT NULL DEFAULT 'pending'
    CHECK (status IN ('pending','confirmed','shipping','completed','cancelled')),

  seller_message text NOT NULL DEFAULT '',
  seller_cancel_reason text NOT NULL DEFAULT '',

  tracking_code text,
  shipped_at timestamptz,
  delivered_at timestamptz,

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE orders (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

  /* ================= BASIC ================= */

  order_number text NOT NULL UNIQUE,

  buyer_id uuid NOT NULL,
  seller_id uuid NOT NULL,

  /* ================= PAYMENT ================= */

  pi_payment_id text UNIQUE,
  pi_txid text UNIQUE,
  idempotency_key text UNIQUE,

  payment_status text NOT NULL DEFAULT 'pending'
    CHECK (payment_status IN ('pending', 'paid', 'refunded')),

  paid_at timestamptz,
  refunded_at timestamptz,

  /* ================= PRICE ================= */

  subtotal numeric NOT NULL DEFAULT 0,
  shipping_fee numeric NOT NULL DEFAULT 0,
  discount numeric NOT NULL DEFAULT 0,
  tax numeric NOT NULL DEFAULT 0,
  total numeric NOT NULL DEFAULT 0,

  currency text NOT NULL DEFAULT 'PI'
    CHECK (currency = 'PI'),

  /* ================= STATUS ================= */

  status text NOT NULL DEFAULT 'pending'
    CHECK (status IN (
      'pending',
      'confirmed',
      'shipping',
      'completed',
      'cancelled'
    )),

  cancel_reason text,
  cancelled_at timestamptz,

  /* ================= SHIPPING ================= */

  shipping_name text NOT NULL DEFAULT '',
  shipping_phone text NOT NULL DEFAULT '',

  shipping_address_line text NOT NULL DEFAULT '',
  shipping_ward text,
  shipping_district text,
  shipping_region text,
  shipping_country text NOT NULL DEFAULT '',
  shipping_postal_code text,

  shipping_provider text,

  shipping_zone text
    CHECK (shipping_zone IN (
      'local',
      'domestic',
      'international'
    )),

  /* ================= NOTE ================= */

  buyer_note text NOT NULL DEFAULT '',
  admin_note text NOT NULL DEFAULT '',

  /* ================= TIME ================= */

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz
);

CREATE TABLE notifications (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

  /* ================= OWNER ================= */

  user_id uuid NOT NULL,

  /* ================= TYPE ================= */

  type text NOT NULL,
  -- order_created
  -- order_confirmed
  -- order_shipping
  -- order_completed
  -- order_cancelled
  -- return_created
  -- return_approved
  -- return_rejected
  -- refund_completed
  -- system

  title text NOT NULL DEFAULT '',
  body text NOT NULL DEFAULT '',

  /* ================= RELATION ================= */

  order_id uuid,
  return_id uuid,

  /* ================= ACTION ================= */

  action_url text, -- deep link (mobile/web)
  action_type text, -- open_order / open_return / external

  /* ================= STATUS ================= */

  is_read boolean NOT NULL DEFAULT false,
  read_at timestamptz,

  /* ================= PRIORITY ================= */

  priority text NOT NULL DEFAULT 'normal',
  -- low | normal | high | urgent

  /* ================= DELIVERY ================= */

  is_pushed boolean NOT NULL DEFAULT false, -- đã push chưa
  pushed_at timestamptz,

  /* ================= METADATA ================= */

  image_url text,
  extra_data jsonb, -- flexible payload

  /* ================= TIME ================= */

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz
);

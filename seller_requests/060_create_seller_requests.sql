CREATE TABLE seller_requests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

  user_id uuid NOT NULL,

  /* USER SNAPSHOT (freeze data khi apply) */
  username text NOT NULL DEFAULT '',
  email text NOT NULL DEFAULT '',
  phone text NOT NULL DEFAULT '',

  /* SHOP INFO */
  shop_name text NOT NULL DEFAULT '',
  shop_slug text NOT NULL DEFAULT '',
  shop_description text NOT NULL DEFAULT '',
  shop_logo text NOT NULL DEFAULT '',
  shop_banner text NOT NULL DEFAULT '',

  /* KYC */
  identity_number text NOT NULL DEFAULT '',
  identity_document_url text NOT NULL DEFAULT '',

  /* STATUS */
  status text NOT NULL DEFAULT 'pending',
  -- pending | approved | rejected | blocked

  rejection_reason text,
  admin_note text NOT NULL DEFAULT '',

  /* REVIEW */
  reviewed_by uuid, -- admin user_id
  reviewed_at timestamptz,

  /* IDEMPOTENCY */
  request_key text UNIQUE, -- chống spam submit

  /* METADATA */
  ip_address text,
  user_agent text,

  /* TIME */
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz
);

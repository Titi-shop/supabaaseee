CREATE TABLE public.users (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

  /* ================= AUTH (PI) ================= */

  pi_uid text NOT NULL UNIQUE,

  /* ================= BASIC ================= */

  username text NOT NULL DEFAULT '',
  role text NOT NULL DEFAULT 'customer'
    CHECK (role IN ('customer', 'seller', 'admin')),

  is_active boolean NOT NULL DEFAULT true,
  is_banned boolean NOT NULL DEFAULT false,

  /* ================= META ================= */

  last_login_at timestamptz,
  login_count integer NOT NULL DEFAULT 0,

  /* ================= FLAGS ================= */

  is_verified boolean NOT NULL DEFAULT false,

  /* ================= TIME ================= */

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz
);

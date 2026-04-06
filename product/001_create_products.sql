CREATE TABLE products (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),

  seller_id uuid NOT NULL,

  name text NOT NULL DEFAULT '',
  slug text NOT NULL DEFAULT '',

  short_description text NOT NULL DEFAULT '',
  description text NOT NULL DEFAULT '',
  detail text NOT NULL DEFAULT '',

  thumbnail text NOT NULL DEFAULT '',
  images text[] NOT NULL DEFAULT '{}',
  detail_images text[] NOT NULL DEFAULT '{}',

  video_url text NOT NULL DEFAULT '',

  price numeric NOT NULL DEFAULT 0,
  sale_price numeric,
  final_price numeric NOT NULL DEFAULT 0,

  currency text NOT NULL DEFAULT 'PI',

  stock integer NOT NULL DEFAULT 0,
  is_unlimited boolean NOT NULL DEFAULT false,

  sold integer NOT NULL DEFAULT 0,
  views integer NOT NULL DEFAULT 0,

  rating_avg numeric NOT NULL DEFAULT 0,
  rating_count integer NOT NULL DEFAULT 0,

  is_active boolean NOT NULL DEFAULT true,
  is_featured boolean NOT NULL DEFAULT false,
  is_digital boolean NOT NULL DEFAULT false,

  status text NOT NULL DEFAULT 'active',

  category_id integer,

  sale_start timestamptz,
  sale_end timestamptz,

  meta_title text NOT NULL DEFAULT '',
  meta_description text NOT NULL DEFAULT '',

  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  deleted_at timestamptz
);

/* =========================================================
   PRODUCTS — V2 PRODUCTION SCHEMA
   Titi Marketplace
========================================================= */

CREATE TABLE public.products (
  /* =====================================================
     PRIMARY
  ===================================================== */

  id uuid PRIMARY KEY
    DEFAULT gen_random_uuid(),

  seller_id uuid NOT NULL,

  /* =====================================================
     BASIC INFO
  ===================================================== */

  name text NOT NULL
    DEFAULT '',

  slug text NOT NULL
    DEFAULT '',

  short_description text NOT NULL
    DEFAULT '',

  description text NOT NULL
    DEFAULT '',

  detail text NOT NULL
    DEFAULT '',

  /* =====================================================
     MEDIA
  ===================================================== */

  thumbnail text NOT NULL
    DEFAULT '',

  images text[] NOT NULL
    DEFAULT '{}',

  detail_images text[] NOT NULL
    DEFAULT '{}',

  video_url text NOT NULL
    DEFAULT '',

  /* =====================================================
     CATEGORY
  ===================================================== */

  category_id integer,

  /* =====================================================
     PRODUCT TYPE
  ===================================================== */

  has_variants boolean NOT NULL
    DEFAULT false,

  is_digital boolean NOT NULL
    DEFAULT false,

  /* =====================================================
     PRICE
  ===================================================== */

  price numeric(20,8) NOT NULL
    DEFAULT 0,

  sale_price numeric(20,8),

  final_price numeric(20,8) NOT NULL
    DEFAULT 0,

  currency text NOT NULL
    DEFAULT 'PI'
    CHECK (currency = 'PI'),

  /* =====================================================
     FLASH SALE
  ===================================================== */

  sale_enabled boolean NOT NULL
    DEFAULT false,

  sale_stock integer NOT NULL
    DEFAULT 0,

  sale_sold integer NOT NULL
    DEFAULT 0,

  sale_start timestamptz,

  sale_end timestamptz,

  /* =====================================================
     STOCK
  ===================================================== */

  stock integer NOT NULL
    DEFAULT 0,

  is_unlimited boolean NOT NULL
    DEFAULT false,

  sold integer NOT NULL
    DEFAULT 0,

  /* =====================================================
     ANALYTICS
  ===================================================== */

  views integer NOT NULL
    DEFAULT 0,

  rating_avg numeric(10,2) NOT NULL
    DEFAULT 0,

  rating_count integer NOT NULL
    DEFAULT 0,

  /* =====================================================
     SEO
  ===================================================== */

  meta_title text NOT NULL
    DEFAULT '',

  meta_description text NOT NULL
    DEFAULT '',

  /* =====================================================
     STATUS
  ===================================================== */

  status text NOT NULL
    DEFAULT 'draft'
    CHECK (
      status IN (
        'draft',
        'active',
        'hidden',
        'archived'
      )
    ),

  is_active boolean NOT NULL
    DEFAULT true,

  is_featured boolean NOT NULL
    DEFAULT false,

  /* =====================================================
     TIME
  ===================================================== */

  created_at timestamptz NOT NULL
    DEFAULT now(),

  updated_at timestamptz NOT NULL
    DEFAULT now(),

  deleted_at timestamptz,

  /* =====================================================
     CONSTRAINTS
  ===================================================== */

  CONSTRAINT products_slug_unique
    UNIQUE (slug),

  CONSTRAINT products_price_check
    CHECK (price >= 0),

  CONSTRAINT products_sale_price_check
    CHECK (
      sale_price IS NULL
      OR sale_price >= 0
    ),

  CONSTRAINT products_final_price_check
    CHECK (final_price >= 0),

  CONSTRAINT products_stock_check
    CHECK (stock >= 0),

  CONSTRAINT products_sale_stock_check
    CHECK (sale_stock >= 0),

  CONSTRAINT products_sale_sold_check
    CHECK (sale_sold >= 0),

  CONSTRAINT products_sold_check
    CHECK (sold >= 0),

  CONSTRAINT products_rating_avg_check
    CHECK (rating_avg >= 0),

  CONSTRAINT products_rating_count_check
    CHECK (rating_count >= 0)
);


/* =========================================================
   PRODUCT VARIANTS
========================================================= */

CREATE TABLE public.product_variants (
  /* =====================================================
     PRIMARY
  ===================================================== */

  id uuid PRIMARY KEY
    DEFAULT gen_random_uuid(),

  product_id uuid NOT NULL
    REFERENCES public.products(id)
    ON DELETE CASCADE,

  /* =====================================================
     OPTIONS
  ===================================================== */

  option_1 text,
  option_2 text,
  option_3 text,

  option_label_1 text,
  option_label_2 text,
  option_label_3 text,

  name text NOT NULL
    DEFAULT '',

  /* =====================================================
     SKU
  ===================================================== */

  sku text,

  /* =====================================================
     PRICE
  ===================================================== */

  price numeric(20,8) NOT NULL
    DEFAULT 0,

  sale_price numeric(20,8),

  final_price numeric(20,8) NOT NULL
    DEFAULT 0,

  currency text NOT NULL
    DEFAULT 'PI'
    CHECK (currency = 'PI'),

  /* =====================================================
     FLASH SALE
  ===================================================== */

  sale_enabled boolean NOT NULL
    DEFAULT false,

  sale_stock integer NOT NULL
    DEFAULT 0,

  sale_sold integer NOT NULL
    DEFAULT 0,

  /* =====================================================
     STOCK
  ===================================================== */

  stock integer NOT NULL
    DEFAULT 0,

  is_unlimited boolean NOT NULL
    DEFAULT false,

  sold integer NOT NULL
    DEFAULT 0,

  /* =====================================================
     MEDIA
  ===================================================== */

  image text NOT NULL
    DEFAULT '',

  /* =====================================================
     STATUS
  ===================================================== */

  is_active boolean NOT NULL
    DEFAULT true,

  /* =====================================================
     SORT
  ===================================================== */

  sort_order integer NOT NULL
    DEFAULT 0,

  /* =====================================================
     TIME
  ===================================================== */

  created_at timestamptz NOT NULL
    DEFAULT now(),

  updated_at timestamptz NOT NULL
    DEFAULT now(),

  deleted_at timestamptz,

  /* =====================================================
     CONSTRAINTS
  ===================================================== */

  CONSTRAINT product_variants_price_check
    CHECK (price >= 0),

  CONSTRAINT product_variants_sale_price_check
    CHECK (
      sale_price IS NULL
      OR sale_price >= 0
    ),

  CONSTRAINT product_variants_final_price_check
    CHECK (final_price >= 0),

  CONSTRAINT product_variants_stock_check
    CHECK (stock >= 0),

  CONSTRAINT product_variants_sale_stock_check
    CHECK (sale_stock >= 0),

  CONSTRAINT product_variants_sale_sold_check
    CHECK (sale_sold >= 0),

  CONSTRAINT product_variants_sold_check
    CHECK (sold >= 0)
);


/* =========================================================
   SHIPPING RATES
========================================================= */

CREATE TABLE public.shipping_rates (
  id uuid PRIMARY KEY
    DEFAULT gen_random_uuid(),

  product_id uuid NOT NULL
    REFERENCES public.products(id)
    ON DELETE CASCADE,

  zone_id uuid NOT NULL
    REFERENCES public.shipping_zones(id)
    ON DELETE CASCADE,

  domestic_country_code text,

  price numeric(20,8) NOT NULL
    DEFAULT 0
    CHECK (price >= 0),

  currency text NOT NULL
    DEFAULT 'PI'
    CHECK (currency = 'PI'),

  created_at timestamptz NOT NULL
    DEFAULT now(),

  updated_at timestamptz NOT NULL
    DEFAULT now(),

  CONSTRAINT shipping_rates_unique
    UNIQUE (
      product_id,
      zone_id
    )
);


/* =========================================================
   INDEXES
========================================================= */

CREATE INDEX idx_products_seller_id
ON public.products(seller_id);

CREATE INDEX idx_products_category_id
ON public.products(category_id);

CREATE INDEX idx_products_status
ON public.products(status);

CREATE INDEX idx_products_is_active
ON public.products(is_active);

CREATE INDEX idx_products_created_at
ON public.products(created_at DESC);

CREATE INDEX idx_products_sale_enabled
ON public.products(sale_enabled);

CREATE INDEX idx_products_deleted_at
ON public.products(deleted_at);

CREATE INDEX idx_product_variants_product_id
ON public.product_variants(product_id);

CREATE INDEX idx_product_variants_active
ON public.product_variants(is_active);

CREATE INDEX idx_shipping_rates_product_id
ON public.shipping_rates(product_id);


/* =========================================================
   AUTO UPDATE updated_at
========================================================= */

CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ language 'plpgsql';


CREATE TRIGGER trg_products_updated_at
BEFORE UPDATE ON public.products
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();


CREATE TRIGGER trg_product_variants_updated_at
BEFORE UPDATE ON public.product_variants
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();


CREATE TRIGGER trg_shipping_rates_updated_at
BEFORE UPDATE ON public.shipping_rates
FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();

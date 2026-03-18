CREATE TABLE IF NOT EXISTS public.seller_requests (
  id uuid primary key default gen_random_uuid(),

  user_id text not null
    references public.users(pi_uid)
    on delete cascade,

  username text not null,

  -- SHOP INFO
  shop_name text not null,
  shop_description text,
  shop_logo text,
  shop_banner text,

  -- CONTACT
  phone text,
  email text,

  -- OPTIONAL KYC
  identity_number text,
  identity_document_url text,

  -- STATUS
  status text not null default 'pending'
    check (status in ('pending','approved','rejected')),

  admin_note text,

  reviewed_by text
    references public.users(pi_uid)
    on delete set null,

  reviewed_at timestamptz,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

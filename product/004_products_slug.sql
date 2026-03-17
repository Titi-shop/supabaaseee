CREATE OR REPLACE FUNCTION public.slugify(input text)
RETURNS text
LANGUAGE sql
IMMUTABLE
AS $$
SELECT lower(
  regexp_replace(
    regexp_replace(trim(input), '[^a-zA-Z0-9\s-]', '', 'g'),
    '\s+',
    '-',
    'g'
  )
);
$$;

CREATE OR REPLACE FUNCTION public.products_generate_slug()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF new.slug IS NULL OR new.slug = '' THEN
    new.slug :=
      public.slugify(new.name)
      || '-'
      || floor(extract(epoch FROM now()));
  END IF;

  RETURN new;
END;
$$;

DROP TRIGGER IF EXISTS trg_products_slug ON public.products;

CREATE TRIGGER trg_products_slug
BEFORE INSERT ON public.products
FOR EACH ROW
EXECUTE FUNCTION public.products_generate_slug();

DROP TRIGGER IF EXISTS trg_reviews_updated ON public.reviews;

CREATE TRIGGER trg_reviews_updated
BEFORE UPDATE ON public.reviews
FOR EACH ROW
EXECUTE FUNCTION public.update_updated_at();

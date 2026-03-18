DROP TRIGGER IF EXISTS trg_seller_requests_updated ON public.seller_requests;

CREATE TRIGGER trg_seller_requests_updated
BEFORE UPDATE ON public.seller_requests
FOR EACH ROW
EXECUTE FUNCTION public.update_updated_at();

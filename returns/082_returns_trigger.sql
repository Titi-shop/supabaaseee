DROP TRIGGER IF EXISTS trg_returns_updated ON public.returns;

CREATE TRIGGER trg_returns_updated
BEFORE UPDATE ON public.returns
FOR EACH ROW
EXECUTE FUNCTION public.update_updated_at();

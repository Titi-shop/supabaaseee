DROP TRIGGER IF EXISTS trg_orders_updated ON public.orders;

CREATE TRIGGER trg_orders_updated
BEFORE UPDATE ON public.orders
FOR EACH ROW
EXECUTE FUNCTION public.update_updated_at();

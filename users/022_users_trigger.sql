DROP TRIGGER IF EXISTS trg_users_updated ON public.users;

CREATE TRIGGER trg_users_updated
BEFORE UPDATE ON public.users
FOR EACH ROW
EXECUTE FUNCTION public.update_updated_at();

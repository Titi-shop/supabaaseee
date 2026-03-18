DROP TRIGGER IF EXISTS trg_user_profiles_updated ON public.user_profiles;

CREATE TRIGGER trg_user_profiles_updated
BEFORE UPDATE ON public.user_profiles
FOR EACH ROW
EXECUTE FUNCTION public.update_updated_at();

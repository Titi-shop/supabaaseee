CREATE INDEX IF NOT EXISTS idx_users_role
ON public.users(role);

CREATE INDEX IF NOT EXISTS idx_users_created
ON public.users(created_at DESC);

CREATE INDEX IF NOT EXISTS idx_users_username
ON public.users(username);

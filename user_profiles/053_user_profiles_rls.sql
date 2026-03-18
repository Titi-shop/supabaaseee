ALTER TABLE public.user_profiles
ENABLE ROW LEVEL SECURITY;

-- SELECT
CREATE POLICY "user_profiles_select_own"
ON public.user_profiles
FOR SELECT
USING (
  user_id = auth.uid()::text
);

-- INSERT
CREATE POLICY "user_profiles_insert_own"
ON public.user_profiles
FOR INSERT
WITH CHECK (
  user_id = auth.uid()::text
);

-- UPDATE
CREATE POLICY "user_profiles_update_own"
ON public.user_profiles
FOR UPDATE
USING (
  user_id = auth.uid()::text
);

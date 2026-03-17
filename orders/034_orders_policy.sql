-- =========================================
-- REMOVE WRONG POLICIES
-- =========================================

DROP POLICY IF EXISTS "orders_insert_own" ON public.orders;
DROP POLICY IF EXISTS "orders_update_own" ON public.orders;

-- =========================================
-- KEEP SELECT (OPTIONAL)
-- =========================================

DROP POLICY IF EXISTS "orders_select_own" ON public.orders;

CREATE POLICY "orders_select_own"
ON public.orders
FOR SELECT
USING (true);

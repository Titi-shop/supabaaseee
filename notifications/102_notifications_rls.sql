ALTER TABLE public.notifications ENABLE ROW LEVEL SECURITY;



👤 User: chỉ xem notification của mình
  
CREATE POLICY "notifications_select_own"
ON public.notifications
FOR SELECT
USING (
  user_id = auth.uid()::text
);


👤 User: update (mark as read)

CREATE POLICY "notifications_update_own"
ON public.notifications
FOR UPDATE
USING (
  user_id = auth.uid()::text
);




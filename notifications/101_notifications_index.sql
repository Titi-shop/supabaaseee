CREATE INDEX IF NOT EXISTS idx_notifications_user
ON public.notifications(user_id);

CREATE INDEX IF NOT EXISTS idx_notifications_read
ON public.notifications(user_id, is_read);

CREATE INDEX IF NOT EXISTS idx_notifications_created
ON public.notifications(created_at DESC);

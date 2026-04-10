CREATE INDEX idx_notifications_user
ON notifications(user_id);

CREATE INDEX idx_notifications_unread
ON notifications(user_id, is_read);

CREATE INDEX idx_notifications_created
ON notifications(created_at DESC);

CREATE INDEX idx_notifications_type
ON notifications(type);

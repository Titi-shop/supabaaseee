CREATE UNIQUE INDEX unique_review_per_item
ON reviews(order_item_id)
WHERE deleted_at IS NULL;

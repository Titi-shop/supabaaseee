CREATE INDEX idx_returns_order ON returns(order_id);
CREATE INDEX idx_returns_buyer ON returns(buyer_id);
CREATE INDEX idx_returns_seller ON returns(seller_id);
CREATE INDEX idx_returns_status ON returns(status);

CREATE INDEX idx_return_items_return ON return_items(return_id);
CREATE INDEX idx_return_items_order_item ON return_items(order_item_id);

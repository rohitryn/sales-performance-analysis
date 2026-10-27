-- Indexes used in sales_table1_eda.ipynb
-- These are safe to rerun because of IF NOT EXISTS.

CREATE INDEX IF NOT EXISTS idx_orders_customer_id ON Orders(customer_id);
CREATE INDEX IF NOT EXISTS idx_orderitems_order_id ON OrderItems(order_id);
CREATE INDEX IF NOT EXISTS idx_orderitems_product_id ON OrderItems(product_id);
CREATE INDEX IF NOT EXISTS idx_payments_order_id ON Payments(order_id);
CREATE INDEX IF NOT EXISTS idx_products_product_id ON Products(product_id);

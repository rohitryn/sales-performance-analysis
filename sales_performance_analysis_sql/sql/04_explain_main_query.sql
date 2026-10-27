-- Inspect the query plan for the main sales dataset query.
-- Paste/run the SELECT query from 01_build_sales_dataset.sql after EXPLAIN QUERY PLAN.
-- SQLite does not support EXPLAIN QUERY PLAN SELECT ... stored as a separate variable,
-- so the main SELECT is repeated below for direct execution.

EXPLAIN QUERY PLAN
SELECT
    C.customer_city AS city,
    C.customer_state AS state,
    O.order_status AS order_status,
    O.order_purchase_timestamp AS order_date,
    OI.order_id,
    OI.product_id,
    OI.seller_id,
    OI.item_price,
    OI.shipping_charges,
    OI.item_revenue,
    P.payment_type,
    PR.product_category_name
FROM Orders O
JOIN Customers C
    ON O.customer_id = C.customer_id
JOIN (
    SELECT
        order_id,
        product_id,
        seller_id,
        SUM(price) AS item_price,
        SUM(shipping_charges) AS shipping_charges,
        SUM(price + shipping_charges) AS item_revenue
    FROM OrderItems
    GROUP BY order_id, product_id, seller_id
) OI
    ON O.order_id = OI.order_id
LEFT JOIN (
    SELECT
        order_id,
        MIN(payment_type) AS payment_type
    FROM Payments
    GROUP BY order_id
) P
    ON O.order_id = P.order_id
LEFT JOIN Products PR
    ON OI.product_id = PR.product_id;

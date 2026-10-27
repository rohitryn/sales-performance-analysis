-- Read-only data quality and database inspection queries
-- Extracted/organized from checks performed in sales_table1_eda.ipynb.

-- 1. List tables in the SQLite database
SELECT name
FROM sqlite_master
WHERE type = 'table'
ORDER BY name;

-- 2. Row counts for the source and analysis tables
SELECT 'Customers' AS table_name, COUNT(*) AS row_count FROM Customers
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'OrderItems', COUNT(*) FROM OrderItems
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payments
UNION ALL
SELECT 'Products', COUNT(*) FROM Products
UNION ALL
SELECT 'sales_table', COUNT(*) FROM sales_table
UNION ALL
SELECT 'sales_table1', COUNT(*) FROM sales_table1
UNION ALL
SELECT 'sales_summary', COUNT(*) FROM sales_summary;

-- 3. Product records with missing category values
SELECT product_id, product_category_name
FROM Products
WHERE product_category_name IS NULL;

-- 4. Product IDs referenced by order items but absent from Products
SELECT DISTINCT oi.product_id
FROM OrderItems AS oi
LEFT JOIN Products AS p
    ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- 5. Order-item products that have a NULL category
SELECT DISTINCT p.product_id, p.product_category_name
FROM OrderItems AS oi
JOIN Products AS p
    ON oi.product_id = p.product_id
WHERE p.product_category_name IS NULL;

-- 6. Inspect source table columns (SQLite)
PRAGMA table_info('Orders');
PRAGMA table_info('Customers');
PRAGMA table_info('OrderItems');
PRAGMA table_info('Payments');
PRAGMA table_info('Products');

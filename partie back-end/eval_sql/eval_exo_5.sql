CREATE ROLE IF NOT EXISTS 'marketing'@'localhost';

GRANT INSERT, UPDATE, DELETE
ON products, categories
TO 'marketing'@'localhost';

GRANT SELECT
ON orders, orders_details, customers
TO 'marketing'@'localhost';
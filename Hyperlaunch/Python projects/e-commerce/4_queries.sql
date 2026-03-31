SELECT * FROM Customer;

SELECT * FROM Product;

SELECT * FROM category;

SELECT * FROM payment;

SELECT * FROM product;

SELECT * FROM product_details;

SELECT * FROM purchase;


-- COMMAND: SELECT + JOIN
SELECT p.product_name, c.category_name, p.price
FROM product p
JOIN category c ON p.category_id = c.category_id;

-- COMMAND: UPDATE
UPDATE product
SET price = 52000
WHERE product_id = 1;

-- COMMAND: DELETE
DELETE FROM customer
WHERE customer_id = 5;

-- AGGREGATE FUNCTION COMMAND
-- COMMAND: SELECT + COUNT
SELECT COUNT(*) AS total_customers
FROM customer;

-- COMMAND: SELECT + SUM
SELECT SUM(total_amount) AS total_sales
FROM purchase;

-- COMMAND: SELECT + AVG
SELECT AVG(price) AS average_price
FROM product;

-- COMMAND: SELECT + MAX
SELECT MAX(price) AS highest_price
FROM product;

-- COMMAND: SELECT + SUBQUERY
SELECT * FROM product
WHERE price = (SELECT MAX(price) FROM product);

-- COMMAND: CREATE VIEW
CREATE VIEW sales_view AS
SELECT c.first_name, pr.product_name, p.total_amount
FROM purchase p
JOIN customer c ON p.customer_id = c.customer_id
JOIN product pr ON p.product_id = pr.product_id;

-- COMMAND: SELECT
SELECT * FROM sales_view;

-- Join queries
-- COMMAND: SELECT + INNER JOIN
SELECT p.product_id, p.product_name, c.category_name
FROM product p
INNER JOIN category c
ON p.category_id = c.category_id;

-- COMMAND: SELECT + INNER JOIN
SELECT c.customer_id, c.first_name, pr.product_name, pu.purchase_date, pu.total_amount
FROM customer c
INNER JOIN purchase pu
ON c.customer_id = pu.customer_id
INNER JOIN product pr
ON pu.product_id = pr.product_id;

-- COMMAND: SELECT + INNER JOIN
SELECT c.first_name, pr.product_name, pay.amount_paid, pay.payment_mode
FROM payment pay
INNER JOIN purchase pu
ON pay.purchase_id = pu.purchase_id
INNER JOIN customer c
ON pu.customer_id = c.customer_id
INNER JOIN product pr
ON pu.product_id = pr.product_id;

-- COMMAND: SELECT + LEFT JOIN
SELECT c.customer_id, c.first_name, pu.purchase_id
FROM customer c
LEFT JOIN purchase pu
ON c.customer_id = pu.customer_id;

-- COMMAND: SELECT + RIGHT JOIN
SELECT c.first_name, pu.purchase_id, pu.total_amount
FROM customer c
RIGHT JOIN purchase pu
ON c.customer_id = pu.customer_id;

-- COMMAND: SELECT + JOIN + WHERE
SELECT c.first_name, pr.product_name, pu.total_amount
FROM customer c
JOIN purchase pu
ON c.customer_id = pu.customer_id
JOIN product pr
ON pu.product_id = pr.product_id
WHERE pu.total_amount > 20000;

-- COMMAND: SELECT + JOIN + GROUP BY
SELECT c.first_name, SUM(pu.total_amount) AS total_spent
FROM customer c
JOIN purchase pu
ON c.customer_id = pu.customer_id
GROUP BY c.customer_id;

-- COMMAND: SELECT + MULTI JOIN
SELECT c.first_name, pr.product_name, pu.quantity, pu.total_amount, pay.payment_mode
FROM customer c
JOIN purchase pu ON c.customer_id = pu.customer_id
JOIN product pr ON pu.product_id = pr.product_id
JOIN payment pay ON pu.purchase_id = pay.purchase_id;

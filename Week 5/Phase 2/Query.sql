CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product VARCHAR(50),
    order_amount INT
);



INSERT INTO customers (customer_id, customer_name, city) VALUES
(101, 'Aarav', 'Hyderabad'),
(102, 'Bhavya', 'Bangalore'),
(103, 'Charan', 'Chennai'),
(104, 'Divya', 'Mumbai'),
(105, 'Esha', 'Pune'),
(106, 'Farhan', 'Delhi'),
(107, 'Gopal', 'Hyderabad'),
(108, 'Harsha', 'Chennai'),
(109, 'Ishita', 'Bangalore'),
(110, 'John', 'Mumbai'),
(111, 'Keerthi', 'Pune'),
(112, 'Lokesh', 'Delhi'),
(113, 'Meena', 'Hyderabad'),
(114, 'Nikhil', 'Chennai'),
(115, 'Pooja', 'Bangalore'),
(NULL, 'Unknown', 'Hyderabad'),
(NULL, 'Guest', 'Delhi');


INSERT INTO orders (order_id, customer_id, product, order_amount) VALUES
(1001, 101, 'Laptop', 52000),
(1002, 101, 'Mouse', 1200),
(1003, 102, 'Mobile', 28000),
(1004, 103, 'Headphones', 2500),
(1005, 103, 'Keyboard', 1800),
(1006, 104, 'Monitor', 14000),
(1007, 104, 'Printer', 11000),
(1008, 105, 'Chair', 6000),
(1009, 106, 'Desk', 8500),
(1010, 106, 'Laptop', 51000),
(1011, 107, 'Mouse', 1000),
(1012, 107, 'Keyboard', 1700),
(1013, 108, 'Mobile', 30000),
(1014, 109, 'Laptop', 54000),
(1015, 109, 'Monitor', 13500),
(1016, 110, 'Printer', 12000),
(1017, 110, 'Chair', 5500),
(1018, 111, 'Desk', 9000),
(1019, 111, 'Mouse', 1300),
(1020, 112, 'Laptop', 50000),
(1021, 112, 'Keyboard', 2000),
(1022, 114, 'Headphones', 3000),
(1023, 114, 'Monitor', 15000),
(1024, NULL, 'Tablet', 22000),
(1025, NULL, 'Keyboard', 1800);

SELECT * 
FROM customers; -- Output 1

SELECT *
FROM orders; -- Output 2

-- printing schema of dataframes


DESCRIBE customers; -- Output 3

DESCRIBE orders; -- Output 4

-- Mini Cleaning Task

DELETE FROM customers
WHERE customer_id IS NULL;

DELETE FROM orders
WHERE customer_id IS NULL;

SELECT * 
FROM customers; -- Output 5

SELECT * 
FROM orders; -- Output 6

-- Exercises

-- 1. Total order amount for each customer

SELECT c.customer_id, c.customer_name, sum(o.order_amount) as Total_Order_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;  -- Output 7

-- 2. Top 3 customers by total spend
SELECT c.customer_id, c.customer_name, sum(o.order_amount) as Total_order_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY Total_order_amount DESC
LIMIT 3; -- Output 8

-- 3. Customers with no orders

SELECT c.customer_id , c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL; -- Output 9

-- 4. City-wise total revenue
SELECT c.city, sum(o.order_amount) as Total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city; -- Output 10

-- 5. Average order amount per customer

SELECT c.customer_id, c.customer_name, avg(o.order_amount) as average_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_name; -- Output 11

-- 6. Customers with more than one order

SELECT c.customer_id, c.customer_name, count(o.order_id) as no_of_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING no_of_orders >1; -- Output 12

-- 7. Sort customers by total spend descending

SELECT c.customer_id, c.customer_name, sum(o.order_amount) as Total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY Total_amount DESC; -- Output 13
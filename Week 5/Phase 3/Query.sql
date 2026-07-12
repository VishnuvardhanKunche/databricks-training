CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    age INT
);

INSERT INTO customers VALUES
(101,'Aarav','Hyderabad',25),
(102,'Bhavya','Bangalore',28),
(103,'Charan','Chennai',24),
(104,'Divya','Mumbai',31),
(105,'Esha','Pune',27),
(106,'Farhan','Delhi',30),
(107,'Gopal','Hyderabad',29),
(108,'Harsha','Chennai',26),
(109,'Ishita','Bangalore',32),
(110,'John','Mumbai',35),
(111,'Keerthi','Pune',23),
(112,'Lokesh','Delhi',34),
(113,'Meena','Hyderabad',27),
(114,'Nikhil','Chennai',-2),
(115,'Pooja',NULL,29),
(NULL,'Unknown','Hyderabad',24),
(105,'Esha','Pune',27);


CREATE TABLE sales (
    order_id INT,
    customer_id INT,
    order_date DATE,
    product VARCHAR(50),
    amount INT
);

INSERT INTO sales VALUES
(1002,101,'2025-01-01','Mouse',1200),
(1003,102,'2025-01-02','Mobile',28000),
(1004,103,'2025-01-02','Keyboard',1800),
(1005,103,'2025-01-03','Headphones',2500),
(1006,104,'2025-01-03','Monitor',14000),
(1007,104,'2025-01-04','Printer',11000),
(1008,105,'2025-01-04','Chair',6000),
(1009,106,'2025-01-05','Desk',8500),
(1010,106,'2025-01-05','Laptop',51000),
(1011,107,'2025-01-06','Mouse',1000),
(1012,107,'2025-01-06','Keyboard',1700),
(1013,108,'2025-01-07','Mobile',30000),
(1014,109,'2025-01-07','Laptop',54000),
(1015,109,'2025-01-08','Monitor',13500),
(1016,110,'2025-01-08','Printer',12000),
(1017,111,'2025-01-09','Desk',9000),
(1018,112,'2025-01-09','Laptop',50000),
(1019,113,'2025-01-10','Mouse',1300),
(1020,113,'2025-01-10','Keyboard',2000),
(1021,NULL,'2025-01-11','Tablet',22000),
(1022,114,'2025-01-11','Monitor',-15000),
(1023,115,'2025-01-12','Chair',NULL),
(1001,101,'2025-01-01','Laptop',52000);

SELECT *
FROM customers; -- Output 1

DESCRIBE customers; -- Output 2

SELECT *
FROM sales; -- Output 3

DESCRIBE sales; -- Output 4


-- Data Cleaning

DELETE
FROM customers
WHERE customer_id IS NULL;

DELETE
FROM customers
WHERE age <= 0;

UPDATE customers
SET city='Unknown'
WHERE city IS NULL;


DELETE
FROM sales
WHERE customer_id IS NULL;

DELETE
FROM sales
WHERE amount IS NULL;

DELETE
FROM sales
WHERE amount <=0;

SELECT *
FROM customers;        -- Output 5


SELECT *
FROM sales;            -- Output 6



-- 1. Calculate daily sales


SELECT order_date, SUM(amount) AS daily_sales
FROM sales
GROUP BY order_date
ORDER BY order_date; -- Output 7


-- 2. City Wise Revenue


SELECT c.city, SUM(s.amount) AS city_revenue
FROM customers c
JOIN sales s ON c.customer_id=s.customer_id
GROUP BY c.city
ORDER BY city_revenue DESC; -- Output 8


-- 3. Find repeat customers (>2 orders)


SELECT customer_id, COUNT(order_id) AS order_count
FROM sales
GROUP BY customer_id
HAVING COUNT(order_id)>2; -- Output 9


-- 4. Highest Spending Customer in Each City

SELECT *
FROM (SELECT c.customer_id, c.customer_name, c.city, SUM(s.amount) AS total_spend, ROW_NUMBER() OVER
( PARTITION BY c.city
  ORDER BY SUM(s.amount) DESC
) AS rn      
FROM customers c
JOIN sales s ON c.customer_id=s.customer_id
GROUP BY c.customer_id, c.customer_name, c.city )t
WHERE rn=1;  -- Output 10


-- 5. Final reporting table with customer, city, total spend, order count

SELECT c.customer_id, c.customer_name, c.city, SUM(s.amount) AS total_spend, COUNT(s.order_id) AS order_count
FROM customers c
JOIN sales s ON c.customer_id=s.customer_id
GROUP BY c.customer_id, c.customer_name, c.city
ORDER BY total_spend DESC; -- Output 11

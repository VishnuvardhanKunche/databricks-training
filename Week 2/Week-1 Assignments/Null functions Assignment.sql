-- Null Functions Assignment
-- Platform: db-fiddle.com (MySQL 8.0)

drop table if exists Employees;
drop table if exists Orders;
drop table if exists Products;

create table Employees (
    emp_id int,
    name varchar(50),
    salary int,
    bonus int,
    manager_id int
);

insert into Employees values
(1, 'Amit', 50000, null, 101),
(2, 'John', null, 5000, 102),
(3, 'Sara', 60000, null, null),
(4, 'David', null, null, 103),
(5, 'Priya', 45000, 3000, 101),
(6, 'Kiran', null, null, null),
(7, 'Ravi', 70000, 7000, 102),
(8, 'Neha', null, 2000, null);

create table Orders (
    order_id int,
    customer_name varchar(50),
    amount int,
    discount int,
    coupon_code varchar(20)
);

insert into Orders values
(101, 'Amit', 1000, null, 'DISC10'),
(102, 'John', null, 50, null),
(103, 'Sara', 2000, null, 'DISC20'),
(104, 'David', null, null, null),
(105, 'Priya', 1500, 100, null),
(106, 'Kiran', null, null, 'DISC5'),
(107, 'Ravi', 3000, null, null),
(108, 'Neha', null, 200, 'DISC15');

create table Products (
    product_id int,
    product_name varchar(50),
    price int,
    category varchar(50),
    stock int
);

insert into Products values
(1, 'Laptop', 50000, 'Electronics', 10),
(2, 'Phone', null, 'Electronics', null),
(3, 'Tablet', 30000, null, 5),
(4, 'Headphones', null, null, null),
(5, 'Monitor', 20000, 'Electronics', 0),
(6, 'Keyboard', null, 'Accessories', 15),
(7, 'Mouse', 500, null, null),
(8, 'Printer', null, 'Electronics', 3);


-- level 1: basic

-- show all employees whose salary is null
select *
from Employees
where salary is null;

-- show all orders where discount is not null
select *
from Orders
where discount is not null;

-- get products where category is null
select *
from Products
where category is null;

-- count number of employees with null manager_id
select count(*) as no_manager_count
from Employees
where manager_id is null;


-- level 2: isnull

-- replace null salary with 0
select name, isnull(salary, 0) as salary from Employees;

-- replace null bonus with 1000
select name, isnull(bonus, 1000) as bonus from Employees;

-- show order amount, if null replace with 500
select customer_name, isnull(amount, 500) as amount from Orders;

-- replace null stock with 0
select product_name, isnull(stock, 0) as stock from Products;


-- level 3: coalesce

-- show employee earnings: use salary, if null use bonus
select name, coalesce(salary, bonus) as earnings from Employees;

-- show first available value: salary > bonus > 0
select name, coalesce(salary, bonus, 0) as earnings from Employees;

-- show product price, default to 1000 if null
select product_name, coalesce(price, 1000) as price from Products;

-- get customer payment: amount > discount > 0
select customer_name, coalesce(amount, discount, 0) as payment from Orders;


-- level 4: nullif

-- convert salary to null if salary = 0
select name, nullif(salary, 0) as salary from Employees;

-- convert discount to null if discount = 0
select customer_name, nullif(discount, 0) as discount from Orders;

-- use nullif to avoid divide by zero
select customer_name, amount / nullif(discount, 0) as ratio from Orders;

-- replace coupon_code with null if it is 'DISC10'
select customer_name, nullif(coupon_code, 'DISC10') as coupon_code from Orders;


-- level 5: real-time scenarios

-- calculate total earnings: salary + bonus (handle null properly)
select name, coalesce(salary, 0) + coalesce(bonus, 0) as total_earnings from Employees;

-- show employees where both salary and bonus are null
select * from Employees where salary is null and bonus is null;

-- show products where price is null but category is not null
select * from Products where price is null and category is not null;

-- show orders where both amount and discount are null
select * from Orders where amount is null and discount is null;


-- level 6: advanced

-- show employee income using coalesce
select name, coalesce(salary, bonus, 1000) as income from Employees;

-- replace empty discount with null using nullif
select customer_name, nullif(discount, 0) as discount from Orders;

-- show final payable amount: amount - discount (handle null)
select customer_name,
coalesce(amount, 0) - coalesce(discount, 0) as final_amount
from Orders;

-- find employees where salary is null but manager exists
select * from Employees where salary is null and manager_id is not null;
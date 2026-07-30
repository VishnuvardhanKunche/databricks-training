CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments VALUES
(101,'IT'),
(102,'HR'),
(103,'Finance'),
(104,'Sales'),
(105,'Marketing');

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Gender VARCHAR(10),
    DepartmentID INT,
    Salary INT,
    Experience INT,
    ManagerID INT,
    JoiningDate DATE,
    City VARCHAR(50)
);

INSERT INTO Employees VALUES
(1,'Rahul','Male',101,70000,5,NULL,'2019-01-10','Hyderabad'),
(2,'Sneha','Female',101,85000,8,1,'2017-06-15','Bangalore'),
(3,'John','Male',102,45000,2,2,'2022-03-11','Chennai'),
(4,'Priya','Female',102,50000,3,2,'2021-05-19','Hyderabad'),
(5,'Amit','Male',103,90000,10,1,'2015-09-20','Delhi'),
(6,'Neha','Female',103,90000,9,5,'2016-11-01','Delhi'),
(7,'Kiran','Male',104,60000,4,5,'2020-02-15','Mumbai'),
(8,'David','Male',104,62000,4,7,'2020-08-18','Mumbai'),
(9,'Anjali','Female',105,55000,3,2,'2021-01-25','Pune'),
(10,'Arjun','Male',101,85000,8,1,'2017-07-10','Bangalore'),
(11,'Divya','Female',103,70000,6,5,'2018-12-20','Hyderabad'),
(12,'Vikram','Male',104,62000,5,7,'2019-10-05','Mumbai'),
(13,'Meena','Female',105,55000,2,9,'2023-01-01','Pune'),
(14,'Rakesh','Male',101,95000,12,NULL,'2013-04-01','Hyderabad'),
(15,'Suresh','Male',102,45000,1,4,'2024-01-15','Chennai');

-- Display employees with row numbers based on highest salary

SELECT *,
ROW_NUMBER() OVER(ORDER BY Salary DESC) AS Row_Num
FROM Employees;

-- Assign row numbers department-wise based on salary
SELECT *,
ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS Row_Num
FROM Employees;

-- Find the highest-paid employee in each department
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS rn
    FROM Employees
) t
WHERE rn = 1;

-- Find the second highest-paid employee from every department
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS rn
    FROM Employees
) t
WHERE rn = 2;

-- Find the latest joined employee from every department
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY JoiningDate DESC) AS rn
    FROM Employees
) t
WHERE rn = 1;

-- Find the oldest employee in each department
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY JoiningDate ASC) AS rn
    FROM Employees
) t
WHERE rn = 1;

-- Display top 3 highest-paid employees from every department
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS rn
    FROM Employees
) t
WHERE rn <= 3;

-- Display employees with row numbers based on joining date
SELECT *,
ROW_NUMBER() OVER(ORDER BY JoiningDate) AS Row_Num
FROM Employees;

-- Rank employees based on salary
SELECT *,
RANK() OVER(ORDER BY Salary DESC) AS Salary_Rank
FROM Employees;

-- Rank employees department-wise
SELECT *,
RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS Salary_Rank
FROM Employees;

-- Find employees having Rank = 1
SELECT *
FROM (
    SELECT *,
           RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS rnk
    FROM Employees
) t
WHERE rnk = 1;

-- Find Top 5 salaries using Rank
SELECT *
FROM (
    SELECT *,
           RANK() OVER(ORDER BY Salary DESC) AS rnk
    FROM Employees
) t
WHERE rnk <= 5;

-- Display employees having Rank less than 3 department-wise
SELECT *
FROM (
    SELECT *,
           RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS rnk
    FROM Employees
) t
WHERE rnk < 3;

-- Explain the gap created by Rank()
SELECT EmployeeName,
Salary,
RANK() OVER(ORDER BY Salary DESC) AS Rank_Value
FROM Employees;

-- Assign Dense Rank based on salary
SELECT *,
DENSE_RANK() OVER(ORDER BY Salary DESC) AS Dense_Rank
FROM Employees;

-- Find the second highest salary using Dense Rank
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER(ORDER BY Salary DESC) AS dr
    FROM Employees
) t
WHERE dr = 2;

-- Find top 3 salaries department-wise
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS dr
    FROM Employees
) t
WHERE dr <= 3;

-- Compare Rank() and Dense Rank()
SELECT EmployeeName,
Salary,
RANK() OVER(ORDER BY Salary DESC) AS Rank_Value,
DENSE_RANK() OVER(ORDER BY Salary DESC) AS Dense_Rank
FROM Employees;

-- Find departments having multiple employees with same salary
SELECT DepartmentID,
Salary,
COUNT(*) AS Employee_Count
FROM Employees
GROUP BY DepartmentID, Salary
HAVING COUNT(*) > 1;

-- Display previous and next employee salary
SELECT EmployeeName,
Salary,
LAG(Salary) OVER(ORDER BY Salary) AS Previous_Salary,
LEAD(Salary) OVER(ORDER BY Salary) AS Next_Salary
FROM Employees;

-- Find salary difference between current employee and next employee
SELECT EmployeeName,
Salary,
LEAD(Salary) OVER(ORDER BY Salary) - Salary AS Salary_Difference
FROM Employees;

-- Find employees whose next salary is greater
SELECT *
FROM (
    SELECT EmployeeName,
           Salary,
           LEAD(Salary) OVER(ORDER BY Salary) AS Next_Salary
    FROM Employees
) t
WHERE Next_Salary > Salary;

-- Display next joining date
SELECT EmployeeName,
JoiningDate,
LEAD(JoiningDate) OVER(ORDER BY JoiningDate) AS Next_JoiningDate
FROM Employees;

-- Display next employee name
SELECT EmployeeName,
LEAD(EmployeeName) OVER(ORDER BY EmployeeID) AS Next_Employee
FROM Employees;

-- Display previous employee salary
SELECT EmployeeName,
Salary,
LAG(Salary) OVER(ORDER BY Salary) AS Previous_Salary
FROM Employees;

-- Find salary increment compared to previous employee
SELECT EmployeeName,
Salary,
Salary - LAG(Salary) OVER(ORDER BY Salary) AS Salary_Increment
FROM Employees;

-- Find employees earning more than previous employee
SELECT *
FROM (
    SELECT EmployeeName,
           Salary,
           LAG(Salary) OVER(ORDER BY Salary) AS Previous_Salary
    FROM Employees
) t
WHERE Salary > Previous_Salary;

-- Display previous joining date
SELECT EmployeeName,
JoiningDate,
LAG(JoiningDate) OVER(ORDER BY JoiningDate) AS Previous_JoiningDate
FROM Employees;

-- Display previous employee name
SELECT EmployeeName,
LAG(EmployeeName) OVER(ORDER BY EmployeeID) AS Previous_Employee
FROM Employees;

-- Find employees earning more than average salary
SELECT *
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

-- Find employees earning less than average salary
SELECT *
FROM Employees
WHERE Salary < (
    SELECT AVG(Salary)
    FROM Employees
);

-- Find highest-paid employee
SELECT *
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
);

-- Find second highest salary
SELECT MAX(Salary) AS Second_Highest_Salary
FROM Employees
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employees
);

-- Find departments having more than three employees
SELECT DepartmentID,
COUNT(*) AS Employee_Count
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(*) > 3;

-- Find employees working in the department having maximum employees
SELECT *
FROM Employees
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Employees
    GROUP BY DepartmentID
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Find employees earning the same salary as Amit
SELECT *
FROM Employees
WHERE Salary = (
    SELECT Salary
    FROM Employees
    WHERE EmployeeName = 'Amit'
);

-- Find employees earning higher than their manager
SELECT e.EmployeeName,
e.Salary,
m.EmployeeName AS Manager_Name,
m.Salary AS Manager_Salary
FROM Employees e
JOIN Employees m
ON e.ManagerID = m.EmployeeID
WHERE e.Salary > m.Salary;

-- Create a CTE to display employees with department names
WITH Employee_Department AS (
    SELECT e.EmployeeID,
           e.EmployeeName,
           d.DepartmentName
    FROM Employees e
    JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
)
SELECT *
FROM Employee_Department;

-- Using a CTE, display top 3 salaries department-wise
WITH Salary_Rank AS (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY DepartmentID ORDER BY Salary DESC) AS rn
    FROM Employees
)
SELECT *
FROM Salary_Rank
WHERE rn <= 3;

-- Using a CTE, find employees earning above average salary
WITH Average_Salary AS (
    SELECT AVG(Salary) AS AvgSalary
    FROM Employees
)
SELECT *
FROM Employees
WHERE Salary > (
    SELECT AvgSalary
    FROM Average_Salary
);

-- Using a CTE, find duplicate salaries
WITH Duplicate_Salary AS (
    SELECT Salary,
           COUNT(*) AS Employee_Count
    FROM Employees
    GROUP BY Salary
)
SELECT *
FROM Duplicate_Salary
WHERE Employee_Count > 1;

-- Using a CTE, find departments having average salary greater than 70,000
WITH Department_Average AS (
    SELECT DepartmentID,
           AVG(Salary) AS Average_Salary
    FROM Employees
    GROUP BY DepartmentID
)
SELECT *
FROM Department_Average
WHERE Average_Salary > 70000;

-- Using a CTE, calculate total salary department-wise
WITH Department_Total AS (
    SELECT DepartmentID,
           SUM(Salary) AS Total_Salary
    FROM Employees
    GROUP BY DepartmentID
)
SELECT *
FROM Department_Total;

-- Using a CTE, find employees having more than 5 years of experience
WITH Experienced_Employees AS (
    SELECT *
    FROM Employees
    WHERE Experience > 5
)
SELECT *
FROM Experienced_Employees;

-- Using a CTE and ROW_NUMBER(), remove duplicate employee records (assume duplicates exist)
WITH Duplicate_Rows AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY EmployeeName,
                            Gender,
                            DepartmentID,
                            Salary,
                            Experience,
                            ManagerID,
                            JoiningDate,
                            City
               ORDER BY EmployeeID
           ) AS rn
    FROM Employees
)
SELECT *
FROM Duplicate_Rows
WHERE rn = 1;
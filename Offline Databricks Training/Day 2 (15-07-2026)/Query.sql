-- Table 1: Departments
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Departments VALUES
(1,'HR','New York'),
(2,'Finance','Chicago'),
(3,'IT','Dallas'),
(4,'Marketing','Boston'),
(5,'Sales','Seattle'),
(6,'Operations','Atlanta');

-- Table 2: Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    ManagerID INT,
    JoiningDate DATE
);

INSERT INTO Employees VALUES
(101,'John',1,50000,NULL,'2020-01-15'),
(102,'Emma',2,65000,101,'2021-03-10'),
(103,'David',3,70000,101,'2019-07-22'),
(104,'Sophia',3,72000,103,'2022-05-01'),
(105,'Michael',5,55000,102,'2021-09-18'),
(106,'Olivia',NULL,48000,102,'2023-01-12'),
(107,'James',4,60000,103,'2022-10-20'),
(108,'William',7,75000,101,'2020-08-11'),
(109,'Ava',NULL,52000,NULL,'2024-02-15'),
(110,'Isabella',5,68000,105,'2021-06-05');

-- Table 3: Projects
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentID INT,
    Budget DECIMAL(12,2)
);

INSERT INTO Projects VALUES
(201,'Payroll System',1,150000),
(202,'Audit System',2,200000),
(203,'Website Redesign',4,100000),
(204,'ERP Upgrade',3,500000),
(205,'Sales Dashboard',5,175000),
(206,'Automation',6,250000),
(207,'AI Chatbot',8,300000);

-- Table 4: EmployeeProjects
CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT
);

INSERT INTO EmployeeProjects VALUES
(101,201),
(102,202),
(103,204),
(104,204),
(105,205),
(107,203),
(110,205),
(103,207),
(108,207),
(109,202);

-- Table 5: CurrentEmployees
CREATE TABLE CurrentEmployees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO CurrentEmployees VALUES
(101,'John','HR',50000),
(102,'Emma','Finance',65000),
(103,'David','IT',70000),
(104,'Sophia','IT',72000),
(105,'Michael','Sales',55000),
(106,'Olivia','Marketing',48000),
(107,'James','Marketing',60000),
(108,'William','IT',75000),
(109,'Ava','Finance',52000),
(110,'Isabella','Sales',68000);

-- Table 6: FormerEmployees
CREATE TABLE FormerEmployees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO FormerEmployees VALUES
(105,'Michael','Sales',55000),
(106,'Olivia','Marketing',48000),
(111,'Lucas','HR',45000),
(112,'Mia','Finance',62000),
(113,'Ethan','IT',71000),
(114,'Charlotte','Sales',53000),
(115,'Benjamin','Operations',59000),
(116,'Amelia','HR',51000),
(117,'Henry','Finance',67000),
(118,'Harper','IT',73000);

-- Table 7: DomesticCustomers
CREATE TABLE DomesticCustomers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO DomesticCustomers VALUES
(1,'ABC Ltd','New York'),
(2,'XYZ Corp','Chicago'),
(3,'Global Tech','Dallas'),
(4,'Sunrise Inc','Boston'),
(5,'Bright Solutions','Seattle'),
(6,'Alpha Systems','Miami');

-- Table 8: InternationalCustomers
CREATE TABLE InternationalCustomers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO InternationalCustomers VALUES
(4,'Sunrise Inc','Boston'),
(5,'Bright Solutions','Seattle'),
(7,'TechWorld','London'),
(8,'Future Corp','Toronto'),
(9,'Vision Ltd','Dubai'),
(10,'Skyline LLC','Sydney');

-- Table 9: OnlineOrders
CREATE TABLE OnlineOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

INSERT INTO OnlineOrders VALUES
(1001,1,250),
(1002,2,450),
(1003,3,700),
(1004,5,900),
(1005,7,350),
(1006,8,1200);

-- Table 10: StoreOrders
CREATE TABLE StoreOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

INSERT INTO StoreOrders VALUES
(1004,5,900),
(1005,7,350),
(1007,2,600),
(1008,3,400),
(1009,9,1100),
(1010,10,850);


-- BASIC ASSIGNMENTS (JOINS)

-- INNER JOIN
-- Display employee names with department names.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Display project names with department names.
SELECT p.ProjectName, d.DepartmentName
FROM Projects p
INNER JOIN Departments d ON p.DepartmentID = d.DepartmentID;

-- Show employees along with project names.
SELECT e.EmployeeName, p.ProjectName
FROM Employees e
INNER JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p ON ep.ProjectID = p.ProjectID;

-- Show employee salary and department location.
SELECT e.EmployeeName, e.Salary, d.Location
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Display all employees working on projects.
SELECT DISTINCT e.EmployeeName
FROM Employees e
INNER JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID;


-- LEFT JOIN
-- Show all employees even if they don't belong to any department.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Show all departments even if no employee works there.
SELECT d.DepartmentName, e.EmployeeName
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID;

-- Show all projects and their department names.
SELECT p.ProjectName, d.DepartmentName
FROM Projects p
LEFT JOIN Departments d ON p.DepartmentID = d.DepartmentID;

-- Show every employee and their assigned projects.
SELECT e.EmployeeName, p.ProjectName
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p ON ep.ProjectID = p.ProjectID;

-- Display all employees even if they are not assigned to any project.
SELECT e.EmployeeName, p.ProjectName
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p ON ep.ProjectID = p.ProjectID;


-- RIGHT JOIN
-- Show all departments even if there are no employees.
SELECT d.DepartmentName, e.EmployeeName
FROM Employees e
RIGHT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Show all projects even if no employee is assigned.
SELECT p.ProjectName, ep.EmployeeID
FROM EmployeeProjects ep
RIGHT JOIN Projects p ON ep.ProjectID = p.ProjectID;

-- Display every department and employees.
SELECT d.DepartmentName, e.EmployeeName
FROM Employees e
RIGHT JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Show all projects with departments.
SELECT p.ProjectName, d.DepartmentName
FROM Departments d
RIGHT JOIN Projects p ON d.DepartmentID = p.DepartmentID;

-- Show every project assignment including projects without employees.
SELECT ep.EmployeeID, p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p ON ep.ProjectID = p.ProjectID;


-- FULL JOIN
-- Show all employees and all departments.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
FULL JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Show all departments and projects.
SELECT d.DepartmentName, p.ProjectName
FROM Departments d
FULL JOIN Projects p ON d.DepartmentID = p.DepartmentID;

-- Display all employees and projects.
SELECT e.EmployeeName, p.ProjectName
FROM Employees e
FULL JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
FULL JOIN Projects p ON ep.ProjectID = p.ProjectID;

-- Show every department whether employees exist or not.
SELECT d.DepartmentName, e.EmployeeName
FROM Employees e
FULL JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Show all departments and projects including unmatched records.
SELECT d.DepartmentName, p.ProjectName
FROM Departments d
FULL JOIN Projects p ON d.DepartmentID = p.DepartmentID;


-- INTERMEDIATE ASSIGNMENTS (JOINS)

-- INNER JOIN
-- Show employees whose department is IT.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';

-- Display employees working on projects with budget above 200000.
SELECT DISTINCT e.EmployeeName, p.ProjectName, p.Budget
FROM Employees e
INNER JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p ON ep.ProjectID = p.ProjectID
WHERE p.Budget > 200000;

-- Show employee names, department names and project names.
SELECT e.EmployeeName, d.DepartmentName, p.ProjectName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
INNER JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p ON ep.ProjectID = p.ProjectID;

-- Display total employees in each department.
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS TotalEmployees
FROM Departments d
INNER JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

-- Show average salary department-wise.
SELECT d.DepartmentName, AVG(e.Salary) AS AverageSalary
FROM Departments d
INNER JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;


-- LEFT JOIN
-- Find employees without departments.
SELECT e.EmployeeName
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

-- Find employees without projects.
SELECT e.EmployeeName
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
WHERE ep.EmployeeID IS NULL;

-- Find departments without employees.
SELECT d.DepartmentName
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;

-- Find projects without departments.
SELECT p.ProjectName
FROM Projects p
LEFT JOIN Departments d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

-- Show departments with total employees including zero employees.
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS TotalEmployees
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;


-- RIGHT JOIN
-- Find departments having no employees.
SELECT d.DepartmentName
FROM Employees e
RIGHT JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;

-- Find projects without employees.
SELECT p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p ON ep.ProjectID = p.ProjectID
WHERE ep.ProjectID IS NULL;

-- Show departments even if no projects exist.
SELECT d.DepartmentName, p.ProjectName
FROM Projects p
RIGHT JOIN Departments d ON p.DepartmentID = d.DepartmentID;

-- Count employees in every department.
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS TotalEmployees
FROM Employees e
RIGHT JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- List every project whether employees are assigned or not.
SELECT p.ProjectName, ep.EmployeeID
FROM EmployeeProjects ep
RIGHT JOIN Projects p ON ep.ProjectID = p.ProjectID;


-- FULL JOIN
-- Display all departments and employees.
SELECT d.DepartmentName, e.EmployeeName
FROM Employees e
FULL JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Show unmatched employees.
SELECT e.EmployeeName
FROM Employees e
FULL JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

-- Show unmatched departments.
SELECT d.DepartmentName
FROM Employees e
FULL JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;

-- Show all employees and departments with NULL handling.
SELECT COALESCE(e.EmployeeName, 'No Employee') AS EmployeeName, COALESCE(d.DepartmentName, 'No Department') AS DepartmentName
FROM Employees e
FULL JOIN Departments d ON e.DepartmentID = d.DepartmentID;

-- Display departments and projects including unmatched rows.
SELECT d.DepartmentName, p.ProjectName
FROM Departments d
FULL JOIN Projects p ON d.DepartmentID = p.DepartmentID;


-- ------------------------------------------
-- ADVANCED ASSIGNMENTS (JOINS)
-- ------------------------------------------

-- INNER JOIN
-- Find highest-paid employee in every department.
SELECT e.EmployeeName, d.DepartmentName, e.Salary
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (
    SELECT MAX(sub.Salary) 
    FROM Employees sub 
    WHERE sub.DepartmentID = e.DepartmentID
);

-- Find department having highest average salary.
SELECT DepartmentName, AvgSalary 
FROM (
    SELECT d.DepartmentName, AVG(e.Salary) AS AvgSalary,
           RANK() OVER (ORDER BY AVG(e.Salary) DESC) as Rnk
    FROM Departments d
    INNER JOIN Employees e ON d.DepartmentID = e.DepartmentID
    GROUP BY d.DepartmentName
) Temp WHERE Rnk = 1;

-- Find employee working on highest-budget project.
SELECT EmployeeName, ProjectName, Budget 
FROM (
    SELECT e.EmployeeName, p.ProjectName, p.Budget,
           RANK() OVER (ORDER BY p.Budget DESC) as Rnk
    FROM Employees e
    INNER JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
    INNER JOIN Projects p ON ep.ProjectID = p.ProjectID
) Temp WHERE Rnk = 1;

-- Show managers and their employees.
SELECT m.EmployeeName AS ManagerName, e.EmployeeName AS EmployeeName
FROM Employees e
INNER JOIN Employees m ON e.ManagerID = m.EmployeeID;

-- Find employees working on more than one project.
SELECT e.EmployeeName, COUNT(ep.ProjectID) AS ProjectCount
FROM Employees e
INNER JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeName
HAVING COUNT(ep.ProjectID) > 1;


-- LEFT JOIN
-- Find employees not assigned to any project.
SELECT e.EmployeeName
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
WHERE ep.EmployeeID IS NULL;

-- Find departments having no projects.
SELECT d.DepartmentName
FROM Departments d
LEFT JOIN Projects p ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;

-- Find departments having employees but no projects.
SELECT DISTINCT d.DepartmentName
FROM Departments d
INNER JOIN Employees e ON d.DepartmentID = e.DepartmentID
LEFT JOIN Projects p ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;

-- Show employees with project count.
SELECT e.EmployeeName, COUNT(ep.ProjectID) AS ProjectCount
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeName;

-- Show project count department-wise including zero.
SELECT d.DepartmentName, COUNT(p.ProjectID) AS ProjectCount
FROM Departments d
LEFT JOIN Projects p ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentName;


-- RIGHT JOIN
-- Find projects without employees.
SELECT p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;

-- Find departments without projects.
SELECT d.DepartmentName
FROM Projects p
RIGHT JOIN Departments d ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL;

-- Find projects whose department doesn't exist.
SELECT p.ProjectName
FROM Departments d
RIGHT JOIN Projects p ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL;

-- Find orphan employee records.
SELECT e.EmployeeName, e.DepartmentID
FROM Departments d
RIGHT JOIN Employees e ON d.DepartmentID = e.DepartmentID
WHERE e.DepartmentID IS NOT NULL AND d.DepartmentID IS NULL;

-- Display every department and employee count.
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
RIGHT JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;


-- ------------------------------------------
-- ANTI JOINS
-- ------------------------------------------

-- LEFT ANTI JOIN
-- Find employees without departments.
SELECT e.*
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

-- Find departments without employees.
SELECT d.*
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;

-- Find employees without projects.
SELECT e.*
FROM Employees e
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
WHERE ep.EmployeeID IS NULL;

-- Find departments without projects.
SELECT d.*
FROM Departments d
LEFT JOIN Projects p ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;

-- Find projects without departments.
SELECT p.*
FROM Projects p
LEFT JOIN Departments d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;


-- RIGHT ANTI JOIN
-- Departments without employees.
SELECT d.*
FROM Employees e
RIGHT JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;

-- Projects without employees.
SELECT p.*
FROM EmployeeProjects ep
RIGHT JOIN Projects p ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;

-- Departments without projects.
SELECT d.*
FROM Projects p
RIGHT JOIN Departments d ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL;

-- Employees whose departments don't exist.
SELECT e.*
FROM Departments d
RIGHT JOIN Employees e ON d.DepartmentID = e.DepartmentID
WHERE e.DepartmentID IS NOT NULL AND d.DepartmentID IS NULL;

-- Projects whose departments don't exist.
SELECT p.*
FROM Departments d
RIGHT JOIN Projects p ON d.DepartmentID = p.DepartmentID
WHERE p.DepartmentID IS NOT NULL AND d.DepartmentID IS NULL;


-- FULL ANTI JOIN
-- Find all unmatched employees and departments.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
FULL JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID IS NULL OR d.DepartmentID IS NULL;

-- Find all unmatched departments and employees.
SELECT d.DepartmentName, e.EmployeeName
FROM Employees e
FULL JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID IS NULL OR d.DepartmentID IS NULL;

-- Find projects without departments and departments without projects.
SELECT p.ProjectName, d.DepartmentName
FROM Projects p
FULL JOIN Departments d ON p.DepartmentID = d.DepartmentID
WHERE p.DepartmentID IS NULL OR d.DepartmentID IS NULL;

-- Find employees without projects and projects without employees.
SELECT e.EmployeeName, p.ProjectName
FROM Employees e
FULL JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
FULL JOIN Projects p ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL OR ep.ProjectID IS NULL;

-- Show all orphan records across Employees and Departments.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
FULL JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID IS NOT NULL AND d.DepartmentID IS NULL;


-- ------------------------------------------
-- EXPERT LEVEL CHALLENGES
-- ------------------------------------------

-- Find the department with the highest project budget.
SELECT TOP 1 d.DepartmentName, SUM(p.Budget) AS TotalBudget
FROM Departments d
INNER JOIN Projects p ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalBudget DESC;

-- Find employees working in departments without projects.
SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
LEFT JOIN Projects p ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;

-- Find projects having multiple employees.
SELECT p.ProjectName, COUNT(ep.EmployeeID) AS EmployeeCount
FROM Projects p
INNER JOIN EmployeeProjects ep ON p.ProjectID = ep.ProjectID
GROUP BY p.ProjectName
HAVING COUNT(ep.EmployeeID) > 1;

-- Find employees assigned to projects outside their own department.
SELECT e.EmployeeName, d.DepartmentName AS EmployeeDept, p.ProjectName, pd.DepartmentName AS ProjectDept
FROM Employees e
INNER JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p ON ep.ProjectID = p.ProjectID
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
LEFT JOIN Departments pd ON p.DepartmentID = pd.DepartmentID
WHERE e.DepartmentID IS NULL OR e.DepartmentID <> p.DepartmentID;

-- Find departments where every employee is assigned to a project.
SELECT d.DepartmentName
FROM Departments d
INNER JOIN Employees e ON d.DepartmentID = e.DepartmentID
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
GROUP BY d.DepartmentID, d.DepartmentName
HAVING COUNT(CASE WHEN ep.ProjectID IS NULL THEN 1 END) = 0;

-- Find employees who share the same manager.
SELECT m.EmployeeName AS ManagerName, e.EmployeeName AS EmployeeName
FROM Employees e
INNER JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE e.ManagerID IN (
    SELECT ManagerID 
    FROM Employees 
    WHERE ManagerID IS NOT NULL 
    GROUP BY ManagerID 
    HAVING COUNT(EmployeeID) > 1
);

-- Find departments with no managers.
SELECT d.DepartmentName
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID AND e.EmployeeID IN (SELECT DISTINCT ManagerID FROM Employees WHERE ManagerID IS NOT NULL)
WHERE e.EmployeeID IS NULL;

-- Find managers with more than three employees.
SELECT m.EmployeeName AS ManagerName, COUNT(e.EmployeeID) AS DirectReportsCount
FROM Employees e
INNER JOIN Employees m ON e.ManagerID = m.EmployeeID
GROUP BY m.EmployeeName
HAVING COUNT(e.EmployeeID) > 3;

-- Find employees hired before their manager.
SELECT e.EmployeeName AS EmployeeName, e.JoiningDate AS EmployeeHired, m.EmployeeName AS ManagerName, m.JoiningDate AS ManagerHired
FROM Employees e
INNER JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE e.JoiningDate < m.JoiningDate;

-- Create one comprehensive master report.
SELECT 
    e.EmployeeName, 
    d.DepartmentName AS Department, 
    p.ProjectName AS Project, 
    p.Budget, 
    m.EmployeeName AS ManagerName, 
    e.Salary, 
    d.Location AS DepartmentLocation
FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
LEFT JOIN EmployeeProjects ep ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p ON ep.ProjectID = p.ProjectID
LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID;


-- ==========================================
-- SET OPERATORS ASSIGNMENTS
-- ==========================================

-- ------------------------------------------
-- BASIC ASSIGNMENTS (SETS)
-- ------------------------------------------

-- UNION
-- Display all employee names from current and former employees without duplicates.
SELECT EmployeeName FROM CurrentEmployees
UNION
SELECT EmployeeName FROM FormerEmployees;

-- Display all departments from both employee tables.
SELECT Department FROM CurrentEmployees
UNION
SELECT Department FROM FormerEmployees;

-- Display all customer names from domestic and international customers.
SELECT CustomerName FROM DomesticCustomers
UNION
SELECT CustomerName FROM InternationalCustomers;

-- Display all customer cities without duplicates.
SELECT City FROM DomesticCustomers
UNION
SELECT City FROM InternationalCustomers;

-- Display all order amounts from both order tables without duplicates.
SELECT Amount FROM OnlineOrders
UNION
SELECT Amount FROM StoreOrders;


-- UNION ALL
-- Display all employee names including duplicates.
SELECT EmployeeName FROM CurrentEmployees
UNION ALL
SELECT EmployeeName FROM FormerEmployees;

-- Display all departments including duplicate values.
SELECT Department FROM CurrentEmployees
UNION ALL
SELECT Department FROM FormerEmployees;

-- Display all customer names including duplicates.
SELECT CustomerName FROM DomesticCustomers
UNION ALL
SELECT CustomerName FROM InternationalCustomers;

-- Display all customer cities including duplicates.
SELECT City FROM DomesticCustomers
UNION ALL
SELECT City FROM InternationalCustomers;

-- Display all order amounts including duplicate values.
SELECT Amount FROM OnlineOrders
UNION ALL
SELECT Amount FROM StoreOrders;


-- EXCEPT
-- Find current employees who are not former employees.
SELECT EmployeeName FROM CurrentEmployees
EXCEPT
SELECT EmployeeName FROM FormerEmployees;

-- Find former employees who are not current employees.
SELECT EmployeeName FROM FormerEmployees
EXCEPT
SELECT EmployeeName FROM CurrentEmployees;

-- Find domestic customers not present internationally.
SELECT CustomerName FROM DomesticCustomers
EXCEPT
SELECT CustomerName FROM InternationalCustomers;

-- Find online orders not present in store orders.
SELECT OrderID, Amount FROM OnlineOrders
EXCEPT
SELECT OrderID, Amount FROM StoreOrders;

-- Find departments that exist only in current employees.
SELECT Department FROM CurrentEmployees
EXCEPT
SELECT Department FROM FormerEmployees;


-- INTERSECT
-- Find employees present in both tables.
SELECT EmployeeName FROM CurrentEmployees
INTERSECT
SELECT EmployeeName FROM FormerEmployees;

-- Find common departments.
SELECT Department FROM CurrentEmployees
INTERSECT
SELECT Department FROM FormerEmployees;

-- Find customers present in both customer tables.
SELECT CustomerName FROM DomesticCustomers
INTERSECT
SELECT CustomerName FROM InternationalCustomers;

-- Find common cities.
SELECT City FROM DomesticCustomers
INTERSECT
SELECT City FROM InternationalCustomers;

-- Find common orders.
SELECT OrderID, CustomerID, Amount FROM OnlineOrders
INTERSECT
SELECT OrderID, CustomerID, Amount FROM StoreOrders;


-- ------------------------------------------
-- INTERMEDIATE ASSIGNMENTS (SETS)
-- ------------------------------------------

-- UNION
-- Display all employee IDs and names.
SELECT EmployeeID, EmployeeName FROM CurrentEmployees
UNION
SELECT EmployeeID, EmployeeName FROM FormerEmployees;

-- Display all customer IDs and names.
SELECT CustomerID, CustomerName FROM DomesticCustomers
UNION
SELECT CustomerID, CustomerName FROM InternationalCustomers;

-- Display all salaries without duplicates.
SELECT Salary FROM CurrentEmployees
UNION
SELECT Salary FROM FormerEmployees;

-- Display all order IDs.
SELECT OrderID FROM OnlineOrders
UNION
SELECT OrderID FROM StoreOrders;

-- Combine employee and former employee department lists.
SELECT Department FROM CurrentEmployees
UNION
SELECT Department FROM FormerEmployees;


-- UNION ALL
-- Count total rows returned using UNION ALL.
SELECT COUNT(*) AS TotalRowsCount 
FROM (
    SELECT EmployeeID FROM CurrentEmployees
    UNION ALL
    SELECT EmployeeID FROM FormerEmployees
) Temp;

-- Display all customer records including duplicates.
SELECT CustomerID, CustomerName, City FROM DomesticCustomers
UNION ALL
SELECT CustomerID, CustomerName, City FROM InternationalCustomers;

-- Display all salaries including duplicates.
SELECT Salary FROM CurrentEmployees
UNION ALL
SELECT Salary FROM FormerEmployees;

-- Display all customer cities.
SELECT City FROM DomesticCustomers
UNION ALL
SELECT City FROM InternationalCustomers;

-- Display all order amounts.
SELECT Amount FROM OnlineOrders
UNION ALL
SELECT Amount FROM StoreOrders;


-- EXCEPT
-- Find employee IDs existing only in CurrentEmployees.
SELECT EmployeeID FROM CurrentEmployees
EXCEPT
SELECT EmployeeID FROM FormerEmployees;

-- Find employee IDs existing only in FormerEmployees.
SELECT EmployeeID FROM FormerEmployees
EXCEPT
SELECT EmployeeID FROM CurrentEmployees;

-- Find customer IDs existing only in DomesticCustomers.
SELECT CustomerID FROM DomesticCustomers
EXCEPT
SELECT CustomerID FROM InternationalCustomers;

-- Find customer IDs existing only in InternationalCustomers.
SELECT CustomerID FROM InternationalCustomers
EXCEPT
SELECT CustomerID FROM DomesticCustomers;

-- Find online order IDs not found in StoreOrders.
SELECT OrderID FROM OnlineOrders
EXCEPT
SELECT OrderID FROM StoreOrders;


-- INTERSECT
-- Find employee IDs common to both tables.
SELECT EmployeeID FROM CurrentEmployees
INTERSECT
SELECT EmployeeID FROM FormerEmployees;

-- Find common customer IDs.
SELECT CustomerID FROM DomesticCustomers
INTERSECT
SELECT CustomerID FROM InternationalCustomers;

-- Find common order IDs.
SELECT OrderID FROM OnlineOrders
INTERSECT
SELECT OrderID FROM StoreOrders;

-- Find common salaries.
SELECT Salary FROM CurrentEmployees
INTERSECT
SELECT Salary FROM FormerEmployees;

-- Find common departments.
SELECT Department FROM CurrentEmployees
INTERSECT
SELECT Department FROM FormerEmployees;


-- ------------------------------------------
-- ADVANCED ASSIGNMENTS (SETS)
-- ------------------------------------------

-- UNION
-- Combine employee names with customer names into one list.
SELECT EmployeeName AS Name FROM CurrentEmployees
UNION
SELECT EmployeeName FROM FormerEmployees
UNION
SELECT CustomerName FROM DomesticCustomers
UNION
SELECT CustomerName FROM InternationalCustomers;

-- Create a unique list of all people and organizations.
SELECT EmployeeName AS Entity FROM CurrentEmployees
UNION
SELECT EmployeeName FROM FormerEmployees
UNION
SELECT CustomerName FROM DomesticCustomers
UNION
SELECT CustomerName FROM InternationalCustomers;

-- Display all departments from both tables in alphabetical order.
SELECT Department FROM (
    SELECT Department FROM CurrentEmployees
    UNION
    SELECT Department FROM FormerEmployees
) Temp
ORDER BY Department ASC;

-- Combine customer cities and employee departments into one result set.
SELECT City AS Location FROM DomesticCustomers
UNION
SELECT City FROM InternationalCustomers
UNION
SELECT Department FROM CurrentEmployees
UNION
SELECT Department FROM FormerEmployees;

-- Display all IDs from employees and customers.
SELECT EmployeeID AS ID FROM CurrentEmployees
UNION
SELECT EmployeeID FROM FormerEmployees
UNION
SELECT CustomerID FROM DomesticCustomers
UNION
SELECT CustomerID FROM InternationalCustomers;


-- UNION ALL
-- Combine all employee and former employee records with duplicates.
SELECT EmployeeID, EmployeeName, Department, Salary FROM CurrentEmployees
UNION ALL
SELECT EmployeeID, EmployeeName, Department, Salary FROM FormerEmployees;

-- Display all order records.
SELECT OrderID, CustomerID, Amount FROM OnlineOrders
UNION ALL
SELECT OrderID, CustomerID, Amount FROM StoreOrders;

-- Display all customer records.
SELECT CustomerID, CustomerName, City FROM DomesticCustomers
UNION ALL
SELECT CustomerID, CustomerName, City FROM InternationalCustomers;

-- Display employee names with a new column indicating the source table (Current/Former).
SELECT EmployeeName, 'Current' AS Status FROM CurrentEmployees
UNION ALL
SELECT EmployeeName, 'Former' AS Status FROM FormerEmployees;

-- Combine online and store orders with a source column.
SELECT OrderID, CustomerID, Amount, 'Online' AS OrderSource FROM OnlineOrders
UNION ALL
SELECT OrderID, CustomerID, Amount, 'Store' AS OrderSource FROM StoreOrders;


-- EXCEPT
-- Find customers who ordered online but never ordered in-store.
SELECT CustomerID FROM OnlineOrders
EXCEPT
SELECT CustomerID FROM StoreOrders;

-- Find customers who ordered in-store but never ordered online.
SELECT CustomerID FROM StoreOrders
EXCEPT
SELECT CustomerID FROM OnlineOrders;

-- Find employee names existing only in current employees.
SELECT EmployeeName FROM CurrentEmployees
EXCEPT
SELECT EmployeeName FROM FormerEmployees;

-- Find departments unique to former employees.
SELECT Department FROM FormerEmployees
EXCEPT
SELECT Department FROM CurrentEmployees;

-- Find customer cities unique to domestic customers.
SELECT City FROM DomesticCustomers
EXCEPT
SELECT City FROM InternationalCustomers;


-- INTERSECT
-- Find customers who ordered both online and in-store.
SELECT CustomerID FROM OnlineOrders
INTERSECT
SELECT CustomerID FROM StoreOrders;

-- Find employees existing in both tables.
SELECT EmployeeID, EmployeeName FROM CurrentEmployees
INTERSECT
SELECT EmployeeID, EmployeeName FROM FormerEmployees;

-- Find departments appearing in both employee tables.
SELECT Department FROM CurrentEmployees
INTERSECT
SELECT Department FROM FormerEmployees;

-- Find customer names appearing in both customer tables.
SELECT CustomerName FROM DomesticCustomers
INTERSECT
SELECT CustomerName FROM InternationalCustomers;

-- Find common salaries between current and former employees.
SELECT Salary FROM CurrentEmployees
INTERSECT
SELECT Salary FROM FormerEmployees;
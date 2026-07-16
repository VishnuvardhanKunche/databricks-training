# Offline Databricks Training

## Day 2 (15-07-2026)

### Topic
**SQL Joins and Set Operators**

---

## Overview

This assignment focused on understanding how to combine and compare data from multiple tables using SQL Join operations and Set Operators. Multiple datasets such as Employees, Departments, Customers, Orders, Students, Courses, Products, Suppliers, Domestic Customers, International Customers, Current Employees, Former Employees, Online Orders, and Store Orders were used to solve practical business scenarios.

The exercises helped strengthen SQL fundamentals that are essential for relational database querying and data engineering.

---

## What We Did Today

### Database Creation

- Created multiple relational tables
- Inserted sample records into each table
- Established relationships between related datasets

### SQL Join Operations

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- FULL OUTER JOIN
- CROSS JOIN
- SELF JOIN

### Set Operators

- UNION
- UNION ALL
- EXCEPT
- INTERSECT

### Business Scenarios Solved

- Employee and department analysis
- Customer and order analysis
- Student and course enrollments
- Product and supplier information
- Employee-manager relationships
- Customers without orders
- Departments without employees
- Matching and non-matching records
- Comparing current and former employees
- Comparing online and in-store customers
- Finding common and unique records across datasets

---

## SQL Concepts Used

| Concept | Description |
|----------|-------------|
| INNER JOIN | Returns matching records from both tables |
| LEFT JOIN | Returns all records from the left table with matching records from the right table |
| RIGHT JOIN | Returns all records from the right table with matching records from the left table |
| FULL OUTER JOIN | Returns all matching and non-matching records |
| CROSS JOIN | Produces the Cartesian product of two tables |
| SELF JOIN | Joins a table with itself to retrieve hierarchical relationships |
| UNION | Combines results and removes duplicates |
| UNION ALL | Combines results while keeping duplicates |
| INTERSECT | Returns common records between two queries |
| EXCEPT | Returns records present only in the first query |
| GROUP BY | Groups records for aggregation |
| COUNT() | Counts matching records |
| SUM() | Calculates total values |
| AVG() | Calculates average values |
| MAX() | Finds the maximum value |
| MIN() | Finds the minimum value |
| ORDER BY | Sorts query results |
| WHERE | Filters records based on conditions |

---

## Key Concepts Learned

| Concept | Purpose |
|---------|---------|
| Relational Database Design | Organize data into multiple related tables |
| Primary & Foreign Keys | Establish relationships between tables |
| SQL Joins | Retrieve related information from multiple tables |
| Self Join | Represent hierarchical relationships such as employee-manager |
| Set Operators | Compare, merge, and identify unique/common records |
| Data Comparison | Find matching and non-matching records across datasets |
| Business Querying | Solve real-world reporting scenarios using SQL |
| Query Optimization | Write clean and readable SQL queries |

---

## Files in This Folder

| File | Description |
|------|-------------|
| `Joins_Set_Assignments.txt` | Day 2 SQL practice questions |
| `Query.sql` | Complete SQL solutions for Join and Set Operator exercises |
| `README.md` | Documentation for the Day 2 assignment |

---

## Learning Outcomes

After completing this assignment, I learned how to:

- Create and populate multiple related database tables
- Work with different SQL Join operations
- Retrieve and analyze data from multiple tables
- Build employee-manager relationships using Self Join
- Compare datasets using UNION, UNION ALL, EXCEPT, and INTERSECT
- Solve real-world business problems using SQL
- Write structured and optimized SQL queries for relational databases

---

## Note

This assignment is part of the **Offline Databricks Training** conducted on **15-07-2026**. It focuses on mastering SQL Join operations and Set Operators, providing a strong foundation for implementing equivalent DataFrame joins and transformations in PySpark during future Databricks sessions.
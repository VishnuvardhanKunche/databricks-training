# Assignment 4 – SQL Window Functions Assignment (22-07-2026)

---

## Overview

Assignment 4 of the **Offline Databricks Training** focused on advanced SQL concepts, primarily **Window Functions**, **Subqueries**, and **Common Table Expressions (CTEs)**.

The assignment was designed to strengthen analytical SQL skills by solving real-world business scenarios using Employee and Department datasets. It covered ranking techniques, row-wise analysis, manager-employee relationships, and advanced query writing using reusable SQL logic.

---

## What We Did Today

### Database Setup

* Created **Departments** and **Employees** tables
* Inserted sample employee and department records
* Established relationships using `DepartmentID` and `ManagerID`

### Window Functions

* Generated row numbers using `ROW_NUMBER()`
* Ranked employees using `RANK()` and `DENSE_RANK()`
* Identified highest, second highest, and top employees department-wise
* Compared salaries using `LEAD()` and `LAG()`
* Performed row-wise analytical calculations

### Subqueries

* Compared employee salaries with department averages
* Retrieved highest and second highest salaries
* Found employees earning more than their managers
* Identified departments with the maximum number of employees
* Used nested queries to solve business scenarios

### Common Table Expressions (CTEs)

* Created reusable query blocks using `WITH`
* Generated department-wise salary reports
* Calculated average and total salaries
* Identified duplicate salaries
* Retrieved experienced employees
* Removed duplicate records using `ROW_NUMBER()`

---

## Key Concepts Learned

| Concept              | Purpose                                               |
| -------------------- | ----------------------------------------------------- |
| Window Functions     | Perform analytical calculations without grouping rows |
| Ranking              | Identify highest, lowest, and top-N records           |
| LEAD & LAG           | Compare current rows with adjacent rows               |
| Subqueries           | Build dynamic filtering and comparison logic          |
| CTE                  | Simplify complex SQL queries                          |
| Department Analytics | Analyze salaries and employee distribution            |
| Manager Analysis     | Compare employees with reporting managers             |
| Advanced SQL         | Solve real-world analytical business problems         |

---

## Files in This Folder

| File                             | Description                                                                 |
| -------------------------------- | --------------------------------------------------------------------------- |
| `Window_Functions_Questions.txt` | Assignment questions provided during the offline training session           |
| `Solutions.sql`                  | Complete SQL solutions for all Window Function, Subquery, and CTE exercises |
| `Readme.md`                      | Documentation for Day 4 assignment                                          |

---

## Note

The `Solutions.sql` file contains complete solutions for all assignment questions. Each solution is preceded by the corresponding question as a SQL comment, making it easy to navigate and understand the purpose of every query.

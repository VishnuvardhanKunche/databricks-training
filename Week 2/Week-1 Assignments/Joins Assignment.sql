-- Schema code:
drop table if exists projects;
drop table if exists employees;
drop table if exists departments;

create table employees (
    emp_id int primary key,
    emp_name varchar(50),
    manager_id int,
    dept_id int
);
insert into employees values
(1, 'Karthik', null, 1),
(2, 'Ajay', 1, 1),
(3, 'Vijay', 1, 2),
(4, 'Vinay', 2, 2),
(5, 'Meena', 3, 3),
(6, 'Veer', null, 4),
(7, 'Keerthi', 4, 5),
(8, 'Priya', 4, 5);

create table departments (
    dept_id int primary key,
    dept_name varchar(50)
);
insert into departments values
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Sales');

create table projects (
    project_id int primary key,
    project_name varchar(50),
    emp_id int
);
insert into projects values
(1, 'Project A', 1),
(2, 'Project B', 2),
(3, 'Project C', 3),
(4, 'Project D', 4),
(5, 'Project E', 5);


-- 1. employees and their managers, including employees without managers (self join)
select e.emp_name as employee, m.emp_name as manager
from employees e
left join employees m on e.manager_id = m.emp_id;

-- 2. all employees and their departments, including those without a department
select e.emp_name, d.dept_name
from employees e
left join departments d on e.dept_id = d.dept_id;

-- 3. employees who report to a manager with their manager name
select e.emp_name as employee, m.emp_name as manager
from employees e
inner join employees m on e.manager_id = m.emp_id;

-- 4. all departments including those with no employees
select d.dept_name, count(e.emp_id) as employee_count
from departments d
left join employees e on d.dept_id = e.dept_id
group by d.dept_id, d.dept_name;

-- 5. employees who do not belong to any department
select e.emp_name
from employees e
left join departments d on e.dept_id = d.dept_id
where d.dept_id is null;

-- 6. employees and their projects, null for those without projects
select e.emp_name, p.project_name
from employees e
left join projects p on e.emp_id = p.emp_id;

-- 7. employees who have completed at least one project
select e.emp_name, p.project_name
from employees e
inner join projects p on e.emp_id = p.emp_id;

-- 8. all projects including those without an employee assigned
select e.emp_name, p.project_name
from employees e
right join projects p on e.emp_id = p.emp_id;

-- 9. all employees with null for those without salary records (no salary table, shown as concept)
select e.emp_name, null as salary
from employees e;

-- 10. employees and their department names including those not in any department
select e.emp_name, d.dept_name
from employees e
left join departments d on e.dept_id = d.dept_id;

-- 11. all departments and employees, including departments with no employees
select d.dept_name, e.emp_name
from departments d
left join employees e on d.dept_id = e.dept_id;

-- 12. all employees with their contact info (no contact table - shown as left join concept)
select e.emp_name, null as contact
from employees e;

-- 13. all employees and departments including unmatched from both sides (full outer join simulation)
select e.emp_name, d.dept_name
from employees e
left join departments d on e.dept_id = d.dept_id
union
select e.emp_name, d.dept_name
from employees e
right join departments d on e.dept_id = d.dept_id;

-- 14. employees who have not completed any project
select e.emp_name, p.project_name
from employees e
left join projects p on e.emp_id = p.emp_id
where p.project_id is null;

-- 15. employees and their projects, including those without a project
select e.emp_name, p.project_name
from employees e
left join projects p on e.emp_id = p.emp_id;

-- 16. all projects and their assigned employees, including unassigned projects
select e.emp_name, p.project_name
from projects p
left join employees e on p.emp_id = e.emp_id;

-- 17. employees who have both a manager and at least one project
select e.emp_name, m.emp_name as manager, p.project_name
from employees e
inner join employees m on e.manager_id = m.emp_id
inner join projects p on e.emp_id = p.emp_id;

-- 18. employees and their departments, excluding those without a department
select e.emp_name, d.dept_name
from employees e
inner join departments d on e.dept_id = d.dept_id;

-- 19. employees with their department names (all including no dept)
select e.emp_name, d.dept_name
from employees e
left join departments d on e.dept_id = d.dept_id;

-- 20. all departments and employees, including empty departments
select d.dept_name, e.emp_name
from departments d
left join employees e on d.dept_id = e.dept_id;

-- 21. employees who have a project but no department
select e.emp_name, p.project_name
from employees e
inner join projects p on e.emp_id = p.emp_id
left join departments d on e.dept_id = d.dept_id
where d.dept_id is null;

-- 22. total employees per department including empty departments
select d.dept_name, count(e.emp_id) as employee_count
from departments d
left join employees e on d.dept_id = e.dept_id
group by d.dept_id, d.dept_name;

-- 23. employees who report to a manager only
select e.emp_name, m.emp_name as manager
from employees e
inner join employees m on e.manager_id = m.emp_id;

-- 24. all employees with their manager, including those without a manager
select e.emp_name, m.emp_name as manager
from employees e
left join employees m on e.manager_id = m.emp_id;

-- 25. departments and number of employees including empty departments
select d.dept_name, count(e.emp_id) as employee_count
from departments d
left join employees e on d.dept_id = e.dept_id
group by d.dept_id, d.dept_name;

-- 26. all employees and departments including empty departments
select e.emp_name, d.dept_name
from departments d
left join employees e on d.dept_id = e.dept_id;

-- 27. employees without any salary records (conceptual - no salary table)
select e.emp_name
from employees e;

-- 28. employees and their project assignments, null if no project
select e.emp_name, p.project_name
from employees e
left join projects p on e.emp_id = p.emp_id;

-- 29. employees with department and project, including those without either
select e.emp_name, d.dept_name, p.project_name
from employees e
left join departments d on e.dept_id = d.dept_id
left join projects p on e.emp_id = p.emp_id;

-- 30. employees with their department, including those without a department
select e.emp_name, d.dept_name
from employees e
left join departments d on e.dept_id = d.dept_id;
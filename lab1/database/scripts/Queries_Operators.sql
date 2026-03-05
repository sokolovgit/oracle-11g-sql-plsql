-- ============================================================
-- Запити для вивчення допоміжних операторів SQL
-- DISTINCT, ORDER BY, =, <>, !=, <, <=, >, >=, BETWEEN, IS NULL, AND
-- ============================================================

-- DISTINCT: унікальні ідентифікатори відділів
SELECT DISTINCT department_id FROM EMPLOYEES;

-- ORDER BY: співробітники за датою найму (від новіших)
SELECT employee_id, last_name, hire_date FROM EMPLOYEES
ORDER BY hire_date DESC;

-- = : країни регіону 1
SELECT country_id, country_name FROM COUNTRIES
WHERE region_id = 1;

-- <> : відділи не в локації 1700
SELECT department_name FROM DEPARTMENTS
WHERE location_id <> 1700;

-- != : посади, крім Shipping Clerk
SELECT job_title FROM JOBS
WHERE job_title != 'Shipping Clerk';

-- < : зарплата менше 5000
SELECT last_name, salary FROM EMPLOYEES
WHERE salary < 5000;

-- <= : історія роботи, дата початку не пізніша за 01.01.2006
SELECT employee_id, job_id, start_date, end_date FROM JOB_HISTORY
WHERE start_date <= TO_DATE('01.01.2006', 'DD.MM.YYYY');

-- > : посади з max_salary > 15000
SELECT job_title, max_salary FROM JOBS
WHERE max_salary > 15000;

-- >= : зарплата не менше 10000
SELECT last_name, salary FROM EMPLOYEES
WHERE salary >= 10000;

-- BETWEEN: зарплата від 4000 до 8000
SELECT last_name, first_name, salary FROM EMPLOYEES
WHERE salary BETWEEN 4000 AND 8000;

-- IS NULL: співробітники без керівника
SELECT e.last_name, e.job_id, d.department_name
FROM EMPLOYEES e
LEFT JOIN DEPARTMENTS d ON e.department_id = d.department_id
WHERE e.manager_id IS NULL;

-- AND: відділ Sales і зарплата > 8000
SELECT e.first_name, e.last_name, e.salary
FROM EMPLOYEES e
JOIN DEPARTMENTS d ON e.department_id = d.department_id
WHERE d.department_name = 'Sales' AND e.salary > 8000;

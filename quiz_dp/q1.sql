CREATE SCHEMA quiz;
USE quiz;

CREATE TABLE employees LIKE employees.employees;
CREATE TABLE salaries LIKE employees.salaries;
INSERT INTO employees SELECT * FROM employees.employees;
INSERT INTO salaries SELECT * FROM employees.salaries;

select * from employees;
select * from salaries;

-- 문제1.

SELECT * FROM employees WHERE last_name = 'Swan';

EXPLAIN SELECT * FROM employees WHERE last_name = 'Swan';

CREATE INDEX idx_lastname ON employees(last_name);

SELECT * FROM employees WHERE last_name = 'Swan';

EXPLAIN SELECT * FROM employees WHERE last_name = 'Swan';


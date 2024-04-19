
-- 문제2.

SELECT * FROM employees WHERE first_name = 'bader' AND last_name = 'Swan';

EXPLAIN SELECT * FROM employees WHERE first_name = 'bader' AND last_name = 'Swan';

CREATE INDEX idx_firstname_lastname ON employees(first_name, last_name);

SELECT * FROM employees WHERE first_name = 'bader' AND last_name = 'Swan';

EXPLAIN SELECT * FROM employees WHERE first_name = 'bader' AND last_name = 'Swan';

SHOW INDEX FROM employees;


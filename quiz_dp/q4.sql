
-- 문제4.
SET @emp_no = 10200;
SET @sql_query = CONCAT('SELECT salary, from_date, to_date FROM salaries WHERE emp_no = ', @emp_no, ' ORDER BY from_date ASC');

PREPARE ready FROM @sql_query;

EXECUTE ready;

DEALLOCATE PREPARE ready;



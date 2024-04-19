-- 뮨재3,

DELIMITER $$
CREATE PROCEDURE GetEmployeeSalariesByYear(IN emp_no INT, IN year INT)
BEGIN
    SELECT salary, from_date 
    FROM salaries 
    WHERE emp_no = emp_no 
      AND YEAR(from_date) = year;
END$$
DELIMITER ;

CALL GetEmployeeSalariesByYear(80000, 2000);



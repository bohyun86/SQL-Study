-- 외래 키 레퍼런스 옵션
-- 1. CASECADE
DROP TABLE employees;
DROP TABLE departments;

CREATE TABLE departments (
	department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

-- 직원 테이블 생성
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    department_id INT,
    -- 직원 테이블의 부서 ID는 부서 테이블의 부서 ID를 참조 (외래 키 설정)
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
    -- 특정 부서가 삭제될 때 해당 부서직원 정보도 모두 삭제
    ON DELETE CASCADE
);

DESCRIBE employees;
-- CASCADE 적용 확인
SELECT * FROM employees;
SELECT * FROM departments;

-- 2. SET NULL
-- 테이블 삭제
DROP TABLE employees;
DROP TABLE departments;

-- 부서 테이블 생성
CREATE TABLE departments (
	department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

-- 직원 테이블 생성
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    department_id INT,
    -- 직원 테이블의 부서 ID는 부서 테이블의 부서 ID를 참조 (외래 키 설정)
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
    -- 특정 부서가 삭제될 때 해당 부서 직원의 부서 ID가 NULL로 설정됨.
    ON DELETE SET NULL
);

DESCRIBE employees;
-- SET NULL 적용 확인
SELECT * FROM departments;
SELECT * FROM employees;

-- 3. NO ACTION
-- 고객 테이블 생성
CREATE TABLE customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL
);

-- 고객 테이블을 참조하는 주문 테이블 생성
CREATE TABLE orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
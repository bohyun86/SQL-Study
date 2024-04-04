-- DEFAULT 제약조건
-- 각 컬럼에 대한 기본 값 지정
CREATE TABLE persons (
	id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    status VARCHAR(50) DEFAULT '활동중',			-- 상태 열이 기본값으로 '활동중'
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- 가입일 기본값으로 현재시간
);
DESCRIBE persons;
select * from persons;
DROP TABLE persons;
-- AUTO_INCREMENT 데이터베이서 자동으로 값이 증가하는 열 설정
-- 일반적으로 기본키 컬럼에 사용됨.
CREATE TABLE products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL
);
DESCRIBE products;
SELECT * FROM products;

USE test_db;
DROP TABLE employees;
-- 외래 키 - 참조 무결성 제약조건
-- 한 테이블의 컬럼이 다른 테이블의 키(기본 키)를 참조

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
    -- 직원 테이블의 부서 ID는 부서 테이블의 부서 ID를 참조 (왜래 키 설정)
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 외래키 컬럼에 참조 위치에 존재하지 않는 값을 넣을 경우
-- 참조 무결성을 위반하게 되어 실행되지 않는다. (참조 무결성 제약조건)
-- 데이터 관계의 일관성을 보장
SELECT * FROM employees;
SELECT * FROM departments;

-- 외래 키 레퍼런스 옵션
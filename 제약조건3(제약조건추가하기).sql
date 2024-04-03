-- 제약조건 추가하기
ALTER TABLE employees ADD COLUMN email VARCHAR(255); 

-- UNIQUE 제약조건 추가
ALTER TABLE employees ADD UNIQUE (email);

-- 외래키 제약조건 추가
-- 1. 참조할 테이블 생성
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- 2. 외래키로 사용할 필드를 추가
ALTER TABLE employees ADD COLUMN department_id INT;

-- 3. 외래키 제약조건 추가 (CONSTRAINT 제약조건이름)
ALTER TABLE employees ADD CONSTRAINT fk_department_id
FOREIGN KEY (department_id) REFERENCES departments(department_id);

DESCRIBE employees;
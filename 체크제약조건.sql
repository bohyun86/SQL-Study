-- 체크 제약조건 추가
-- 1. 체크할 필드 추가
ALTER TABLE employees ADD COLUMN age INT;

-- 2. 체크 제약조건 추가 (제약조건의 이름을 명시 : CONSTRAINT 제약조건이름)
ALTER TABLE employees ADD CONSTRAINT chk_age
CHECK (age > 19);

-- 열에 대한 설명 추가
ALTER TABLE employees ADD COLUMN salary INT COMMENT '직원의 급여와 관련된 속성';

-- 제약조건 삭제하기
-- 1. 외래키 삭제하기
ALTER TABLE employees DROP FOREIGN KEY fk_department_id;

-- 2. 체크 명시 제약조건 삭제하기
ALTER TABLE employees DROP CONSTRAINT chk_age;

-- ALTER COLUMN 으로 열 속성 변경하기
-- 1. 기본 값 추가
ALTER TABLE employees ALTER COLUMN age SET DEFAULT 20;
-- 2. 기본 값 삭제
ALTER TABLE employees ALTER COLUMN age DROP DEFAULT;

-- 테이블 삭제(DROP)
-- DDL (데이터 정의어)의 일부로 DB 객체를 삭제
-- 명령어를 사용하게 되면, 테이블과 테이블에 포함되어 있는
-- 데이터가 영구적으로 삭제, 주의해서 사용
-- DROP TABLE 테이블명;
USE alter_test;

DROP TABLE employees;
DROP TABLE departments;

-- 데이터베이스(스키마) 삭제
DROP SCHEMA alter_test;

-- 여러 테이블 동시 삭제 (스키마명.테이블명)
DROP TABLE healthcaremanagement.appointments, 
			healthcaremanagement.doctors,
			healthcaremanagement.patients;
            
DROP DATABASE healthcaremanagement;
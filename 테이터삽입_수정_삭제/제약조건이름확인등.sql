-- 제약조건 이름 확인하기
-- 1. information_schema 오브젝트를 통해 확인
-- CONTRAINT_NAME 필드 : 제약조건의 이름
SELECT * FROM information_schema.table_constraints
WHERE table_name = 'employees';  -- 테이블명

-- 2. DDL을 통해 확인
-- SHOW CREATE TABLE 스키마명.테이블명;
SHOW CREATE TABLE employees;

SELECT * FROM information_schema.table_constraints
WHERE table_name = 'Books';  -- 테이블명

SELECT * 
FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS 
WHERE CONSTRAINT_SCHEMA = 'LibraryManagement'; -- 데이터베이스 이름

SELECT * 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE TABLE_NAME = 'BorrowRecords'
AND CONSTRAINT_SCHEMA = 'LibraryManagement'; -- 데이터베이스 이름

SELECT CONSTRAINT_NAME 
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_SCHEMA = 'LibraryManagement' -- 여기에 데이터베이스 이름을 입력하세요
AND TABLE_NAME = 'Members' 
AND CONSTRAINT_TYPE = 'UNIQUE';
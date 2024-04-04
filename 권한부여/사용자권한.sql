-- 사용자 역할 및 권한
-- [Administration] -> [Users and Preivileges]
-- [Add Acount] 를 클릭하여 추가 가능

-- 유저 생성 SQL문
-- @ 뒤의 '%'는 모든 호스트를 가리킴
-- IDENTIFIED BY -> 비밀번호
CREATE USER director@'%' IDENTIFIED BY '1234';

-- 권한을 부여하는 SQL문
-- GRANT 권한부여
-- ALL 모든 권한
-- *.* 모든 데이터베이스의 모든 테이블
-- TO director@'%' 누구에게 부여할 것인지
-- WITH GRANT OPTION 다른 사용자에게도 권한 부여 권한을 가짐
GRANT ALL ON *.* TO director@'%' WITH GRANT OPTION;

-- 사장님 : 모든 데이터베이스를 읽는 권한만
CREATE USER ceo@'%' IDENTIFIED BY '1234';
GRANT SELECT ON *.* TO ceo@'%';
-- 직원 : shopdb는 CRUD 권한, employeesd는 읽기 권한
CREATE USER staff@'%' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE, DELETE ON shopdb.* TO staff@'%';
GRANT SELECT ON employees.* TO staff@'%';

-- 팀장님 : 모든 권한을 가지고 모든 명령 수행 가능
CREATE DATABASE test_db;
DROP DATABASE test_db;

-- 사장님
USE shopDB;
SELECT * FROM memberTbl;
-- 모든 데이터베이스의 테이블을 읽을 수 있지만, 삽입, 수정, 삭제 권한 없음
DELETE FROM membertbl;
CREATE DATABASE test_db;

-- 직원 : 스키마별로 권한 부여
CREATE DATABASE test_db;
-- 특정 스키마에 대해서는 권한이 SELECT만 있을 때
-- 삽입, 수정, 삭제 불가
use employees;
select * from employees;
DELETE FROM employees;

-- 권한이 있는 스키마에 대해서는 명령 적용 가능
use shopdb;
SELECT * FROM membertbl;
DELETE FROM membertbl WHERE memberID = 'Abc';



CREATE TABLE INDEX_TBL (
	first_name varchar(14),
    last_name varchar(16),
    hire_date date
    );
INSERT INTO INDEX_TBL
	SELECT first_name, last_name, hire_date
    FROM employees.employees
	LIMIT 500;
SELECT * FROM INDEX_TBL;

-- 데이터 선택하여 활용
SELECT * FROM PRODUCTTBL;
SELECT MEMBERNAME, MEMBERADDRESS FROM MEMBERTBL;
SELECT * FROM MEMBERTBL WHERE MEMBERNAME = '지운이';

-- 테이블의 생성과 삭제
CREATE TABLE `my test_tbl` (id INT);
DROP TABLE `my test_tbl`;

-- 인덱스 생성 (데이터 삽입 및 비교)
CREATE TABLE INDEX_TBL (
	first_name varchar(14),
    last_name varchar(16),
    hire_date date
    );
INSERT INTO INDEX_TBL
	SELECT first_name, last_name, hire_date
    FROM employees.employees
	LIMIT 500;
SELECT * FROM INDEX_TBL;

SELECT * FROM index_tbl WHERE first_name = 'Mary';

CREATE INDEX IDX_INDEX_TBL_FIRSTNAME
	ON INDEX_TBL(FIRST_NAME);

-- 사용자 뷰 만들기    
CREATE VIEW uv_member_tbl
AS
	SELECT memberName, memberAddress
    FROM membertbl;

SELECT * FROM uv_member_tbl;

# SQL (Struectured Query Language)
 - 관계형 데이터베이스(RDBMS)에서 데이터를 관리하기 위해 사용하는 표준화된 언어

 - 데이터 정의 언어 (Data Definition Language) : DDL
 - 데이터 조작 언어 (Data Manipulation Language) : DML
 - 데이터 질의 언어 (Data Query Language) : DQL
 - 데이터 제어 언어 (Data Control Language) : DCL
 - 트랜잭션 제어 언어 (Transaction Control Language) : TCL

-- 키워드 등이 자동완성(인텔리센스)
use shopdb;
-- 스키마에서 키워드나 테이블 이름을 가져올 수 있음
use employees;
-- Ctrl + / 주석
-- Ctrl + B 쿼리문 정리
SELECT 
    *
FROM
    employees;
-- 해당 코드라인만 실행 단축키 Ctrl + Enter
-- 행 개수 제한을 선택할 수 있음 (기본 1000줄)
-- 예약어를 대문자로 자동완성하고 싶을 때
-- [Edit] > [Prepeference] > [SQL Editor] > [Query Editor]
-- UPPERCASE keywords on completion
SELECT;
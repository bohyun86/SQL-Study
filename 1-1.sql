
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

## 테이블 생성
- CREATE : DDL (데이터 정의어)
- 데이터베이스 생성
```SQL
CREATE DATABASE 데이터베이스명;
CREATE DATABASE IF NOT EXISTS 데이터베이스명;  -- 데이터베이스 존재 확인하고 만듬
USE 데이터베이스명;  -- 특정 데이터베이스 사용
```
- 테이블 생성 문법
```SQL
CREATE TABLE 테이블명 (
   컬럼명1 데이터타입 제약조건,
   컬럼명2 데이터타입 제약조건,
   ...
   ...
   PRIMARY KEY (하나 또는 그 이상의 컬럼)
);
```

## 외래 키 참조
 - 참조 무결성 제약조건
 - 한 테이블의 컬럼이 다른 테이블의 키(기본 키)를 참조
 - 외래키 컬럼에 참조 위치에 존재하지 않는 값을 넣을 경우
 - 참조 무결성을 위반하게 되어 실행되지 않는다. (참조 무결성 제약조건)
 - 데이터 관계의 일관성을 보장

 ```sql
 FOREIGN KEY (컬럼명) REFERENCES 참조할테이블명(참조할컬럼(기본키)명)
 ON DELETE [CASECADE/SET NULL/NO ACTION/SET DEFAULT]          -- 삭제할 때 옵션
 ON UPDATE [CASECADE/SET NULL/NO ACTION/SET DEFAULT]          -- 수정할 때 옵션
 ```

- 레퍼런스 옵션
   1. CASECADE : 
     - 부모 테이블(참조하는 테이블)에서 삭제되거나 키 값이 변경되면
     - 자식 테이블에서도 동일하게 삭제되거나 변경 됨.
     - 일관성을 유지하는데 도움이 되는 옵션.
   2. SET NULL
     - 부모 테이블(참조하는 테이블)에서 삭제되거나 키 값이 변경되면
     - 자식 테이블(외래 키를 가진 테이블)의 행의 열이 NULL로 변경 됨.
     - 관련 데이터를 삭제하지 않고 유지.
   3. NO ACTION
     - 참조된 행의 변경 또는 삭제 자체를 하지 않음.
   4. SET DEFAULT
     - 삭제나 수정될 때 사전에 정의된 기본 값으로 설정
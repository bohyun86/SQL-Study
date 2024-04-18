-- 테이블 스페이스

-- 시스템 변수에서 데이터 파일 확인
-- '파일명:파일크기:최대파일크기'
SHOW VARIABLES LIKE 'innodb_data_file_path';

-- "C:\ProgramData\MySQL\MySQL Server 8.0\Data"
-- 위치에서 해당파일 'ibdata1'을 확인할 수 있음.

SHOW VARIABLES LIKE 'innodb_file_per_table';
-- 기본값 ON, 테이블마다 데이터와 인덱스를 위한 별도 파일 생성
-- OFF : 테이블들이 공통 테이블 스페이스를 공유.

-- 테이블 스페이스 생성 (3개)
-- 확장명 ibd(innodb 엔진 데이터파일)
CREATE TABLESPACE ts_a ADD DATAFILE 'ts_a.ibd';
CREATE TABLESPACE ts_b ADD DATAFILE 'ts_b.ibd';
CREATE TABLESPACE ts_c ADD DATAFILE 'ts_c.ibd';

-- 테이블 스페이스

-- 시스템 변수에서 데이터 파일 확인
-- '파일명:파일크기:최대파일크기'
SHOW VARIABLES LIKE 'innodb_data_file_path';

-- "C:\ProgramData\MySQL\MySQL Server 8.0\Data"
-- 위치에서 해당파일 'ibdata1'을 확인할 수 있음.

SHOW VARIABLES LIKE 'innodb_file_per_table';
-- 기본값 ON, 테이블마다 데이터와 인덱스를 위한 별도 파일 생성
-- OFF : 테이블들이 공통 테이블 스페이스를 공유.

-- 테이블 스페이스 생성 (3개)
-- 확장명 ibd(innodb 엔진 데이터파일)
CREATE TABLESPACE ts_a ADD DATAFILE 'ts_a.ibd';
CREATE TABLESPACE ts_b ADD DATAFILE 'ts_b.ibd';
CREATE TABLESPACE ts_c ADD DATAFILE 'ts_c.ibd';

use db_index;
-- 테이블을 생성하면서 테이블 스페이스 지정
CREATE TABLE table_a
	(id INT)
    TABLESPACE ts_a;

-- 만들어진 테이블에 테이블 스페이스 지정
CREATE TABLE table_b (id INT);
ALTER TABLE table_b TABLESPACE ts_b;

-- 대용량 데이터 테이블 복사 (약 280만행)
CREATE TABLE table_c
	(SELECT * FROM employees.salaries);
ALTER TABLE table_c TABLESPACE ts_c;

-- 쿼리 질의시간이 오래 걸려서 응답하지 않을 경우
-- [Edit] > [Preferences] - [SQL Editor]
-- [MySQL Session] 부분의 
-- 'timeout intverval'을 포함하는 2개의 항목을 0으로 설정하면
-- 시간제한을 없앨 수 있음 (주의)


CREATE TABLE usertbl -- 회원 테이블
( userID  	CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  name    	VARCHAR(10) NOT NULL, -- 이름
  birthYear   INT NOT NULL,  -- 출생년도
  addr	  	CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  mobile1	CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
  mobile2	CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
  height    	SMALLINT,  -- 키
  mDate    	DATE  -- 회원 가입일
);
CREATE TABLE buytbl -- 회원 구매 테이블(Buy Table의 약자)
(  num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   userID  	CHAR(8) NOT NULL, -- 아이디(FK)
   prodName 	CHAR(6) NOT NULL, --  물품명
   groupName 	CHAR(4)  , -- 분류
   price     	INT  NOT NULL, -- 단가
   amount    	SMALLINT  NOT NULL, -- 수량
   FOREIGN KEY (userID) REFERENCES usertbl(userID)
);

INSERT INTO usertbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);

SELECT * FROM usertbl;
SELECT * FROM buytbl;

-- 인덱스 사용 실습
use db_index;

-- 샘플 테이블 생성(usertbl, buytbl), 샘플.SQL 실행

SELECT * FROM usertbl;
-- 인덱스 확인하기
SHOW INDEX FROM usertbl;
-- 인덱스 크기 확인하기
-- => 테이블의 크기 16384, 16KB / (페이지1개 크기 = 16KB) : 페이지의 수 1개
SHOW TABLE STATUS LIKE 'usertbl';

-- 인덱스 생성하기 : 단순한 보조 인덱스 (주소 컬럼 기준)
CREATE INDEX idx_usertbl_addr ON usertbl (addr);

SHOW INDEX FROM usertbl;				-- 인덱스 생성 확인
SHOW TABLE STATUS LIKE 'usertbl';		-- 테이블 상태 확인
-- 인덱스 크기가 0으로 확인 불가

-- 생성한 인덱스를 실제 적용하려면 ANALYZE 로 분석해야 함.
ANALYZE TABLE usertbl;

SHOW TABLE STATUS LIKE 'usertbl';		-- 테이블 상태 확인
-- 테이블의 인덱스 크기가 확인됨 16KB

-- 고유 인덱스 만들기
-- CREATE UNIQUE INDEX idx_usertbl_birthYear ON usertbl (birthYear);
-- 생성 불가 : 고유 인덱스를 만들기 위해서는 컬럼의 값이 고유해야 함
SELECT * FROM usertbl;

-- 컬럼의 값들이 고유할 경우 고유 인덱스 생성 가능
CREATE UNIQUE INDEX idx_usertbl_name ON usertbl (name);

SHOW INDEX FROM usertbl;				-- 인덱스 생성 확인

-- 고유 인덱스로 생성한 경우 해당 컬럼 기준 중복값 허용 불가
-- INSERT INTO usertbl 
-- VALUES ('BBC', '바비킴', 1972, '부산', '010', '1111111', '177', '2012-06-06');

-- 복합 인덱스 만들기
CREATE INDEX idx_usertbl_name_birthYear
	ON usertbl (name, birthYear);		-- 기준 컬럼 2개 이상

SHOW INDEX FROM usertbl;				-- 인덱스 생성 확인

-- 복합 인덱스의 컬럼들을 사용해서 쿼리할 경우 인덱스를 통한 성능 향상
SELECT * FROM usertbl 
WHERE name = '윤종신' and birthYear = '1969';

-- 쿼리 실행계획 확인하기 EXPLAIN
-- 인덱스가 있는 경우 가능한 인덱스와 key가 나오고, 검색한 행의 갯수가 효율적으로 찾아짐
EXPLAIN SELECT * FROM usertbl 
WHERE name = '윤종신' and birthYear = '1969';

-- WHERE 컬럼에 인덱스가 없는 경우,
-- Full Table Scan 모든 테이블의 행을 다 찾아보고 결과를 알려줌
-- 가능한 인덱스도 없음
EXPLAIN SELECT * FROM usertbl WHERE height = 170;

SELECT * FROM usertbl;

-- 인덱스로 사용하는 컬럼은 고유값의 개수가 적은 경우 성능에 도움이 되지 않는다.

-- 인덱스 삭제하기
DROP INDEX idx_usertbl_name_birthYear ON usertbl;
ALTER TABLE usertbl DROP INDEX idx_usertbl_name;

-- 기본키(클러스터형 인덱스)는 ALTER문으로만 제거 가능
-- 참조하고 있는 외래키가 있을 경우 참조 무결성에 의해 제거할 수 없음
ALTER TABLE usertbl DROP PRIMARY KEY;

DESC buytbl;
SHOW INDEX FROM buytbl;

-- 참조키 이름 확인하기
SELECT * FROM information_schema.referential_constraints;
-- 참조가 되어있는 경우 참조 무결성을 제거하고 삭제가 가능
ALTER TABLE buytbl DROP FOREIGN KEY buytbl_ibfk_1;
ALTER TABLE usertbl DROP PRIMARY KEY;

DROP SCHEMA IF EXISTS db_index;
CREATE SCHEMA db_index;
use db_index;

-- 인덱스 성능 확인하기

-- 대량의 샘플 데이터 복사하기 (무작위 순)
CREATE TABLE emp SELECT * FROM employees.employees ORDER BY rand();
CREATE TABLE emp_cl SELECT * FROM employees.employees ORDER BY rand();
CREATE TABLE emp_se SELECT * FROM employees.employees ORDER BY rand();

SELECT * FROM emp LIMIT 5;		-- 인덱스 없는 테이블
SELECT * FROM emp_cl LIMIT 5;	-- 클러스터형 인덱스
SELECT * FROM emp_se LIMIT 5;	-- 보조 인덱스

-- 클러스터형 인덱스가 생성되면서 emp_no 기준으로 정렬
ALTER TABLE emp_cl ADD PRIMARY KEY (emp_no);

SELECT * FROM emp_cl LIMIT 5;	-- 클러스터형 인덱스 생성 후 데이터 정렬됨

-- emp_no 기준 보조 인덱스 생성
ALTER TABLE emp_se ADD INDEX idx_emp_no (emp_no);	

SELECT * FROM emp_se LIMIT 5;	-- 보조 인덱스 생성과 별개로 데이터들은 정렬되지 않음.

-- 테이블 상태 확인 데이터 약 17MB(약 1000 페이지)
-- 인덱스 길이는 보조인덱스만 약 5MB(약 300 페이지)
SHOW TABLE STATUS;
ANALYZE TABLE emp, emp_cl, emp_se;
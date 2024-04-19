create schema sqlDB;
USE sqlDB;
CREATE TABLE userTbl -- 회원 테이블
( userID   CHAR(8) NOT NULL PRIMARY KEY, -- 사용자아이디
  name     NVARCHAR(10) NOT NULL, -- 이름
  birthYear   INT NOT NULL,  -- 출생년도
  addr    NCHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  mobile1 CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
  mobile2 CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
  height     SMALLINT,  -- 키
  mDate     DATE  -- 회원 가입일
);

CREATE TABLE buyTbl (
  num INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  userID CHAR(8) NOT NULL,
  prodName NCHAR(6) NOT NULL,
  groupName NCHAR(4),
  price INT NOT NULL,
  amount SMALLINT NOT NULL,
  FOREIGN KEY (userID) REFERENCES userTbl(userID)
);


INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');

insert into buytbl (userID, prodName, groupName, price, amount)
VALUES('KBS', '운동화', NULL, 30,   2),
('KBS', '노트북', '전자', 1000, 1),
('JYP', '모니터', '전자', 200,  1),
('BBK', '모니터', '전자', 200,  5),
('KBS', '청바지', '의류', 50,   3),
('BBK', '메모리', '전자', 80,  10),
('SSK', '책'    , '서적', 15,   5),
('EJW', '책'    , '서적', 15,   2),
('EJW', '청바지', '의류', 50,   1),
('BBK', '운동화', NULL, 30,   2),
('EJW', '책'    , '서적', 15,   1),
('BBK', '운동화', NULL   , 30,   2);

SELECT * FROM userTbl;
SELECT * FROM buyTbl;
USE tempdb;

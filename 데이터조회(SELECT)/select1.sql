USE SCOTT;

-- SCOTT 데이터베이스 탐색
SHOW TABLES;
DESC EMP;		-- 직원 정보 저장 테이블
-- 사원번호, 이름, 직업, 매니저, 고용일, 급여, 커미션, 부서번호
DESC DEPT;		-- 부서 정보 테이블
-- 부서번호, 부서이름, 위치
DESC SALGRADE;	-- 급여 등급 테이블
-- 급여 등금, 최소급여, 최대급여

-- 전체 데이터 확인하기
SELECT * FROM EMP;

-- 프로젝션 애트리뷰트 : 속성 투영
-- 이름만 확인
SELECT ENAME FROM EMP;

-- 셀렉션 컨디션(조건식) : 조건 선택
-- 급여가 1000달러 이상인 직원만 선택
SELECT * FROM EMP WHERE SAL > 1000;

-- 셀렉션(복합조건) + 프로젝션
-- 급여가 1000달러 이상이고, 부서번호가 10번인 직원의 이름만 조회
SELECT ENAME FROM EMP WHERE SAL > 1000 AND DEPTNO = 10;

-- 별칭 (AS) 사용하기
-- 1. 컬럼명에 별칭을 지정하면 쿼리 결과의 헤더로 사용
SELECT ENAME AS "직원명" FROM EMP;
SELECT ENAME AS "직원명", SAL AS "급여" FROM EMP;
-- AS는 생략 가능
SELECT ENAME "직원명", SAL "급여" FROM EMP;
-- 2. 테이블에 별칭 사용하기
-- 쿼리문을 간결하게 하기 위해 사용, 주로 JOIN 문에 사용
SELECT E.ENAME, E.SAL, D.DEPTNO, D.LOC
FROM EMP AS E
JOIN DEPT AS D ON E.DEPTNO = D.DEPTNO;
-- AS 생략 가능
SELECT E.ENAME, E.SAL, D.DEPTNO, D.LOC
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO;
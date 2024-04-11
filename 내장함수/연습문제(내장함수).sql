-- 내장함수 연습
-- scott DB를 사용하세요.
use scott;
desc emp;

-- 문제 1: EMP 테이블에서 모든 직원의 ENAME을 대문자로 변환하여 조회하세요.
SELECT UPPER(ENAME) AS ENAME_UPPERCASE
FROM emp;

-- 문제 2: EMP 테이블에서 모든 직원의 입사 연도(HIREDATE)만 추출하여 조회하세요.
SELECT YEAR(HIREDATE) AS HIRED_YEAR
FROM emp;

-- 문제 3: EMP 테이블에서 각 직원의 이름(ENAME)과 '1981-12-01'부터 각 직원의 입사일까지 몇 일이 지났는지 계산하여 조회하세요.
SELECT ENAME, DATEDIFF('1981-12-01', HIREDATE) AS DAYS_PASSED
FROM emp;

-- 문제 4: EMP 테이블에서 모든 직원의 이름(ENAME)에 "님"을 붙여서 조회하세요.
SELECT CONCAT(ENAME, '님') AS ENAME_RESPECTFUL
FROM emp;

-- 문제 5: EMP 테이블에서 가장 높은 SAL을 가진 직원의 SAL을 조회하세요. 
SELECT MAX(SAL) AS MAX_SALARY
FROM emp;


-- 문제 6: EMP 테이블에서 직원의 이름과 COMM 이 null인 사람을 "커미션 없음"이라는 컬럼으로 나타내어 조회하세요. 
SELECT ENAME,
       CASE
           WHEN COMM IS NULL THEN '커미션 없음'
           ELSE COMM
       END AS COMM_STATUS
FROM emp;


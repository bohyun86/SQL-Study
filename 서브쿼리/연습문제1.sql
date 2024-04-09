-- 서브쿼리 문제 scott 데이터베이스 사용
use scott;

-- 문제 1: 회사 전체 평균 급여보다 많이 받는 모든 직원의 이름을 조회하세요.
-- 사용 테이블: EMP (ENAME, SAL)
select ename from emp
where sal >= (select avg(sal) from emp);

-- 문제 2: 가장 많은 급여를 받는 직원의 이름을 조회하세요.
-- 사용 테이블: EMP (ENAME, SAL)
select ename from emp
where sal = (select max(sal) from emp);


-- 문제 3: SMITH보다 먼저 입사한 모든 직원의 이름을 조회하세요.
-- 사용 테이블: EMP (ENAME, HIREDATE)
select ename from emp
where hiredate < (select hiredate from emp where ename = 'smith');

-- 문제 4: 자신의 부서에서 평균보다 더 많은 급여를 받는 직원의 이름을 조회하세요.
-- 사용 테이블: EMP (ENAME, SAL, DEPTNO)
SELECT E.ENAME 
FROM EMP E 
WHERE E.SAL > (SELECT AVG(SAL) 
               FROM EMP 
               WHERE DEPTNO = E.DEPTNO);



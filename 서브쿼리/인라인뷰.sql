-- FROM절 : 인라인 뷰(Inline View)
-- 서브쿼리가 임시 테이블처럼 동작하게 하여 메인 쿼리에 사용
-- 생성된 임시 테이블은 쿼리 실행시점에만 존재하고 사라짐. => 쿼리문 안에서만 사용
-- FROM 절의 임시 테이블은 약칭을 주어 사용해야 한다.

-- 부서별 급여평균
SELECT deptno, avg(sal) FROM emp GROUP BY deptno;

SELECT dept_avg.deptno, dept_avg.avg_sal
FROM ( SELECT deptno, avg(sal) as avg_sal FROM emp GROUP BY deptno ) as dept_avg;
-- LEFT, RIGHT JOIN

-- LEFT JOIN : 테이블1에 공통컬럼이 없는 경우도 포함하여 테이블2를 조회
-- [임시] deptno가 null인 행을 삽입
INSERT INTO emp
VALUES (9999, 'John', 'Doe', NULL, NULL, NULL, NULL, NULL);

-- INNER LEFT(테이블1)과 RIGHT(테이블2) 모두 존재하는 경우
-- LEFT (테이블1)에는 존재하고, RIGHT (테이블2)에는 존재하지 않는 행을 포함
-- RIGHT 테이블1에는 존재하지 않고, 테이블2에는 존재하는 행을 포함

-- LEFT JOIN : 9999번 행(deptno가 null)은 포함, 40번 부서는 포함하지 않음
SELECT *
FROM emp e
LEFT JOIN dept d ON e.deptno = d.deptno;

-- RIGHT JOIN : 9999번 행(deptno가 null)은 불포함, 40번 부서는 포함
SELECT *
FROM emp e
RIGHT JOIN dept d ON e.deptno = d.deptno;

-- 샘플 행 삭제 (원상복귀)
DELETE FROM emp WHERE empno = 9999;
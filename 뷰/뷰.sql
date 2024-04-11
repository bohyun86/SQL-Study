-- 뷰
USE SCOTT;

SELECT * FROM emp;

-- 뷰 생성
CREATE VIEW view_emp AS
SELECT empno, ename, job, deptno FROM emp;

-- 생성된 뷰는 새로운 가상의 테이블처럼 접근
SELECT * FROM view_emp;

-- 뷰의 삭제
DROP VIEW view_emp;

-- 1. 뷰의 장점 : 보안에 도움이 됨, 사용자에게 보여주고 싶은 속성만 보여줄 수 있음
-- 뷰로 조건부 데이터 선택
CREATE VIEW view_emp_30 AS
SELECT * FROM emp WHERE deptno = 30;

SELECT * FROM view_emp_30;
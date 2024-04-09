-- 조인
use scott;

-- 각 개별 테이블 확인
SELECT * FROM emp; 	-- 14개의 행
SELECT * FROM dept; -- 4개의 행

-- 2개의 테이블 조회
SELECT * FROM emp, dept;  -- 모든 가능한 행 14*4 = 56의 결과 조회 (카티션 프로덕트)

-- 두 개의 테이블에서 deptno가 같은 경우만 조회
SELECT * FROM emp, dept
WHERE emp.deptno = dept.deptno;

-- 조인
use scott;

-- 각 개별 테이블 확인
SELECT * FROM emp; 	-- 14개의 행
SELECT * FROM dept; -- 4개의 행

-- 2개의 테이블 조회 (FROM절)
SELECT * FROM emp, dept;  -- 모든 가능한 행 14*4 = 56의 결과 조회 (카티션 프로덕트)

-- 두 개의 테이블에서 deptno가 같은 경우만 조회 (WHERE절 2개의 테이블 조건 명시)
SELECT * FROM emp, dept
WHERE emp.deptno = dept.deptno;
-- => 암시적 조인

-- 두 개의 테이블을 결합하고, 결과 셋에서 필요한 속성들만 프로젝션(투영)
SELECT ename, job, sal, dname, loc
FROM emp, dept
WHERE emp.deptno = dept.deptno;

-- 양 쪽 테이블 모두에 있는 필드 이름인 경우 테이블명을 명시하지 않으면 오류
SELECT ename, job, sal, dept.deptno, dname, loc
FROM emp, dept
WHERE emp.deptno = dept.deptno;

-- 일반적으로 프로젝션하는 모든 필드의 이름에 테이블을 함께 명시
SELECT emp.ename, emp.job, emp.sal, dept.deptno, dept.dname, dept.loc
FROM emp, dept
WHERE emp.deptno = dept.deptno;

-- 각 필드가 어떤 테이블에 속했는지 명확해졌지만, 너무 길어진다.
-- 각각의 테이블명에 별칭을 주어 간결화 시킴. (관례적으로 테이블 앞글자)
SELECT e.ename, e.job, e.sal, d.deptno, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- 명시적 조인
-- JOIN과 ON 키워드를 함께 사용
-- 1. Inner Join
SELECT *
FROM emp
INNER JOIN dept ON emp.deptno = dept.deptno;

-- 특정 컬럼만 프로젝션
SELECT ename, dname
FROM emp
INNER JOIN dept ON emp.deptno = dept.deptno;

SELECT e.ename, d.dname
FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno;
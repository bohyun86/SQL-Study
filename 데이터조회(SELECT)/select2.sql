-- BETWEEN .. AND : 특정 범위내 값 찾기
-- WHERE 컬럼명 BETWEEN 값1 AND 값2;
-- 범위의 시작 값(값1)부터 범위의 끝값(값2)까지 조회하고, 두 값 모두 포함.
-- 1. 날짜 범위
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1981-01-01' AND '1982-12-31';

-- 2. 숫자 범위
SELECT ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 1500 AND 3000;

-- 3. 문자열 범위
SELECT ENAME
FROM EMP
WHERE ENAME BETWEEN 'A' AND 'D';

-- IN() : 주어진 목록 안의 값들 중 하나와 일치하는 행
-- OR 조건 여러개와 대체될 수 있음.
-- WHERE 컬럼명 IN (값1, 값2, ...)
-- 쿼리문을 간결하게 만들고, 동적으로 여러조건을 포함해야 할 때 사용
SELECT ENAME, JOB
FROM EMP
WHERE JOB IN ('MANAGER', 'ANALYST', 'CLERK');

-- 동일한 결과
SELECT ENAME, JOB FROM EMP
WHERE JOB = 'MANAGER' OR JOB = 'ANALYST' OR JOB = 'CLERK';

-- LIKE
-- 문자열 패턴 매칭을 위해 사용
-- 와일드카드
-- '%' : 0개 이상의 어느 위치에나 일치하는 문자를 대신
-- '_' : 정확히 일치하는 한 문자를 대신 

-- 이름이 A로 시작하는 모든 직원 조회
SELECT ENAME FROM EMP
WHERE ENAME LIKE 'A%';

-- 이름에 A를 포함하는 모든 직원 조회
SELECT ENAME FROM EMP
WHERE ENAME LIKE '%A%';

-- 이름의 3번째 글자에 A인 사람을 조회
SELECT ENAME FROM EMP
WHERE ENAME LIKE '__A%';

-- IS NOT NULL 비교연산자 : NULL이 아닌 값인 행 선택
SELECT * FROM EMP WHERE COMM IS NOT NULL;
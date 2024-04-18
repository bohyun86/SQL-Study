USE db_index;

/* 인덱스가 없는 테이블을 읽었을 때 */

-- 읽은 페이지의 수 / 2164
SHOW GLOBAL STATUS LIKE 'innodb_pages_read';

SELECT * FROM emp WHERE emp_no = 100000;
-- 실행 계획보기 (하단 Excution Plan)
-- 30000 가까운 쿼리 코스트, 전체 테이블을 스캔, 29만 줄 읽음.
EXPLAIN SELECT * FROM emp WHERE emp_no = 100000;

SHOW GLOBAL STATUS LIKE 'innodb_pages_read'; -- 읽은 페이지 3202
-- 읽은 후 3202 - 읽기 전 2164 대략 1000 페이지 이상을 읽었음.

/* 클러스터형 인덱스가 있는 테이블을 읽었을 때 */
SELECT * FROM emp_cl WHERE emp_no = 100000;
-- 실행계획 확인 : 쿼리 코스트는 1, 읽은 줄 1, 시간도 0.00초
EXPLAIN SELECT * FROM emp_cl WHERE emp_no = 100000;

SHOW GLOBAL STATUS LIKE 'innodb_pages_read';  -- 읽은 페이지 수 3203
-- 읽은 후 3203 - 읽기 전 3202 = 1페이지 읽었음.


/* 보조 인덱스가 있는 테이블을 읽었을 때 */
SELECT * FROM emp_se WHERE emp_no = 100000;
-- 실행 계획(Execution Plan) 확인
-- 쿼리 코스트 0.35, 찾은 행수 1, 실행시간 0.0초
EXPLAIN SELECT * FROM emp_se WHERE emp_no = 100000;

SHOW GLOBAL STATUS LIKE 'innodb_pages_read';  -- 읽은 페이지 수 3205
-- 3205 - 3203, 2페이지 읽음.

/* 클러스터형 인덱스 범위 조회 */
SELECT * FROM emp_cl WHERE emp_no < 12000;
-- 실행계획 확인 : 인덱스 사용, Index Range Scan (인덱스 범위 조회)
-- 쿼리코스트 402.89
EXPLAIN SELECT * FROM emp_cl WHERE emp_no < 12000;
-- 실행 타입 range, 범위 만큼의 행수를 리턴
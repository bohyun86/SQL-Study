-- 트랜잭션 고립 수준
use tcl;

-- 고립수준 확인하기
SELECT @@transaction_isolation;

-- 고립수준 변경하기
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
START TRANSACTION;
-- 읽기 (세션2에서 쓰기 전) => 홍길동 나이 30
SELECT * FROM person;

-- 읽기 (세션2에서 쓴 후) => 홍길동 나이 50
-- 세션2는 커밋을 하지 않았는데 변경한 내용이 반영되어 읽어짐
SELECT * FROM person;

-- 세션 2 : 쓰기 트랜잭션
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

use tcl;

UPDATE person 
	SET age = 50
	WHERE name = '홍길동';
    
/* 2. READ COMMITTED, 반복 불가능 읽기 */
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
START TRANSACTION;

-- 읽기 : 세션 2 커밋 전 // 홍길동 -> 30
SELECT * FROM person WHERE name = '홍길동';

-- 반복 읽기 : 세션 2 커밋 후 // 홍길동 -> 50
SELECT * FROM person WHERE name = '홍길동';

-- 반복 읽기 시 다른 트랜잭션 작업 여부에 따라 이전의 결과와 다른 결과가 나오고
-- 동일한 이전 결과를 읽을 수 없는 현상 => 반복 불가능 읽기

/* 2. READ COMMITTED, 반복 불가능 읽기 */

START TRANSACTION;

-- 1. 쓰기
UPDATE person 
	SET age = 50
	WHERE name = '홍길동';

-- 2. 커밋
COMMIT;    
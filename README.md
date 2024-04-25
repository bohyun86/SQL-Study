# 데이터베이스
- 체계적으로 조직된 데이터의 집합
- 다양한 형태(텍스트, 숫자, 파일 등)으로 저장 가능
- 서로 관련성이 있어서 의미 있는 정보 형성
- 여러 사용자가 동시에 접근이 가능, 작업을 수행
- 안전성과 무결성(Integrity) : 데이터의 정확성과 일관성을 유지
- 제약조건(Constraint) 이라고 하는 특성을 가짐
- 보안, 백업 및 복구 등을 보장

## 데이터베이스의 구성요소
- 데이터 : 저장된 원시 정보
- DBMS(DataBase Management System) : 
  데이터베이스를 관리하는 소프트웨어
  - MySQL, Oracle, PostgresSQL, MariaDB 등
- 데이터베이스 서버 : DBMS가 실행되는 컴퓨터 시스템
- 스키마(Schema) : DB의 구조를 정의하는 메타 데이터 집합

## 데이터 모델 (Data Model)
  - 현실세계의 정보를 시스템 내에서 어떻게 구조화하고 조직화할지에 대한 청사진
  - 예) 도서관DB : 책-제목,저자,출판년도 (책에 대한 메타데이터)
  1. 개념적 데이터 모델 (Conceptual) : 높은 수준의 추상화
     - 비전문가나 일반인들도 요구사항을 이해하고 분석할 수 있게 설계
  2. 논리적 데이터 모델 (Logical)
     - 개념적 데이터모델에서 더 구체화
     - 데이터의 속성이나, 키, 관계 등을 명시
     - 특정 DBMS에 의존하지 않고 명시
  3. 물리적 데이터 모델 (Physical)
     - 특정 DBMS에 저장이 될 수 있게,  논리적 데이터 모델을 디테일하게 설계
     - DBA(데이터베이스 관리자) 또는 개발자가 사용

  - 데이터 모델의 종류
    1. 계층형 데이터 모델 (Hierachical 부모-자식관계, 트리 구조)
    2. 네트워크형 데이터 모델 (Network 다 대 다 관계 표현, 구조가 복잡해짐)
    3. 관계형 데이터 모델 ** (Reational, 가장 널리 사용 되는 모델)
    4. 객체 지향 데이터 모델 (Object, 데이터를 객체로 표현)
    5. NoSQL (Not Only SQL) : 비관계형 데이터 모델, (문서, 키-값, 그래프 등), 유연성, 확장성

## 논리적 데이터 모델의 구성 요소
- 엔티티(Entity) : 실제 세계의 객체 -> 데이터베이스에서 테이블로 표시
   - 각 엔티티는 속성(Attribute)를 가지고 있음.
- 속성(Attribute) : 엔티티의 특성 -> DB에서는 테이블의 컬럼으로 구현
   - 엔티티를 설명하는 데이터
- 관계(Relationship) : 엔티티-엔티티 간의 연관성, 상호작용 -> DB에서는 외래키로 표현
- 키(Key) : 데이터의 무결성을 유지하기 위해 사용되는 특별한 속성
   - *기본 키 (Primary Key)* : 테이블의 행을 고유하게 식별하는 키 NULL 불가
   - *외래 키 (Foreign Key)*
   - 후보 키 : 데이터베이스에 모든 행을 유일하게 식별할 수 있는 속성들의 집합
   - 대체 키 : 후보 키 중 기본 키로 선택되지 않은 키
   - 복합 키

# SQL (Struectured Query Language)
 - 관계형 데이터베이스(RDBMS)에서 데이터를 관리하기 위해 사용하는 표준화된 언어

 - 데이터 정의 언어 (Data Definition Language) : DDL
 - 데이터 조작 언어 (Data Manipulation Language) : DML
 - 데이터 질의 언어 (Data Query Language) : DQL
 - 데이터 제어 언어 (Data Control Language) : DCL
 - 트랜잭션 제어 언어 (Transaction Control Language) : TCL

## DCL (Data Control Language)
 - 데이터의 접근 권한을 제어하고 관리하는 명령어들의 집합
 1. GRANT : 권한 부여
   - 특정 사용자나 사용자 그룹에게
   - 특정 데이터베이스(스키마)나 특정 테이블에서
   - 명령할 수 있는 권한 부여
   - 예시
   ```SQL
   GRANT SELECT ON database_name.table_name
   TO '사용자명'@'호스트명';
   ```
 2. REVOKE : 권한 회수
   - 사용자에게 부여된 권한이 더이상 필요하지 않거나
   - 보안 상의 이유로 권한 회수할 때 사용
   ```SQL
   REVOKE SELECT ON database_name.table_name
   FROM '사용자명'@'호스트명';
   ```
- 권한 부여나 회수는 DB의 보안과 직접적인 관련이 있음으로 신중히 할 것.
- 일반적으로 사용자에게 최소한(필요한)의 권한만 부여하는 **최소 권한 원칙** 따름.
- 데이터에 대한무단 접근을 방지하고, 시스템 보안 수준을 높일 수 있음.

- 키(Key) : 데이터의 무결성을 유지하기 위해 사용되는 특별한 속성
   - *기본 키 (Primary Key)* => PK
     - 테이블의 행을 고유하게 식별하는 키 
     - 하나 이상의 컬럼의 조합
     - NULL 불가, UNIQUE
     - 테이블 내의 각 레코드(행)을 유일하게 식별할 수 있어야 함.
   - *외래 키 (Foreign Key)* => FK
     - 다른 테이블의 행(기본 키)을 참조하는 키 
     - 두 테이블 간의 관계 정의시 사용
     - 참조 무결성 유지하는데 사용 
   - 후보 키 : 데이터베이스에 모든 행을 유일하게 식별할 수 있는 속성들의 집합
     - 후보키에서 기본키가 선택
   - 대체 키 : 후보 키 중 기본 키로 선택되지 않은 키
   - 복합 키 : 두 개 이상의 속성을 조합하여 만든 키
   - 고유 키 : 모든 행에 대해서 고유한 값을 가져야 하는 속성 (NULL 허용)

## 제약조건 (Constaint)
- 무결성(Integrity) : DB에서 저장된 데이터의 일관성과 정확성을 지키는 것.
   1. NOT NULL
      - 해당 컬럼(속성)에는 NULL 값이 허용되지 않음.
      - 반드시 유효한 값이 있어야 함.
   2. UNIQUE
      - 해당 컬럼의 각 행은 서로 다른 값을 가져야 함.
      - 중복된 값 불가
      - NULL 가능
   3. PRIMARY KEY
      - 각 행을 유일하게 식별할 수 있는 열(또는 열의 조합)
      - NOT NULL, UNIQUE
   4. FOREIGN KEY
      - 한 테이블의 열이 다른 테이블의 PK를 참조
      - 참조 무결성 유지
      - 테이블의 관계를 정의
   5. CHECK
      - 해당 속성(컬럼, 열)에서 입력될 수 있는 데이터의 범위를 제한
      - 조건을 만족하는 데이터만 입력 가능
      - 예시 : 0 < 나이 < 200 : 특정 범위
   6. DEFAULT
      - 해당 속성에 대한 기본 값을 설정
      - 값이 명시 되지 않으면 지정된 기본 값이 자동으로 입력
   7. AUTO_INCREMENT
      - MySQL에서 사용하는 특수 제약조건
      - 기본 키에 주로 사용되고, 새로운 행(row, 레코드)가 추가 될 때마다 자동으로 숫자 증가
   8. BINARY (B)
      - 해당 컬럼이 이진데이터
   9. UNSIGNED
      - 부호가 존재하지 않음. 음수값을 허용하지 않음 => 양수
   10. ZEROFILL
      - 해당 숫자의 열이 특정 길이로 고정되어야 하는 경우
      - 해당길이보다 부족하면 왼쪽에 0이 채워짐
      - 예시. 007
   11. GENERATED
      - 해당 열의 값이 자동으로 생성.
      - 특정 규칙에 따라 숫자가 증가하거나 문자열이 생성 등.
   
## 속성 데이터 타입
 1. 숫자형 데이터 타입
   - INT : 정수 4byte
   - DECIMAL(M, N) : 고정 소수점 숫자, 정확한 소수 계산에 필요 M 총 자릿수, N 소수점 이하 자릿수
   - FOLAT, DOUBLE : 부동 소수점 소수 4byte, 8byte

 2. 문자열 데이터 타입
   - CHAR(N) : 고정 길이 문자열, N은 문자열의 길이, 문자열이 N보다 짧으면 공백으로 채워짐.
   - VARCHAR(N) : 가변 길이 문자열, N은 문자열의 최대 길이, 실제 사용된 길이만큼만 저장공간 차지. 기본값 : 255 바이트, MYSQL 버전에 따라 최대 바이트가 다름
   - TEXT : 긴 텍스트를 저장 최대 65,535 바이트
   - MEDIUMTEXT : 최대 16MB까지 저장
   - LONGTEXT : 최대 4GB까지 저장

 3. 날짜 시간 데이터타입
   - DATE : 'YYYY-MM-DD'
   - TIME : 'HH:MM:SS'
   - DATETIME : 'YYYY-MM-DD HH:MM:SS'
   - TIMESTAMP : 유닉스 타임스탬프 기반 날짜 시간정보 저장 (1970-01-01 -> 32비트 정수)

 4. 이진 데이터 타입
   - BINARY(N) : 고정길이 이진데이터 (이미지, 파일 등 저장에 사용)
   - VARBINARY(N) : 가변길이
   - BLOB : 이진 대용량 객체 저장에 사용 Binary Large OBject, 4GB 저장

 5. 논리 데이터 타입
   - BOOLEAN : TRUE, FALSE 값 저장, 내부적으로 TINYINT(1)로 처리 => 0 또는 1

 6. 열거형
   - ENUM : 미리 정의된 값 중 하나를 저장 ENUM('mon', 'tue', 'wed' ...)

- 도메인 무결성 제약조건
   - 릴레이션 내 튜플들이 각 속성의 도메인에 지정된 값만 가져야 하는 조건
   - 데이터 타입, null 허용 또는 not null, default, check 제약 조건 등으로 제약조건을 가짐

## CONSTRAINT 제약조건명 (제약조건 이름 명시하기)
- 제약조건은 생성시 이름을 생략하고 만들 수 있음
- 생략하고 만들 경우 자동으로 제약조건의 이름이 부여 됨
- 생성 시 `CONSTRAINT 제약조건명` 이 부여되면, 제약조건 이름을 명시할 수 있음
- 제약조건의 이름을 확인하기 위해서는 DB객체나 DDL을 확인하면 됨.

```sql
-- 1. information_schema 오브젝트를 통해 확인
   -- CONTRAINT_NAME 필드 : 제약조건의 이름
   SELECT * FROM information_schema.table_constraints
   WHERE table_name = '테이블명';  -- 테이블명

-- 2. DDL을 통해 확인
-- SHOW CREATE TABLE 스키마명.테이블명;
-- 워크벤치의 경우 open value in viewer
   SHOW CREATE TABLE employees;
```

- 대량의 샘플 데이터 삽입
```sql
INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...)
   SELECT문
```
   - SELECT문으로 조회한 다른 테이블의 데이터를 대량으로 입력
   - 테이블의 컬럼과 SELECT문으로 조회한 컬럼의 데이터타입이 일치해야 함.

### WHERE 절
   - SQL 쿼리에서 데이터를 필터링하기 위해 사용되는 조건절
   - condition (조건문) 및 논리, 비교 연산자를 사용해서 특정 기준 만족하는 데이터만 선택

   1. 비교 연산자
      - '=' : 같다
      - '!=' 또는 '<>' : 같지 않다.
      - '>', '>=' : 크다, 크거나 같다.
      - '<', '<=' : 작다, 작거나 같다.
   2. 논리 연산자
      - AND : 모든 조건 참이면 참     (조건1 AND 조건2)
      - OR : 조건 하나라도 참이면 참   (조건1 OR 조건2)
      - NOT : 조건 결과 반전          (NOT 조건1)

### DELETE (삭제)
   - 테이블에서 특정 조건을 만족하는 행을 삭제
   ```SQL
   DELETE FROM 테이블명
   WHERE 조건문
   ```
   - WHERE절을 생략하면 테이블의 모든 행이 삭제됨. (주의)
   - 정확한 조건을 지정하지 않으면 의도하지 않은 데이터가 삭제
   - 한 번 삭제된 데이터는 복구되지 않으므로 데이터 백업에 주의
   - 참조 무결성 제약조건을 위배할 경우 데이터 삭제에 실패하거나,
   - 연쇄적(CASCADE 레퍼런스 옵션)으로 삭제될 수 있음.

   ## DQL (데이터 질의어, Data Query Language)
- DB에서 데이터를 조회하는 데 사용
- 데이터를 조작하거나 수정하지는 않음.
- DB 서버에 Data를 요청하는 것
### SELECT
- 기본 구조
```sql
-- 특정 열 선택 : Projection (π) Attribute
SELECT 컬럼명1, 컬럼명2, ...
FROM 테이블명;

-- 테이블의 모든 데이터 조회
SELECT *
FROM 테이블명;

-- 특정 조건 선택 : Selection (σ) Condtion 
SELECT 컬럼명1, 컬럼명2, ...
FROM 테이블명
WHERE 조건식;

```
- * (asterisk) : 테이블의 모든 열을 선택하겠다.
- 셀렉션 (컨디션)
   - σ 가격 > 8000 (상품) : 가격이 8000원 이상인 행들만 선택
      `SELECT * FROM 상품 WHERE 가격 > 8000;`
- 프로젝션 (애트리뷰트)
   - π 이름, 주소 (고객) : 고객 테이블에서 이름 주소 속성만 선택
      `SELECT 이름, 주소 FROM 고객`

### SELECT
- 기본 구조
```sql
-- 특정 열 선택 : Projection (π) Attribute
SELECT 컬럼명1, 컬럼명2, ...
FROM 테이블명;

-- 테이블의 모든 데이터 조회
SELECT *
FROM 테이블명;

-- 특정 조건 선택 : Selection (σ) Condtion 
SELECT 컬럼명1, 컬럼명2, ...
FROM 테이블명
WHERE 조건식;

```
- * (asterisk) : 테이블의 모든 열을 선택하겠다.
- 셀렉션 (컨디션)
   - σ 가격 > 8000 (상품) : 가격이 8000원 이상인 행들만 선택
      `SELECT * FROM 상품 WHERE 가격 > 8000;`
- 프로젝션 (애트리뷰트)
   - π 이름, 주소 (고객) : 고객 테이블에서 이름 주소 속성만 선택
      `SELECT 이름, 주소 FROM 고객`

- 별칭 (AS) 사용하기
   `SELECT 컬럼명 AS 별칭 FROM 테이블명 AS 별칭`
   1. 컬럼명에 별칭을 지정하면 쿼리 결과의 헤더로 사용
   2. 테이블명에 별칭을 사용하면 쿼리문의 테이블을 간결하게 사용할 수 있음 -> 조인문에 사용
   3. AS 생략 가능

- BETWEEN ... AND
   - 특정 범위 내 값을 찾기
   ```SQL
   SELECT 컬럼명, ...
   FROM 테이블명
   WHERE 컬럼명 BETWEEN 범위1 AND 범위2;
   ```
   - 특정 컬럼의 범위를 조회하고 범위1, 범위2값 모두 포함
   - 날짜, 숫자, 문자열 등 사용가능

- IN
   - 주어진 목록 안의 값들 중 하나와 일치하는 행 => OR 조건
   ```SQL
   SELECT 컬럼명, ...
   FROM 테이블명
   WHERE 컬럼명 IN (값1, 값2, ...);
   ```
   - IN : 컬럼 = 값1 OR 컬럼 = 값2;
   - NOT IN : 컬럼 !=값1 AND 컬럼 !=값2;

- LIKE
   - 문자열 패턴 매칭
   - '%' 0개 이상의 아무 문자, '_' : 정확한 한 문자 대신
   ```SQL
   SELECT 컬럼명, ...
   FROM 테이블명
   WHERE 컬럼명 LIKE '패턴'
   ```
   - A로 시작하는 경우 'A%'
   - A를 포함하는 경우 '%A%'

 - ORDER BY
   - 단일열 또는 두 개 이상의 열을 기준으로 오름차순 또는 내림차순으로 정렬
   ```SQL
   SELECT 컬럼명, ...
   FROM 테이블명
   ORDER BY 컬럼명 ASC|DESC, ....
   ```

 - LIMIT 
    - 출력 결과 수 제한
   ```SQL
   SELECT 컬럼명, ...
   FROM 테이블명
   LIMIT 제한할 행개수
   OFFSET 시작할 행번호
   ```
    - OFFSET과 함께 사용하면 대량의 데이터 페이지네이션에 사용

  - DISTINCT
    - 중복된 결과 제거하고, 유일하고 고유한 값만 남기기 위해 사용
   ```SQL
   SELECT DISTINCT 컬럼명, ...
   FROM 테이블명
   ```

    - GROUP BY
  ```sql
  SELECT 그룹기준컬럼명 ..., 집계함수(집계컬럼)
  FROM 테이블명
  [WHERE 조건식]
  GROUP BY 그룹기준컬럼명 ..
  [HAVING 그룹조건식]
  [ORDER BY 정렬기준컬럼]
  ```
   - 그룹기준컬럼명 : 그룹화를 할 기준이되는 열
   - 집계컬럼 : 그룹에 적용할 집계함수의 대상이 되는 열

   - WITH ROLLUP
      - 총합 또는 중간합계가 필요할 때 GROUP BY 절과 함께 사용
      ```sql
      SELECT 그룹기준컬럼명 ..., 집계함수(집계컬럼)
      FROM 테이블명
      GROUP BY 그룹기준컬럼명 ..
      WITH ROLLUP
      ```

-- WITH ROLLUP
-- 각 그룹별 소합계 및 총합계를 계산
-- 요약 보고서 작성이나 데이터 분석에 사용
SELECT deptno, job, sum(sal)
FROM emp
GROUP BY deptno, job WITH ROLLUP;

- 기본문법
```sql
   SELECT 테이블명.컬럼명, ..
   FROM 테이블명1
   [INNER|LEFT|RIGHT] JOIN 테이블명2 ON 테이블1.공통컬럼 = 테이블2.공통컬럼
```
   - JOIN 다음에 결합한 테이블명
   - ON 다음에 (join condition)
   - 일반적으로 테이블명을 줄인 약칭을 사용
   - JOIN 키워드 앞에 [INNER|LEFT|RIGHT] 생략할 경우 INNER JOIN

### SubQuery, 서브쿼리, 부속질의
  - 다른 SQL 쿼리 내부에 포함되어 있는 쿼리.
    - 주 쿼리 (Main Query)
    - 부 쿼리 (Sub Query)
  - 서브쿼리는 괄호 ( ... ) 내부에 작성이 되어 주 쿼리와 구분됨.
  - 서브쿼리의 결과는 단일 행 또는 다중 행 결과를 반환
  - 서브쿼리는 주 쿼리보다 먼저 실행되고, 서브쿼리의 결과 주 쿼리에 사용
  - 서브쿼리의 사용처
    - WHERE절, SELECT절, FROM절, HAVING절 등...
    - WHERE절 : 데이터 필터링을 하기 위해 사용

### SubQuery, 서브쿼리, 부속질의
  - 다른 SQL 쿼리 내부에 포함되어 있는 쿼리.
    - 주 쿼리 (Main Query)
    - 부 쿼리 (Sub Query)
  - 서브쿼리는 괄호 ( ... ) 내부에 작성이 되어 주 쿼리와 구분됨.
  - 서브쿼리의 결과는 단일 행 또는 다중 행 결과를 반환
  - 서브쿼리는 주 쿼리보다 먼저 실행되고, 서브쿼리의 결과 주 쿼리에 사용
  - 서브쿼리의 사용처
    - WHERE절, SELECT절, FROM절, HAVING절 등...
    - WHERE절 : 데이터 필터링을 하기 위해 사용

1. 단일 행(single row) 서브쿼리
   - 반드시 하나의 행만 반환 해야 함.
   - 하나의 결과값만 나오는 쿼리를 서브쿼리로 작성하거나
   - 집계함수 등을 사용하여 반드시 하나의 행이 결과값으로 갖도록 보장해야 함.
   - 단일행 서브쿼리는 =, >, < 등의 비교연산자와 함께 사용
   ```sql
   SELECT 컬럼명, .. FROM 테이블명 WHERE 조건 = ( 서브쿼리 );
   ```

2. 다중 행(multi row) 서브쿼리
   - 쿼리 실행 결과로 여러 행을 반환하는 서브쿼리
   - IN, ANY, ALL, EXISTS 등의 연산자와 함께 사용
   ```sql
   SELECT 컬럼명, .. FROM 테이블명 WHERE IN ( 서브쿼리 );
   ```

   1. IN(서브쿼리) : 메인쿼리의 비교 조건이 서브쿼리 결과 중 하나라도 동일하면 참.
   2. ANY(서브쿼리) : 메인쿼리의 비교 조건이 서브쿼리 결과 중 하나라도 동일하면 참.
      - IN은 비교연산자를 사용하지 않고, ANY는 비교 연산자를 사용한다.
   3. ALL(서브쿼리) : 메인쿼리의 비교 조건이 서브쿼리 결과 중 모두 동일하면 참.
      - 비교연산자 사용
      - 비교조건 < ALL (10, 20, 30) : 최소값 (10보다 작은)
      - 비교조건 > ALL (10, 20, 30) : 최대값 (30보다 큰)
   4. EXISTS(서브쿼리) : 서브쿼리의 결과가 하나라도 존재하면 참.

3. FROM절 : 인라인 뷰(Inline View)
   - 서브쿼리가 임시 테이블처럼 동작하게 하여 메인 쿼리에 사용

### 내장함수
   - MySQL에서 사용자 정의 변수 사용하기
      - 사용자 정의 변수는 '@' 기호로 시작
   - 변수 설정
      ```sql
      SET @변수이름 = 값;     -- 변수 선언
      SELECT @변수이름        -- 변수 사용
      ```

   1. 제어흐름 함수 (IF, CASE, IFNULL, NULLIF ...)
   2. 문자열 함수 (CONCAT, SUBSTRING, LENGTH ...)
   3. 수학 함수 (ABS, CEIL, ROUND, FLOOR, SQRT, RAND ...)
   4. 날짜시간 함수 (NOW, CURDATE, CURTIME, DATE, TIME)
   5. 시스템 정보 함수 (USER, DATABASE ...)

   ## 뷰 View 
- 하나 이상의 테이블에서 가져온 가상의 테이블
- 일반 사용자 입장에서는 테이블과 동일하게 사용하는 객체

- 뷰의 특성
   - 기본적으로 읽기 전용의 객체
   - SQL 쿼리문을 저장하는 형태로 DB내에 정의
   - 복잡한 쿼리를 간단하게 재사용 (단순화)
   - 필요한 데이터를 선별적으로 노출 (보안)

- 뷰의 생성
   ```sql
   CREATE VIEW 뷰이름 AS
   SELECT 컬럼 .. FROM 테이블명 WHERE 조건 ... 
   ```

# 데이터베이스 설계

## 데이터베이스 설계과정
  - 프로젝트의 진행단계
    - 폭포수(waterfall 모델)
      - 소프트웨어 공학에서 전통적으로 사용되는 모델
      - 각 단계를 순차적으로 진행 : 앞 단계가 끝나면 다음 단계 수행
         1. 프로젝트 계획
         2. 업무 분석
         3. 시스템 설계
         4. 프로그램 구현
         5. 테스트
         6. 유지보수
  - 데이터베이스의 생명 주기
    1. 요구사항 분석
      - 실제 사용할 사용자들의 요구사항을 듣고, 관리해야할 데이터의 종류를 이해하고, 분석해서 DB 구축의 범위 지정
    2. 설계
      - 분석된 요구사항을 기초로 데이터베이스 스키마를 도출
      a. 개념적 모델링 : 요구사항에서 중요한 개념을 Entity로 도출하여 Entity 와 Relation의 도면 => ERD(ERDiagram)
      b. 논리적 모델링 : 각 개념(Entity)을 관계 데이터 테이블로 구체화 매핑(mapping)
      c. 물리적 모델링 : DB의 객체, 인덱스, 뷰 등을 정의
    3. 구현
      - 설계된 스키마를 DBMS에서 생성
    4. 테스트
      - 생성된 데어터베이스가 요구사항을 만족시키는지 검증. 필요한 경우 설계 수정.
    5. 유지보수
      - 데이터베이스를 운영하고, 운영 중 발생하는 사항에 대해 변경, 최적화, 모니터링

   ## 요구사항 분석
 - 담당자와 인터뷰를 하거나 설문조사 등을 통하여 요구사항을 수집
 - 실제 문서를 수집하여 분석
 - 기존에 존재하는 DB를 분석
 - 워크숍을 열어서 사용자, 개발자, 분석가 (이해관계자) 등이 참여하여 요구사항을 정의하여 합의
 - 업무와 연관된 모든 부분을 살펴보고 분석

## 설계 - 개념적 모델링
 - 수집되고 분석된 요구사항에서 업무의 핵심 개념을 추출
 - ER(Entity - Relation) 모델

## 정규화 (Nomarlization)
- 데이터베이스 설계 기법
   - 데이터베이스 중복을 최소화하고 -> (중복 감소)
   - 무결성을 유지하기 위해 -> (삽입, 삭제, 갱신이상 제거)
   - 데이터를 구조화하는 과정 -> (구조 개선)

- 이상현상 (anomaly)
   - 잘못 설계된 테이블에서 데이터 조작(삽입, 삭제, 갱신)을 하게 될 경우
   - 테이블의 일관성이 훼손되고, 무결성이 깨지는 현상

   1. 삽입 이상 (Insertion Anomaly)
      - 튜플(행)을 삽입시 부득이하게 null 값이 입력되거나, 중복 데이터 삽입
   2. 갱신 이상 (Update Anomaly)
      - 튜플(행)을 수정시 데이터베이스 속성의 최신 상태가 반영이 되지 않아 일관성이 깨짐
   3. 삭제 이상 (Delettion Anomaly)
      - 튜플(행)을 삭제 시 항목에 연결된 유용한 데이터까지 연쇄 삭제

### 함수 종속성(Functional Dependency)
- 한 속성의 값이, 다른 속성의 값에 의해 결정될 수 있음.
- 어떤 속성 A의 값을 알면 다른 속성 B의 값이 유일하게 정해지는 의존 관계
   - "속성 A는 속성 B를 결정한다"
      - A -> B  (표기)
      - A는 B의 결정자(determine)

- 함수 종속성의 종류
   1. 완전 함수 종속
      - 속성 B(종속자)가 속성 A(결정자)에 함수적으로 종속되어 있고, B의 어떤 부분집합으로도 A를 결정할 수 없을 때.
      - A -> B, 또는 {A, B} -> C
   2. 부분 함수 종속
      - 종속자(비기본키)가 결정자(기본키)가 아닌 다른 속성에 종속되거나, 결정자를 구성하는 속성(복합키) 중 일부에만 종속된 경우
      - {A, B} -> C 일때, A -> C 성립하고, B -> C도 성립하는 경우
   3. 이행 함수 종속
      - 한 속성이 다른 속성에 간접적으로 종속되어 있는 상황
      - A -> B, B -> C 가 성립할 때 A -> C 이행적 종속

### 제 1 정규형(1NF : 1st Normal Form)
   - 모든 속성이 `원자값`을 가져야 한다.
      - 원자값 : 분할이 불가능한 기본 데이터 단위
   - 모든 컬럼은 유일한 이름을 가져야 한다.
   - 한 컬럼 내의 모든 데이터는 같은 데이터 타입이어야 함.
   - 테이블 내 각 행(튜플)은 고유해야 하고, 고유한 식별자(기본키)가 사용됨.

### 제 2 정규형(2NF)
   - 릴레이션이 1정규형을 만족해야 한다.
   - 기본 키가 아닌 속성이 기본키에 완전 함수 종속일 때 제2정규형
   - (부분 함수 종속성을 제거)

### 제 3 정규형(3NF)
   - 릴레이션이 2정규형을 만족해야 한다.
   - 기본 키가 아닌 속성이 기본키에 비이행적으로 종속할 때 제3정규형
   - (이행 함수 종속성을 제거)

### Boyce-Codd 정규형 (BCNF), 보이스 코드 정규형
   - 3 정규형의 특별한 케이스. 3정규형보다 조금 더 엄격함.
   - 릴레이션이 3정규형을 만족해야 함.
   - 모든 결정자가 후보 키여야 함.

## 트랜잭션 (Transaction)
  - DBMS에서 데이터를 다루는 논리적 작업 단위
  - 단일 SQL문이거나, 여러개의 SQL문으로 구성
  
  - 작업 단위는 모두 함께 성공적으로 완료되거나,
  - 아무것도 수행되지 않은 상태가 되어야 함. (All or Nothing)

  - 여러 작업들이 있을 때, 작업 분리 단위, 데이터 복구 작업 단위

  - 은행 계좌간에 금액을 이체하는 상황
    - A계좌에서 B계좌로 10,000원을 전송
      - 작업단위
         1. A계좌에서 10,000원 인출
         2. B계좌에 10,000원 입금
      - 반드시 작업단위 2개가 다 성공적으로 완료되거나
      - 아예 수행이 되지 않아야 함.

   - 트랜잭션의 4가지 성질 (ACID)
      1. Atomicity (원자성) : 모든 작업은 하나의 단위로 처리
        - All or Nothing, 쪼개지지 않아야 함
      2. Consistency (일관성) : DB 상태가 작업 전후로 일관성 유지
        - 트랜잭션이 완료된 후 DB의 모든 무결성 제약조건 만족
      3. Isolation (고립성) : 각 트랜잭션은 독립적
        - 각 작업단위는 서로 영향을 주지 않고, 중간 단위를 볼 수 없음
      4. Durability (지속성) : 성공적인 트랜잭션은 영구적으로 유지
        - 시스템 장애가 나더라도 완료된 작업단위는 영구 반영

### TCL (Transaction Control Language)
   - DBMS에서 트랜잭션을 관리하는 SQL문
      1. COMMIT : 트랜잭션 종료. 변경사항 영구적 반영
      2. ROLLBACK : 트랜잭션을 마지막 COMMIT 상태로 복원
      3. SAVEPOINT : 트랜잭션 내 중간지점을 설정
         - 해당 중간지점까지 ROLLBACK 가능
   - 트랜잭션의 시작을 알리는 명령어
      - START TRANSACTION
   - 트랜잭션의 끝
      - COMMIT 또는 ROLLBACK => 종료
      - DDL(CREATE, ALTER, DROP ...)문을 만나면 자동으로 종료

### 동시성과 Lock
   - 트랜잭션이 동시에 실행될 때 데이터베이스의 일관성을 해치지 않도록
    데이터의 접근을 제어하는 기능
   - 락
      - 트랜잭션이 데이터를 읽거나 변경할 때 데이터에 표시하는 잠금장치
      - 다른 트랜잭션이 접근하지 못하도록 막아 대기 상태로 만듬
   - 락의 종류
     1. 공유 락 (Shared Lock)
      - 여러 트랜잭션이 동시에 데이터를 읽을 수 있도록 허용
      - 공유 락이 걸린 데이터는 다른 트랜잭션도 읽을 수 있지만, 수정 불가
     2. 배타 락 (Exclusive Lock)
      - 락을 건 해당 트랜잭션만 접근과 수정 가능
      - 다른 트랜잭션은 읽기, 수정 불가


### 트랜잭션 고립 수준
   - 여러 트랜잭션이 동시에 DB에 접근할 때 관리 방법을 정의
   - 고립 수준 종류
      1. READ UNCOMMITTED
         - 가장 낮은 수준
         - 커밋되지 않은 변경사항을 다른 트랜잭션이 읽을 수 있음
         - Dirty Read 발생
      2. READ COMMITTED
         - 커밋된 데이터만 읽을 수 있음
         - 다른 트랜잭션에서 데이터를 수정하고 커밋하고 현재 트랜잭션에서 다시 조회하면 다른 데이터가 읽어짐.
      3. REPATABLE READ
         - MySQL의 기본 고립 수준
         - 트랜잭션이 시작되어 종료될때 까지
         - 처음 읽은 데이터의 일관성이 보장
      4. SERIALIZABLE
         - 가장 높은 고립 수준
         - 모든 트랜잭션이 순차적으로 실행되는 것처럼 보장

## 인덱스 (Index)
- DB에서 검색을 빠르게 하기 위해 사용되는 데이터 구조
- 하나 이상의 컬럼(속성)에 적용하여 해당 열을 기준으로 데이터를 빠르게 검색
- 일반적으로 B-Tree 데이터 구조를 사용
- 성능 최적화, 쿼리 최적화
   - 실제 데이터베이스에서 인덱스 튜닝을 하면 즉각적으로
   - 성능 효과를 보고, 빠른 응답속도를 얻어낼 수 있음.
- 인덱스 생성, 유지 관리에 자원이 소모되어
   - 데이터 조작 작업(INSERT, UPDATE, DELETE) 작업 시 추가 작업이 필요함
   - 데이터가 변경될 때마다 인덱스도 변경되어야 함.
   - 조작(쓰기) 작업이 많은 DB에서는 오히려 인덱스의 성능이 감소

### 클러스터형 인덱스와 보조 인덱스
1. 클러스터 인덱스 (Clustered Index)
   - 테이블 생성 시 *기본 키*를 지정하면 기본키에 대한 클러스터 인덱스를 생성
   - *물리적 데이터베이스*가 클러스터 인덱스를 기준으로 정렬되어 저장됨.
   - *한 테이블 당 하나*만 생성할 수 있음.
2. 보조 인덱스 (Secondary Index)
   - 데이터의 물리적 정렬 순서를 변경하지 않음.
   - 클러스터 인덱스와는 별개로 하나 이상의 컬럼에 대한 참조 인덱스 제공
   - 데이터에 포인터를 사용해서 간접적으로 접근
   - 하나의 테이블에는 여러개의 보조인덱스가 존재할 수 있음.

### MySQL에서 자동으로 생성되는 인덱스
   - 기본 키 인덱스
      - 테이블의 고유 식별, 클러스터 인덱스가 생성
   - 외래 키 인덱스
      - 외래 키 제약조건이 있는 컬럼을 기준
      - 참조 무결성, 조인 연산 속도 향상을 위해 자동 생성
   - 유니크 인덱스

   1. PRIMARY KEY로 지정한 열은 클러스터형 인덱스가 생성
   2. UNIQUE NOT NULL 지정한 열은 클러스터형 인덱스가 생성
   3. UNIQUE 지정한 열은 보조 인덱스가 생성
   4. FOREIGN KEY 지정한 열 보조 인덱스가 생성
   5. PRIMARY KEY와 UNIQUE NOT NULL 지정한 열이 있으면 기본 키 지정한 열에 우선하여 클러스터형 인덱스 생성
   6. 물리적 DB는 PRIMARY KEY 지정한 열로 데이터 오름차순 정렬

### 인덱스의 내부작동 BTREE
- 데이터베이스 테이블을 효율적으로 관리하는 인덱스 자료구조

- 기본 개념 정의
   1. 노드(Node) : 트리의 기본 단위
   2. Key : 노드 내에서 데이터를 정렬하는데 사용되는 요소
   3. 루트 노드(Root Node) : 트리의 최상위 노드
   4. 리프 노드(Leaf Node) : 트리의 가장 하단에 위치하는 노드들, 실제 데이터의 주소나 데이터 자체를 포함할 수 있음.
   5. 내부 노드(Internal Node) : 루트 노드와 리프 노드 사이에 있는 노드

- ![B-tree 그림](./인덱스/b-tree.png)
- B Tree의 파라미터
   1. M : 각 노드의 최대 자녀수 (최대 M개의 자녀를 가질 수 있는 M차 B tree)
   2. M-1 : 각 노드의 최대 키 수
   3. M/2 : 각 노드의 최소 자녀 노드 수
   4. (M/2)-1 : 각 노드의 최소 Key 수

- 인터널 노드의 Key 수가 x개라면 자녀 노드 수는 언제나 x+1개
- 몇 차 B Tree의 별개로 인터널 노드는 반드시 최소 2개의 자녀를 가진다.
- 삽입은 항상 Leaf 노드에 한다.
- 노드가 넘치면 가운데 Key 기준으로 좌우 Ket를 분할하고 가운데 Key 승진

- [B 트리 시각화](https://www.cs.usfca.edu/~galles/visualization/BTree.html)

- B Tree의 이점
   - 트리 깊이가 낮다 : 각 노드에서 많은 수의 자식을 가질 수 있기 때문에, 트리 깊이가 낮아짐. (트리 깊이 = 디스크 접근 횟수)
   - 디스크 I/O 최적화 : 보조기억장치의 디스크 블록 크기와 일치하도록 노드 크기를 설정할 수 있음. 한 번의 읽기/쓰기 노드(페이지) 하나를 전체로 읽거나 쓸 수 있음.
   - 분할 및 병합이 효율적임 : 노드(페이지)가 가득찼을 때 분할하거나 병합될 때 효율적인 알고리즘을 가지고 있음.

  ```sql
   -- 인덱스를 추가할 테이블의 이름과 컬럼 기준으로 인덱스 생성
   CREATE INDEX 인덱스이름 ON 테이블이름 (컬럼이름);

   -- 복합 인덱스 생성
   CREATE INDEX 인덱스이름 ON 테이블이름 (컬럼이름1, 컬럼이름2, ...);

   -- 고유 인덱스 생성 (중복된 값 허용 안되는 인덱스)
   CREATE UNIQUE INDEX 인덱스이름 ON 테이블이름 (컬럼이름);

   -- 인덱스 삭제
   DROP INDEX 인덱스이름 ON 테이블이름;

   -- 인덱스 정보조회
   SHOW INDEX FROM 테이블명;

   -- 쿼리 실행계획 확인
   EXPLAIN SELECT 컬럼명 FROM 테이블명 WHERE 조건;

   -- 인덱스 수정
   ALTER INDEX 이전인덱스명 RENAME TO 새인덱스명;

   -- 인덱스 컬럼 추가
   ALTER INDEX 인덱스명 ADD 새컬럼명;

   -- 인덱스 컬럼 제거
   ALTER INDEX 인덱스명 DROP 컬럼명;

   -- 테이블 업데이트 및 분석
   ANALYZE TABLE 테이블명;

   -- 테이블 상태 확인하기
   SHOW TABLE STATUS;
   SHOW TABLE STATUS LIKE '테이블명';
   ```

   ### 인덱스 성능 향상
1. 인덱스는 열(컬럼) 단위로 생성
2. WHERE 절에서 자주 사용되는 컬럼에 인덱스를 생성
3. 자주 정렬(SORT)되거나 그룹화(GROUP BY)가 필요한 쿼리에 인덱스 생성
4. 다른 테이블과 자주 조인되는 컬럼에 인덱스 사용
5. 특정 범위로 검색하는 쿼리에 인덱스를 사용
6. 고유성을 유지해야하는 필드에 인덱스를 사용
7. 사용하지 않는 인덱스는 제거하는 것이 성능 향상
8. 쓰기 작업은 적고, 읽기 작업이 많은 테이블에 인덱스 생성

- 인덱스를 사용하면 성능 향상이 안되는 경우
   1. 데이터가 자주 변경되는 테이블 (쓰기 작업이 많은 테이블)
      - 데이터 변경 작업이 일어날때마다 인덱스들도 같이 변경 작업 필요
   2. 데이터 양이 적은 집합
      - 데이터가 적을 경우 오히려 성능을 저하시킬 수 있음.
   3. 고유값의 수가 낮은 컬럼
      - 인덱스를 설정해도 거의 효과가 없음.
   4. 쿼리가 대부분의 테이블 데이터를 반환해야 할 경우
      - 전체 데이터를 반환해야 한다면 Full Table Scan이 유리
   5. 데이터 크기가 큰 필드(컬럼) (BLOB, TEXT)
      - 크기가 큰 이진파일이나, 내용이 매우 긴 텍스트 인덱스는 비효율

### 스토어드 프로시저(Stored Procedure)

- SQL 명령어들을 미리 모아서 저장해두고 필요할 떄 호출해서 사용할 수 있는 코드 블록

- 기본 구조
   - 프로시저 이름 : 식별자
   - 매개변수
      - IN : 입력매개변수
      - OUT : 출력 매개변수 (호출 결과 전달)
      - INOUT : 입력된 값을 변경하여 호출 결과로 반환
   - SQL문
   - 조건문, 반복문, 예외처리 등이 사용 가능
   - 프로시저 시작과 종료
   - 구분자 변경

## 스토어드 함수
- MySQL에서 사용하는 내장 함수처럼 사용자가 직접 함수를 만들어 사용할 수 있음.
```SQL
DELIMITER $$
CREATE FUNCTION 함수명 (매개변수명1 타입, 매개변수명2 타입...)
   RETURNS 리턴함수
BEGIN
   -- 함수 본문...
   RETURN 반환값;
END$$
DELIMITER ;
```


### 커서
- 데이터베이서의 쿼리 결과를 순회하고 조작하기 위한 개체
- 커서 사용 방법
   1. 커서 선언 : DECLARE CURSOR
   2. 반복 조건 선언 : DECLARE CONTINUE HANDLER
   3. 커서 열기 : OPEN
      - LOOP 반복 구간 지정
   4. 커서에서 데이터 가져오기 : FETCH
   5. 데이터 처리 : 가져온 데이터로 원하는 작업 수행
      - END LOOP 반복 종료
   6. 커서 닫기 : CLOSE

### VO, DTO
    - VO : Value Object, 데이터를 전달하는 데 사용되는 객체
        - 데이터 전달 역할만하고, 별도의 로직은 가지고 있지 않음.
        - 1. 불변성 : 설정 이후에는 값이 변하지 않음
        - 2. 동등성 : 내용이 같으면 같은 인스턴스
        - 3. 재사용성 : 같은 구조를 계속 공통적으로 사용
        - 생성자, getter, hashCode, Equals 구현
    - DTO : Data Transfet Object, 데이터를 전송하는 데 사용되는 객체
        - 여러 데이터 속성을 하나의 객체로 묶어 전달
        - 데이터의 컨테이너 역할
        - 생성자, getter, setter로 구현

### DAO 패턴
   - Data Access Object : 데이터베이스 접근을 처리하는 디자인 패턴
   - 데이터베이스 연산과 클라이언트 간의 중간 계층 역할을 하는 객체를 정의
   - 데이터베이스 연결, 쿼리 실행 등 DB 접근 코드로부터 비즈니스 로직을 분리
   - 구성요소
     1. DAO 인터페이스 : DB와 상호작용을 정의
     2. DAO 구현 클래스 : JDBC API를 사용해서 쿼리를 실행, 연결
     3. DTO : 데이터베이스로부터 전달받거나 전달하는 객체
     4. DB 연결 객체 : DB 연결을 관리하는 객체


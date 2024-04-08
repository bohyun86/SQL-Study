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

   
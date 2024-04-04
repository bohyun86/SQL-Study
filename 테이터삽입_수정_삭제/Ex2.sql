use LibraryManagement;

SELECT * FROM information_schema.table_constraints
WHERE table_name = 'Books';  -- 테이블명

SELECT * 
FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS 
WHERE CONSTRAINT_SCHEMA = 'LibraryManagement'; -- 데이터베이스 이름

SELECT * 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE TABLE_NAME = 'BorrowRecords'
AND CONSTRAINT_SCHEMA = 'LibraryManagement'; -- 데이터베이스 이름

SELECT CONSTRAINT_NAME 
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE TABLE_SCHEMA = 'LibraryManagement' -- 여기에 데이터베이스 이름을 입력하세요
AND TABLE_NAME = 'Members' 
AND CONSTRAINT_TYPE = 'UNIQUE';


-- 문제 1: `Books` 테이블에 `ISBN` 열 추가하기
-- - `Books` 테이블에 국제 표준 도서 번호(`ISBN`)를 저장할 수 있는 열을 추가하세요. `ISBN`은 문자열이며, 고유해야 합니다.
alter table Books 
add column ISBN varchar(255) unique;

-- 문제 2: `Members` 테이블의 `Email` 열 unique 제약조건 삭제하기
-- - `Members` 테이블에서 `Email` 열의 unique 제약조건을 삭제하세요.
alter table Members 
drop index Email;

-- 문제 3: `BorrowRecords` 테이블에 `Status` 열 추가하기
-- - `BorrowRecords` 테이블에 대출 상태를 나타내는 `Status` 열을 추가하세요. 가능한 값은 'Borrowed', 'Returned'입니다.
alter table BorrowRecords 
add column Status enum('Borrowed', 'Returned');

-- 문제 4: `Books` 테이블의 `PublishedYear` 열의 CHECK 제약조건 변경하기
-- - `Books` 테이블에 `PublishedYear`이 1900 이상이 되도록 기존의 CHECK 제약조건을 변경하세요. (MySQL에서는 기존의 CHECK 제약조건을 직접 수정할 수 없으므로, 제약조건을 삭제한 후 새로 추가해야 합니다.)
alter table Books 
drop check books_chk_1;  

alter table Books 
add constraint check_published_year check (PublishedYear >= 1900);

-- 문제 5: `Members` 테이블에서 `MembershipDate` 열의 기본값 변경하기
-- - `Members` 테이블의 `MembershipDate` 열에 대한 기본값을 현재 날짜에서 '2020-01-01'로 변경하세요.
alter table Members
change column MembershipDate MembershipDate date default '2020-01-01';

-- 문제 6: `BorrowRecords` 테이블의 외래 키 제약조건의 레퍼런스 옵션 변경하기
-- - `BorrowRecords` 테이블의 `MemberID` 외래 키 제약조건에 대한 레퍼런스 옵션을 `ON DELETE SET NULL`로 변경하세요. 이를 위해서는 먼저 제약조건을 삭제하고, 새로운 옵션으로 다시 추가해야 합니다.
alter table BorrowRecords
drop foreign key borrowrecords_ibfk_1;

ALTER TABLE BorrowRecords
ADD CONSTRAINT fk_MemberID FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
ON DELETE SET NULL;



CREATE TABLE Instructor (
	CourseId INT PRIMARY KEY,     -- 이행적 종속 관계의 결정자를 기본키로 테이블 분해
    InstructorName VARCHAR(255)	  -- 종속자
);

ALTER TABLE StudentCourse DROP COLUMN InstructorName;

-- 이상현상
-- 삭제이상 : 2번 학생이 수강을 취소하면 102번 강의(이강사) 정보가 삭제됨.
-- 삽입이상 : 104번 장강사 강의를 개설하면, 학생번호 null 값 삽입 문제 발생 
-- 수정이상 : 101번 강의를 조강사 맡게 될 경우 데이터 불일치 문제 발생 가능성 생김.

-- 테이블 분해
CREATE TABLE Instructor (
	CourseId INT PRIMARY KEY,     -- 이행적 종속 관계의 결정자를 기본키로 테이블 분해
    InstructorName VARCHAR(255)	  -- 종속자
);

ALTER TABLE StudentCourse DROP COLUMN InstructorName;	-- 기존 테이블의 컬럼 삭제

-- 이행적 종속성 제거
-- Before :  StudentId -> CourseId, CourseId -> InstructorName
-- StudentCourse ( StudentId(PK), CourseId, InstructorName )

-- After
-- StudentId -> CourseId      // StudentCourse ( StudentId(PK), CourseId )
-- CourseId -> InstructorName // Instructor    ( CourseId(PK), InstructorName )

-- 삭제이상없음 : 2번 학생이 수강을 취소하여도 102번 강의(이강사) 정보는 남아있음.
DELETE FROM StudentCourse WHERE StudentId = 2;
-- 삽입이상없음 : 104번 장강사 강의를 개설하더라도 null값 학생 번호 삽입하지 않음
INSERT INTO Instructor VALUES (104, '장강사');
-- 수정이상없음 : 101번 강의를 조강사 맡게 되어도 데이터 불일치 문제 발생 가능성 없음.
UPDATE Instructor SET InstructorName = '조강사' WHERE CourseId = 101;

-- 3정규형 만족



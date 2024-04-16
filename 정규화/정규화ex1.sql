/* 2정규형 */
DROP TABLE IF EXISTS CourseRegist;
CREATE TABLE CourseRegist (
    StudentId Int,
    CourseId Int,
    InstructorName VARCHAR(255),
    CourseName VARCHAR(255),
    PRIMARY KEY (StudentId, CourseId)	-- 복합 기본키
);

INSERT INTO CourseRegist VALUES
	(1, 101, '홍길동', '데이터베이스'),
    (1, 102, '이영희', '자료구조'),
    (2, 101, '홍길동', '데이터베이스'),
    (2, 103, '김철수', '알고리즘');

SELECT * FROM CourseRegist;

-- 삭제이상 : 학생 1번, 102번 강의 수강 정보를 취소하게 되면 이영희 강사의 자료구조라는 강의 정보가 사라짐.
-- 삽입이상 : 새로운 강의 103, 전우치교수의 컴퓨터도술 강의가 개설되면 학생번호에 null값 삽입 문제가 발생
-- 수정이상 : 홍길동 교수가 데이터베이스 강의 대신 안드로이드 강의를 맡게되면 데이터 불일치 발생 가능성이 있음.

-- 제 2 정규형으로 테이블을 분해
-- CourseRegist( StudentId(PK), CourseId(PK), InstructorName, CourseName )
-- 부분 함수 종속이 존재  CourseId -> InstructorName, CourseName
-- 부분 함수 종속성 제거
-- Enrollment ( StudentId(PK), CourseId(PK) )
-- Course ( CourseId(PK), InstructorName, CourseName )
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Course;

-- 분리 테이블 수강참여
CREATE TABLE Enrollment (
	StudentId INT, 
    CourseId INT,
	PRIMARY KEY (StudentId, CourseId)
);
-- 분리 테이블 2 강좌
CREATE TABLE Course (
	CourseId INT PRIMARY KEY,
    InstructorName VARCHAR(255),
    CourseName VARCHAR(255)
);

-- 기존 데이터 복사하여 삽입
INSERT INTO Enrollment (StudentId, CourseId)
	SELECT StudentId, CourseId FROM CourseRegist;
    
-- 중복 데이터 제거하여 삽입
INSERT INTO Course (CourseId, InstructorName, CourseName)
	SELECT DISTINCT CourseId, InstructorName, CourseName FROM CourseRegist;

-- 테이블 정보 확인
SELECT * FROM Enrollment;
SELECT * FROM Course;

-- 삭제이상없음 : 학생 1번, 102번 강의 수강 정보를 취소하더라도, 이영희 강사의 자료구조라는 강의 정보는 별개의 테이블에 유지
DELETE FROM Enrollment WHERE StudentId = 1 AND CourseId = 102;
-- 삽입이상없음 : 새로운 강의 104, 전우치교수의 컴퓨터도술 강의가 개설되더라도 null 값 포함되지 않음
INSERT INTO Course VALUES (104, '전우치', '컴퓨터도술');
-- 수정이상없음 : 홍길동 교수가 데이터베이스 강의 대신 안드로이드 강의를 맡게되더라도 한 튜플(행)만 수정하여 데이터 불일치 가능성 없음.
UPDATE Course SET CourseName = '안드로이드' WHERE InstructorName = '홍길동';
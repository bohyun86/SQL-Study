DROP TABLE IF EXISTS Students_1NF;
CREATE TABLE Students_1NF (
	StudentCourseId INT PRIMARY KEY AUTO_INCREMENT,-- 기본키
	StudentId INT,				    -- 학번
    Name VARCHAR(50),		     	-- 이름
    Course VARCHAR(255)			    -- 과정
);

-- 1정규화를 적용을 위해 데이터를 원자값으로 쪼개어 삽입
INSERT INTO Students_1NF (StudentId, Name, Course) VALUES
	(1, '홍길동', '수학'),
    (1, '홍길동', '과학');
INSERT INTO Students_1NF (StudentId, Name, Course) VALUES
    (2, '임꺽정', '국어');
INSERT INTO Students_1NF (StudentId, Name, Course) VALUES
    (3, '전우치', '사회'),
    (3, '전우치', '국어'),
    (3, '전우치', '영어');

-- Course 속성이 원자값으로 변경되어 1정규형을 만족
SELECT * FROM Students_1NF;

/* 2정규형 */
CREATE TABLE CourseRegist (
    StudentId Int,
    CourseId Int,
    InsturctorName VARCHAR(255),
    CourseName VARCHAR(255),
    PRIMARY KEY (StudentId, CourseId)	-- 복합 기본키
);

INSERT INTO CourseRegist VALUES
	(1, 101, '홍길동', '데이터베이스'),
    (1, 102, '이영희', '자료구조'),
    (2, 101, '홍길동', '데이터베이스'),
    (2, 103, '김철수', '알고리즘');

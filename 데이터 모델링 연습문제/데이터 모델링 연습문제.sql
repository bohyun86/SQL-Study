create database training;

use training;

CREATE TABLE Member (
	MemberID INT PRIMARY KEY,
	Name VARCHAR(100),
	Address VARCHAR(255),
	Phone VARCHAR(15)
);

CREATE TABLE Trainer (
    TrainerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(50)
);

CREATE TABLE Class (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100),
    StartTime TIME,
    EndTime TIME,
    TrainerID INT,
    FOREIGN KEY (TrainerID) REFERENCES Trainer(TrainerID)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    MemberID INT,
    ClassID INT,
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);


select * from Member;
select * from Trainer;
select * from Class;
select * from enrollment;

INSERT INTO Member
values (1, '김지수', '서울시 강남구 역삼동', '010-1234-5678'),
(2, '이태민', '서울시 서초구 바포동', '010-8765-4321');

INSERT INTO Trainer
values (1, '박서준', '필라테스'),
(2, '최유리', '에어로빅');

INSERT INTO Class
VALUES (1, '오전 요가', '09:00', '10:00', 1),
(2, '저녁 웨이트 트레이닝', '20:00', '21:00', 2);

INSERT INTO Enrollment
VALUES (1, 1, 1),
(2, 2, 2);

desc Class;
desc enrollment;
desc trainer;

SELECT m.name, ClassName from Member m, Enrollment e, Class c
where m.MemberID = e.MemberID and e.ClassID = c.ClassID;

SELECT t.name, count(*) 
FROM Trainer t JOIN Class c
ON t.TrainerID = c.TrainerID
GROUP BY c.TrainerID
ORDER BY count(*) desc;

SELECT ClassName, StartTime, EndTime FROM Class
WHERE StartTime < '12:00'
ORDER BY StartTime;

SELECT m.Name, className, MAX(c.StartTime)
FROM Member m
JOIN Enrollment e ON m.MemberID = e.MemberID
JOIN Class c ON e.ClassID = c.ClassID
GROUP BY m.Name;



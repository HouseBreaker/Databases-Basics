-- 03. Many-To-Many Relationship

CREATE TABLE Students
(
	StudentID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50)
)

CREATE TABLE Exams
(
	ExamID INT IDENTITY(101,1) PRIMARY KEY,
	Name NVARCHAR(50)
)

CREATE TABLE StudentsExams
(
	StudentID INT,
	ExamID INT,
	CONSTRAINT PK_StudentsExams PRIMARY KEY (StudentID, ExamID),
	CONSTRAINT FK_StudentsExams_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	CONSTRAINT FK_StudentsExams_Exams FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
)

INSERT INTO Students VALUES
('Mila'), ('Toni'), ('Ron')

INSERT INTO Exams VALUES
('Spring MVC'), ('Neo4j'), ('Oracle 11g')

INSERT INTO StudentsExams VALUES
(1, 101), (1, 102), (2, 101), (3, 103), (2, 102), (2, 103)

SELECT * FROM Students
SELECT * FROM Exams
SELECT * FROM StudentsExams

DROP TABLE StudentsExams
DROP TABLE Students
DROP TABLE Exams
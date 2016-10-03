-- 06. University Database

USE TableRelations

BEGIN TRAN

CREATE TABLE Majors
(
	MajorID INT PRIMARY KEY,
	Name VARCHAR(50)
)

CREATE TABLE Students
(
	StudentID INT PRIMARY KEY,
	StudentNumber VARCHAR(12),
	StudentName VARCHAR(50),
	MajorID INT,
	CONSTRAINT FK_Students_Majors FOREIGN KEY(MajorID) REFERENCES Majors(MajorID)
)

CREATE TABLE Payments
(
	PaymentID INT PRIMARY KEY,
	PaymentDate DATE,
	PaymentAmount DECIMAL(8,2),
	StudentID INT
	CONSTRAINT FK_Payments_Students FOREIGN KEY (PaymentID) REFERENCES Students(StudentID)
)

CREATE TABLE Subjects
(
	SubjectID INT PRIMARY KEY,
	SubjectName VARCHAR(50)
)

CREATE TABLE Agenda
(
	StudentID INT,
	SubjectID INT
	CONSTRAINT PK_Agenda PRIMARY KEY (StudentID, SubjectID),
	CONSTRAINT FK_Agenda_Subjects FOREIGN KEY (StudentID) REFERENCES Subjects(SubjectID),
	CONSTRAINT FK_Agenda_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
)

COMMIT

-- truncate database
SELECT CONCAT('ALTER TABLE ', table_name, ' DROP ', 'CONSTRAINT' ,' ', constraint_name)
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'
UNION
SELECT CONCAT('DROP TABLE ', table_name)
FROM INFORMATION_SCHEMA.TABLES
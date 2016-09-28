--Problem 1. Create Database
--DROP DATABASE IF EXISTS Minions
--CREATE DATABASE Minions
USE MINIONS

--Problem 2. Create Tables
--DROP TABLE IF EXISTS Minions
--DROP TABLE IF EXISTS Towns

CREATE TABLE Minions
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50),
	Age INT
)

CREATE TABLE Towns
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50)
)

--Problem 3. Alter Minions Table
ALTER TABLE Minions
ADD TownId INT

--Problem 4. Insert Records in Both Tables
INSERT INTO Minions VALUES
('Kevin', 22, 1), ('Bob', 15, 3), ('Steward', NULL, 2)

INSERT INTO Towns VALUES
('Sofia'), ('Plovdiv'), ('Varna')

--Problem 5. Truncate Table Minions
TRUNCATE TABLE Minions

--Problem 6. Drop All Tables
--DROP TABLE IF EXISTS Minions
--DROP TABLE IF EXISTS Towns

--Problem 7. Create Table People
--DROP TABLE IF EXISTS People
CREATE TABLE People
(
	Id INT IDENTITY,
	Name VARCHAR(200) NOT NULL,
	Picture VARBINARY(2048),
	Height NUMERIC(10, 2),
	Weight NUMERIC(10, 2),
	Gender CHAR(1) NOT NULL,
	BirthDate DATE NOT NULL,
	Biography NVARCHAR(MAX),
	CONSTRAINT PK_People PRIMARY KEY (Id)
)

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES
('Kevin', NULL, 1.82, 82.24, 'm', '01/02/2001', 'Some Biography here'),
('Marie Poppinz', NULL, 1.60, 40.55, 'f', '01/03/2001', 'Some Biography here'),
('Steward', NULL, 1.84, 95.00, 'm', '01/04/2001', 'Some Biography here'),
('Bob Bob', NULL, 1.86, 101.99, 'm', '06/11/2001', 'Some Biography here'),
('An Ann Annie', NULL, 1.72, 60.22, 'f', '01/12/2001', 'Some Biography here')

SELECT * FROM People

--Problem 8. Create Table Users
DROP TABLE IF EXISTS Users
CREATE TABLE Users
(
	Id BIGINT IDENTITY NOT NULL,
	Username NVARCHAR(30) NOT NULL,
	Password NVARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX),
	LastLoginTime TIME,
	IsDeleted BIT
	CONSTRAINT PK_Users PRIMARY KEY (ID)
)

INSERT INTO Users (Username, Password)
VALUES
('Gosho', 'gosho123'),
('Ivan', 'ivan123'),
('Petar', 'petar123'),
('Дилян', 'dilqn123'),
('Иво', 'ivo123')

--Problem 9. Change Primary Key
ALTER TABLE Users
DROP CONSTRAINT PK_Users

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY (Id, Username)

--Problem 10. Add Check Constraint
ALTER TABLE Users
ADD CONSTRAINT CHK_Password CHECK (LEN(Password)>=5)

--Problem 11. Set Default Value of a Field
ALTER TABLE Users
ADD DEFAULT GETDATE() FOR LastLoginTime

--Problem 12. Set Unique Field
ALTER TABLE Users
DROP CONSTRAINT PK_Users

ALTER TABLE Users
ADD CONSTRAINT PK_Users PRIMARY KEY (Id)

ALTER TABLE Users
ADD CONSTRAINT UK_Username UNIQUE (Username)

ALTER TABLE Users
ADD CONSTRAINT CK_Username CHECK (LEN(Username)>=3)

--Problem 13. Movies Database
CREATE DATABASE Movies
USE Movies

CREATE TABLE Directors
(
	Id INT IDENTITY PRIMARY KEY,
	DirectorName NVARCHAR(30) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Genres
(
	Id INT IDENTITY PRIMARY KEY,
	GenreName NVARCHAR(200) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Categories
(
	Id INT IDENTITY PRIMARY KEY,
	CategoryName NVARCHAR(200) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Movies
(
	Id INT IDENTITY PRIMARY KEY,
	Title NVARCHAR(200) NOT NULL,
	DirectorId INT NOT NULL,
	CopyrightYear DECIMAL(4) NOT NULL,
	Length BIGINT NOT NULL, --store as ticks or milliseconds
	GenreId INT NOT NULL,
	CategoryId INT NOT NULL,
	Rating INT,
	Notes NVARCHAR(MAX)
)

TRUNCATE TABLE Directors
TRUNCATE TABLE Genres
TRUNCATE TABLE Categories
TRUNCATE TABLE Movies

INSERT INTO Directors (DirectorName) VALUES
('Barry Sonnenfeld'),
('George Nolfi'),
('Steve Barron'),
('Michael Curtiz')

INSERT INTO Directors (DirectorName, Notes) VALUES
('Steven Spielberg', 'notes!!!')

INSERT INTO Genres (GenreName) VALUES
('Horror'),
('Adventure'),
('Action'),
('Sci-Fi'),
('Comedy')

INSERT INTO Categories (CategoryName) VALUES
('Feature Film'),
('Short Film'),
('Long film'),
('Box Office Hit'),
('Independent film')

INSERT INTO Movies
(Title, DirectorId, GenreId, CategoryId, CopyrightYear, Length)
VALUES
('The Addams Family', 1, 1, 1, 1991, 5400000),
('The Adventures of Tintin', 2, 2, 2, 2011, 5300000),
('The Adventures of Robin Hood', 3, 3, 3, 1938, 5100000),
('The Adventures of Pinocchio', 4, 4, 4, 1996, 4500000),
('The Adjustment Bureau', 5, 5, 5, 2011, 5600000)

SELECT
Title,
CopyrightYear,
DirectorName AS Director,
GenreName AS Genre,
CategoryName AS Category
FROM Movies
JOIN Directors
ON DirectorId=Directors.Id
JOIN Genres
ON GenreId=Genres.Id
JOIN Categories
ON CategoryId=Categories.Id

--Problem 14. Car Rental Database
CREATE Database CarRental

USE CarRental

CREATE TABLE Categories
(
	Id INT IDENTITY PRIMARY KEY,
	Category NVARCHAR(30) NOT NULL,
	DailyRate REAL NOT NULL,
	WeeklyRate REAL NOT NULL,
	MonthlyRate REAL NOT NULL,
	WeekendRate REAL NOT NULL
)

CREATE TABLE Cars
(
	Id INT IDENTITY PRIMARY KEY,
	PlateNumber NUMERIC(10) NOT NULL,
	Make NVARCHAR(20) NOT NULL,
	Model NVARCHAR(20) NOT NULL,
	CarYear NUMERIC(4) NOT NULL,
	CategoryId INT NOT NULL,
	Doors TINYINT NOT NULL,
	Picture VARBINARY(MAX),
	Condition NVARCHAR(10) NOT NULL,
	Available BIT NOT NULL
)

CREATE TABLE Employees
(
	Id INT IDENTITY PRIMARY KEY,
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	Title NVARCHAR(30) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Customers
(
	Id INT IDENTITY PRIMARY KEY,
	DriverLicenceNumber NUMERIC(10) NOT NULL,
	FullName NVARCHAR(50) NOT NULL,
	Address NVARCHAR(200) NOT NULL,
	City NVARCHAR(30) NOT NULL,
	ZIPCode NUMERIC(5) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE RentalOrders 
(
	Id INT IDENTITY PRIMARY KEY,
	EmployeeId INT NOT NULL,
	CustomerId INT NOT NULL,
	CarId INT NOT NULL,
	CarCondition NVARCHAR(10) NOT NULL,
	TankLevel REAL NOT NULL,
	KilometrageStart INT NOT NULL,
	KilometrageEnd INT NOT NULL,
	TotalKilometrage INT NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	TotalDays INT NOT NULL,
	RateApplied REAL NOT NULL,
	TaxRate REAL NOT NULL,
	OrderStatus NVARCHAR(10) NOT NULL,
	Notes NVARCHAR(MAX)
)

TRUNCATE TABLE Categories
TRUNCATE TABLE Cars
TRUNCATE TABLE Employees
TRUNCATE TABLE Customers
TRUNCATE TABLE RentalOrders

INSERT INTO Categories
(Category, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES
('Sedan', 5.5, 1.5, 2.5, 10.10),
('Coupe', 5.5, 1.5, 2.5, 10.10),
('Jeep', 10.5, 15.5, 23.5, 140.10)

INSERT INTO Cars
(PlateNumber, Make, Model, CarYear, CategoryId, Doors, Condition, Available)
VALUES
(9094093020, 'Mercedes', 'Benz', 2003, 1, 4, 'Used', 'TRUE'),
(9384938423, 'Volkswagen', 'Golf', 1982, 2, 2, 'New', 'TRUE'),
(9094093020, 'Opel', 'Astra', 1994, 3, 4, 'Slight use', 'FALSE')

INSERT INTO Employees (FirstName, LastName, Title) VALUES
('Ivan', 'Petrov', 'Manager'),
('Georgi', 'Ivanov', 'Supervisor'),
('Petar', 'Baroveca', 'CEO')

INSERT INTO Customers (DriverLicenceNumber, FullName, Address, City, ZIPCode) VALUES
(9292929393, 'Ivan Ivanov', 'Vasil Levski 9', 'Petrich', 6560),
(7384738283, 'Ivelin Hristov', 'Hristo Botev 11', 'Pernik', 4544),
(9338339474, 'Martin Petrov', 'Georgi Rakovski 56', 'Mezdra', 3100)

INSERT INTO RentalOrders 
(EmployeeId, CustomerId, CarId, CarCondition, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus)
VALUES
(1, 1, 1, 'New', 3000, 50, 50000, 150000, '11-30-1993', '11-30-1997', 5003, 3.5, 2.5, 'Delivered'),
(2, 2, 2, 'Used', 6435, 12, 56453, 958473, '12-31-1994', '10-30-1999', 53420, 7.5, 8.2, 'Pending'),
(3, 3, 3, 'Slight Use', 3553, 530, 52320, 154300, '5-5-1992', '6-30-1997', 3423, 4.5, 1.5, 'Cancelled')

--Problem 15. Hotel Database
CREATE DATABASE Hotel

USE Hotel

CREATE TABLE Employees
(
	Id INT IDENTITY PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title NVARCHAR(20),
	Notes NVARCHAR(200)
)

CREATE TABLE Customers
(
	AccountNumber BIGINT PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PhoneNumber NVARCHAR(15) NOT NULL,
	EmergencyName NVARCHAR(20),
	EmergencyNumber NVARCHAR(15),
	Notes NVARCHAR(200)
)

CREATE TABLE RoomStatus
(
	RoomStatus NVARCHAR(10) PRIMARY KEY,
	Notes NVARCHAR(200)
)

CREATE TABLE RoomTypes
(
	RoomType NVARCHAR(20) PRIMARY KEY,
	Notes NVARCHAR(200)
)

CREATE TABLE BedTypes
(
	BedType NVARCHAR(10) PRIMARY KEY,
	Notes NVARCHAR(200)
)

CREATE TABLE Rooms
(
	RoomNumber INT PRIMARY KEY,
	RoomType NVARCHAR(10) NOT NULL,
	BedType NVARCHAR(10) NOT NULL,
	Rate NUMERIC NOT NULL,
	RoomStatus NVARCHAR(10) NOT NULL,
	Notes NVARCHAR(200)
)

CREATE TABLE Payments
(
	Id INT IDENTITY PRIMARY KEY,
	EmployeeId INT NOT NULL,
	PaymentDate DATE NOT NULL,
	AccountNumber BIGINT NOT NULL,
	FirstDateOccupied DATE NOT NULL,
	LastDateOccupied DATE NOT NULL,
	TotalDays INT,
	AmountCharged NUMERIC NOT NULL,
	TaxRate NUMERIC,
	TaxAmount NUMERIC,
	PaymentTotal NUMERIC NOT NULL,
	Notes NVARCHAR(200)
)

CREATE TABLE Occupancies
(
	Id INT IDENTITY PRIMARY KEY,
	EmployeeId INT NOT NULL,
	DateOccupied DATE NOT NULL,
	AccountNumber BIGINT NOT NULL,
	RoomNumber INT NOT NULL,
	RateApplied NUMERIC,
	PhoneCharge NUMERIC,
	Notes NVARCHAR(MAX)
)

INSERT INTO Employees (FirstName, LastName, Title) VALUES
('Ivan', 'Petrov', 'Manager'),
('Georgi', 'Ivanov', 'Supervisor'),
('Martin', 'Dimitrov', 'Employee')

INSERT INTO Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName,	EmergencyNumber) VALUES
(1001020302, 'Gosho', 'Ivanov', 0887347347, 'Gosho', 0887347347),
(1626362636, 'Petar', 'Cenov', 0874837483, 'Petar', 0874837483),
(1738273827, 'Ivan', 'Petrov', 0897384738, 'Ivan', 0897384738)

INSERT INTO RoomStatus (RoomStatus) VALUES
('Taken'), ('Free'), ('Processing')

INSERT INTO RoomTypes (RoomType) VALUES
('Single'), ('Double'), ('Family')

INSERT INTO BedTypes (BedType) VALUES
('Single'), ('Bunk'), ('King Size')

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus) VALUES
(101, 'Single', 'Single', '30.50', 'Free'),
(102, 'Double', 'Bunk', '40.50', 'Taken'),
(103, 'Family', 'King Size', '50.50', 'Processing')

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal) VALUES
(1, GETDATE(), 1002030203, GETDATE(), GETDATE(), 2, 30.5, 1.5, 1.5*30.5, 300),
(2, GETDATE(), 8473847283, GETDATE(), GETDATE(), 5, 30.5, 1.5, 1.5*30.5, 350),
(3, GETDATE(), 9138472837, GETDATE(), GETDATE(), 2, 30.5, 1.5, 1.5*30.5, 400)

--Problem 16. Create SoftUni Database
CREATE DATABASE SoftUni

USE SoftUni

CREATE TABLE Towns
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL
)

CREATE TABLE Addresses
(
	Id INT IDENTITY PRIMARY KEY,
	AddressText NVARCHAR(200) NOT NULL,
	TownId INT NOT NULL
	CONSTRAINT FK_Towns FOREIGN KEY (TownId) REFERENCES Towns(Id)
)

CREATE TABLE Departments
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(20) NOT NULL
)

CREATE TABLE Employees
(
	Id INT IDENTITY PRIMARY KEY,
	FirstName NVARCHAR(20) NOT NULL,
	MiddleName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	JobTitle NVARCHAR(50) NOT NULL,
	DepartmentId INT NOT NULL,
	HireDate DATE NOT NULL,
	Salary INT NOT NULL,
	AddressId INT

	CONSTRAINT FK_Departments FOREIGN KEY (DepartmentId) REFERENCES Departments (Id),
	CONSTRAINT FK_Addresses FOREIGN KEY (AddressId) REFERENCES Addresses (Id)
)

--Problem 17. Backup Database
BACKUP DATABASE SoftUni
	TO DISK = 'D:\softuni-backup.bak' --location where the backup file will be saved
		WITH FORMAT,
			MEDIANAME = '',
			NAME = 'Full Backup of SoftUni db';
GO

RESTORE DATABASE SoftUni
FROM DISK = 'D:\softuni-backup.bak'

--Problem 18. Basic Insert
USE SoftUni
GO

INSERT INTO Towns (Name)
VALUES ('Sofia'), ('Plovdiv'), ('Varna'), ('Burgas')

INSERT INTO Departments (Name) 
VALUES ('Engineering'), ('Sales'), ('Marketing'), ('Software Development'), ('Quality Assurance')

INSERT INTO Employees (FirstName, MiddleName, LastName, JobTitle, DepartmentId, HireDate, Salary) 
VALUES 
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '01/02/2013', 3500.00),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '02/03/2004', 4000.00),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '08/28/2016', 525.25),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '09/12/2007', 3000.00),
('Peter', 'Pan', 'Pan', 'Intern', 3, '08/28/2016', 599.88)

--Problem 19. Basic Select All Fields
SELECT * FROM Towns
SELECT * FROM Departments
SELECT * FROM Employees

--Problem 20. Basic Select All Fields and Order Them
SELECT * FROM Towns
ORDER BY Name

SELECT * FROM Departments
ORDER BY Name

SELECT * FROM Employees
ORDER BY Salary DESC

--Problem 21. Basic Select Some Fields
SELECT Name FROM Towns
ORDER BY Name

SELECT Name FROM Departments
ORDER BY Name

SELECT FirstName, LastName, JobTitle, Salary FROM Employees
ORDER BY Salary DESC

--Problem 22. Increase Employees Salary
UPDATE Employees
SET Salary += Salary*0.1

SELECT Salary FROM Employees

--Problem 23. Decrease Tax Rate
USE Hotel

UPDATE Payments
SET TaxRate -= TaxRate*0.03
SELECT TaxRate FROM Payments

--Problem 24. Delete All Records
USE Hotel
TRUNCATE TABLE Occupancies
--Problem 1. Create Database
--DROP DATABASE IF EXISTS Minions
--CREATE DATABASE Minions
USE MINIONS

--Problem 2. Create Tables
DROP TABLE IF EXISTS Minions
DROP TABLE IF EXISTS Towns

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
DROP TABLE IF EXISTS Minions
DROP TABLE IF EXISTS Towns

--Problem 7. Create Table People
DROP TABLE IF EXISTS People
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
('Gosho', 'Ivanov'),
('Ivan', 'Petrov'),
('Petar', 'Inkov'),
('Дилян', 'Гроздарски'),
('Иво', 'Христов')

SELECT * FROM Users
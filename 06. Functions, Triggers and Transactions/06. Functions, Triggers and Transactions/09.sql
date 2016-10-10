-- 9. Find Full Name
-- You are given a database schema with tables AccountHolders(Id (PK), FirstName, LastName, SSN) and Accounts(Id (PK), AccountHolderId (FK), Balance).  Write a stored procedure usp_GetHoldersFullName that selects the full names of all people. Submit your query statement as Run skeleton, run queries & check DB in Judge.

USE FunctionsTriggers

CREATE TABLE AccountHolders (
	Id INT IDENTITY PRIMARY KEY,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	SSN DECIMAL
)

CREATE TABLE Accounts(
	AccountHolderId INT,
	Balance MONEY
	CONSTRAINT FK_Accounts_AccountHolders FOREIGN KEY (AccountHolderId) REFERENCES AccountHolders (Id)
)

GO

CREATE PROC usp_GetHoldersFullName
AS
SELECT FirstName + ' ' + LastName FROM AccountHolders
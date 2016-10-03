-- Problem 1.	Employees with Salary Above 35000
-- Create stored procedure usp_GetEmployeesSalaryAbove35000 that returns all employees’ first and last names for whose salary is above 35000. Submit your query statement as Run skeleton, run queries & check DB in Judge.

CREATE PROC usp_GetEmployeesSalaryAbove35000
AS
SELECT FirstName, LastName FROM Employees
WHERE Salary > 35000
GO

EXEC usp_GetEmployeesSalaryAbove35000

DROP PROC usp_GetEmployeesSalaryAbove35000
GO
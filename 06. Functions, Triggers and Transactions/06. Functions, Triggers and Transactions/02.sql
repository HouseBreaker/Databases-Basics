-- 02. Employees with Salary Above Number
-- Create stored procedure usp_GetEmployeesSalaryAboveNumber that accept a number as parameter and return all employees’ first and last names whose salary is above or equal to the given number. Submit your query statement as Run skeleton, run queries & check DB in Judge.

CREATE PROC usp_GetEmployeesSalaryAboveNumber @number MONEY
AS
SELECT FirstName, LastName FROM Employees
WHERE Salary >= @number
GO

EXEC usp_GetEmployeesSalaryAboveNumber 50000.234
GO

DROP PROC usp_GetEmployeesSalaryAboveNumber
GO
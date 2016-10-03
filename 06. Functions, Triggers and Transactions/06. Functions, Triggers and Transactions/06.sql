-- Problem 6.	Employees by Salary Level
-- Write a stored procedure usp_EmployeesBySalaryLevel that receive as parameter level of salary (low, average or high) and print the names of all employees that have given level of salary.

DROP PROC IF EXISTS usp_EmployeesBySalaryLevel
GO

CREATE PROC usp_EmployeesBySalaryLevel @salaryLevel VARCHAR(7)
AS
SELECT FirstName, LastName
FROM Employees
WHERE dbo.ufn_GetSalaryLevel(Salary) = @salaryLevel
GO

EXEC usp_EmployeesBySalaryLevel 'low'
EXEC usp_EmployeesBySalaryLevel 'average'
EXEC usp_EmployeesBySalaryLevel 'high'
GO
-- 05. Salary Level Function
-- Write a function ufn_GetSalaryLevel(@salary MONEY) that receives salary of an employee and returns the level of the salary.

DROP FUNCTION IF EXISTS dbo.ufn_GetSalaryLevel
GO

CREATE FUNCTION ufn_GetSalaryLevel (@salary MONEY) RETURNS VARCHAR(7)
AS
BEGIN
	DECLARE @salaryLevel VARCHAR(7);
	
	IF(@salary < 30000)
		SET @salaryLevel = 'Low'
	ELSE IF (@salary BETWEEN 30000 AND 50000)
		SET @salaryLevel = 'Average'
	ELSE
		SET @salaryLevel = 'High'

	RETURN (@salaryLevel)
END
GO

SELECT FirstName, LastName, Salary, dbo.ufn_GetSalaryLevel(Salary) FROM Employees
ORDER BY Salary
GO
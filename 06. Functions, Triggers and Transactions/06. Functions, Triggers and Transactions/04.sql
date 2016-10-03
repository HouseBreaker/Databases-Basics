-- 04. Employees from Town
-- Write a stored procedure usp_GetEmployeesFromTown that accepts town name as parameter and return the employees’ first and last name that live in the given town. Submit your query statement as Run skeleton, run queries & check DB in Judge.

CREATE PROC usp_GetEmployeesFromTown @townName NVARCHAR(MAX)
AS
SELECT FirstName, LastName FROM Employees
LEFT JOIN Addresses ON
Employees.AddressID = Addresses.AddressID
LEFT JOIN Towns ON
Addresses.TownID = Towns.TownID
WHERE Towns.Name = @townName
GO

EXEC usp_GetEmployeesFromTown 'Sofia'
GO

DROP PROC usp_GetEmployeesFromTown
GO
-- 08. Delete Employees and Departments
-- Write a SQL query to delete all Employees from the Production and Production Control departments. Also delete these departments from the Departments table. After that exercise restore your database to revert those changes.

BEGIN TRAN

USE SoftUni

SELECT FirstName,
	   LastName,
	   Employees.DepartmentId,
	   Departments.Name
  FROM Employees
LEFT JOIN Departments ON
Departments.DepartmentID = Employees.DepartmentID

DELETE FROM EmployeesProjects
WHERE EmployeeID IN
(SELECT Employees.EmployeeID 
FROM Employees
JOIN Departments ON
Employees.DepartmentID = Departments.DepartmentID
WHERE Departments.Name IN ('Production', 'Production Control'))

DELETE FROM Employees
WHERE DepartmentID IN 
(SELECT DepartmentID FROM Departments WHERE Name IN ('Production', 'Production Control'))

DELETE FROM Departments
WHERE DepartmentID IN 
(SELECT DepartmentID FROM Departments WHERE Name IN ('Production', 'Production Control'))

SELECT * FROM Departments

ROLLBACK
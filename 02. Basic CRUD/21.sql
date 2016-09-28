-- 21. Increase Salaries
-- Write a SQL query to increase salaries of all employees that are in the Engineering, Tool Design, Marketing or Information Services department by 12%. Then select Salaries column from the Employees table. After that exercise restore your database to revert those changes. Submit your query statements as Prepare DB & run queries.

UPDATE Employees
SET Salary += Salary * 0.12
WHERE DepartmentID IN 
(
	(SELECT DepartmentId FROM Departments WHERE Name = 'Engineering'),
	(SELECT DepartmentId FROM Departments WHERE Name = 'Tool Design'),
	(SELECT DepartmentId FROM Departments WHERE Name = 'Marketing'),
	(SELECT DepartmentId FROM Departments WHERE Name = 'Information Services')
)

SELECT Salary FROM Employees
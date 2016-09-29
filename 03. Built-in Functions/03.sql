-- 03. Find First Names of All Employees
-- Write a SQL query to find the first names of all employees in the departments with ID 3 or 10 and whose hire year is between 1995 and 2005 inclusive. Submit your query statements as Prepare DB & run queries.

SELECT FirstName FROM Employees
WHERE DepartmentId IN (3, 10)
AND YEAR(HireDate) BETWEEN 1995 AND 2005
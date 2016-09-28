-- 14. Find All Employees Except Marketing
-- Write a SQL query to find the first and last names of all employees whose department ID is different from 4. Submit your query statements as Prepare DB & run queries.

SELECT FirstName, LastName FROM Employees
WHERE DepartmentId != 4
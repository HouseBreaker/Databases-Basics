-- 01. Find Names of All Employees by First Name
-- Write a SQL query to find first and last names of all employees whose first name starts with “SA”. Submit your query statements as Prepare DB & run queries.

SELECT FirstName, LastName FROM Employees
WHERE FirstName LIKE 'SA%'
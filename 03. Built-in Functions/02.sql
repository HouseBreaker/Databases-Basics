-- 02. Find Names of All employees by Last Name 
-- Write a SQL query to find first and last names of all employees whose last name contains “ei”. Submit your query statements as Prepare DB & run queries.

SELECT FirstName, LastName FROM Employees
WHERE LastName LIKE '%ei%'
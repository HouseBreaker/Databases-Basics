-- 04. Find All Employees Except Engineers
-- Write a SQL query to find the first and last names of all employees whose job titles does not contain “engineer”. Submit your query statements as Prepare DB & run queries.

SELECT FirstName, LastName FROM Employees
WHERE JobTitle NOT LIKE '%engineer%'
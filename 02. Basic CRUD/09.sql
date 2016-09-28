--09. Find Names of All Employees by Salary in Range
--Write a SQL query to find the first name, last name and job title of all employees whose salary is in the range [20000, 30000]. Submit your query statements as Prepare DB & run queries.

SELECT FirstName, LastName, JobTitle FROM Employees
WHERE Salary BETWEEN 20000 AND 30000
-- 12. Find All Employees with Salary More Than 50000
-- Write a SQL query to find first name, last name and salary of those employees who has salary more than 50000. Order them in decreasing order by salary. Submit your query statements as Prepare DB & run queries.

SELECT FirstName, LastName, Salary FROM Employees
WHERE Salary > 50000
ORDER BY Salary DESC
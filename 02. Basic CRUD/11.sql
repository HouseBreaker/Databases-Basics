-- 11. Find All Employees Without Manager
-- Write a SQL query to find first and last names about those employees that does not have a manager. Submit your query statements as Prepare DB & run queries.

SELECT FirstName, LastName FROM Employees
WHERE ManagerId IS NULL
-- 13. Find 5 Best Paid Employees.
-- Write SQL query to find first and last names about 5 best paid Employees ordered descending by their salary. Submit your query statements as Prepare DB & run queries.

SELECT TOP 5 FirstName, LastName FROM Employees
ORDER BY Salary DESC
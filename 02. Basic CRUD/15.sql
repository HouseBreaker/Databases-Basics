-- 15. Sort Employees Table
-- Write a SQL query to sort all records in the Employees table by the following criteria: 
-- •	First by salary in decreasing order
-- •	Then by first name alphabetically
-- •	Then by last name descending
-- •	Then by middle name alphabetically
-- Submit your query statements as Prepare DB & run queries.

SELECT * FROM Employees
ORDER BY Salary DESC,
FirstName,
LastName DESC,
MiddleName
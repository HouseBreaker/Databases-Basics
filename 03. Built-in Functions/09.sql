-- 09.	Length of Last Name
-- Write a SQL query to find the names of all employees whose last name is exactly 5 characters long.

SELECT FirstName, LastName FROM Employees
WHERE LEN(LastName) = 5
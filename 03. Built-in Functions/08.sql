-- 08. Create View Employees Hired After 2000 Year
-- Write a SQL query to create view V_EmployeesHiredAfter2000 with first and last name to all employees hired after 2000 year. Submit your query statements as Run skeleton, run queries & check DB.

CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT FirstName, LastName FROM Employees
WHERE YEAR(HireDate) > 2000
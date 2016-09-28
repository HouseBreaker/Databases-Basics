-- 17. Create View Employees with Job Titles
-- Write a SQL query to create view V_EmployeeNameJobTitle with full employee name and job title. When middle name is NULL replace it with empty string (''). Submit your query statements as Run skeleton, run queries & check DB.

CREATE VIEW V_EmployeeNameJobTitle AS
SELECT FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS [Full Name], JobTitle FROM Employees
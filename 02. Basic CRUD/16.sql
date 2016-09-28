-- 16. Create View Employees with Salaries
-- Write a SQL query to create a view V_EmployeesSalaries with first name, last name and salary for each employee. Submit your query statements as Run skeleton, run queries & check DB.

CREATE VIEW V_EmployeesSalaries AS
SELECT FirstName, LastName, Salary FROM Employees
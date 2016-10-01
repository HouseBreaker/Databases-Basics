-- 14. Employees Average Salaries
-- Select all employees who earn more than 30000 into a new table. Then delete all employees who has ManagerID = 42; Then increase the salaries of all employees with DepartmentID=1 with 5000. Finally, select the average salaries in each department.

SELECT * FROM Employees
WHERE Salary > 30000
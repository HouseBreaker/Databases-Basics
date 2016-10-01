-- 15. Employees Maximum Salaries
-- Find the max salary for each department. Filter those which have max salaries not in the range 30000 and 70000;

SELECT DepartmentId, MAX(Salary) AS [MaxSalary] FROM Employees
GROUP BY DepartmentID
HAVING MAX(Salary) NOT BETWEEN 30000 AND 70000
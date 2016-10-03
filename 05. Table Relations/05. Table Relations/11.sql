-- 11. Employees Without Project
SELECT TOP 3 e.EmployeeID, e.FirstName FROM Employees e
LEFT OUTER JOIN EmployeesProjects AS p ON
e.EmployeeID = p.EmployeeID
WHERE p.EmployeeID IS NULL
ORDER BY p.EmployeeID
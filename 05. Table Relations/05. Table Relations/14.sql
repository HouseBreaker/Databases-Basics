-- 14. Employee Manager
SELECT
	e.EmployeeID,
	e.FirstName,
	e.ManagerID,
	m.Firstname AS ManagerName
FROM Employees AS e
JOIN Employees as m
ON m.EmployeeID = e.ManagerID
WHERE m.EmployeeID IN (3, 7)
-- 13. Employee 24
SELECT TOP 5 
	e.EmployeeID,
	e.FirstName,
	p.Name AS ProjectName
FROM Employees e
LEFT OUTER JOIN EmployeesProjects AS ep ON
e.EmployeeID = ep.EmployeeID
LEFT OUTER JOIN Projects as p ON
ep.ProjectID = p.ProjectID
AND YEAR(p.StartDate) < 2005
WHERE e.EmployeeID = 24
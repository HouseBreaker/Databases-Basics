SELECT TOP 5 CityName, b.Name, COUNT(*) AS EmployeesCount FROM Employees e
JOIN Branches b ON b.BranchID = e.BranchID
JOIN Cities c ON c.CityID = b.CityID
WHERE c.CityID NOT IN (4, 5)
GROUP BY CityName, b.Name
HAVING COUNT(*) >= 3
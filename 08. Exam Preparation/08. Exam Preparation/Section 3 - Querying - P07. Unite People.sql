SELECT TOP 3 FirstName, CityName FROM Employees e
JOIN Branches b ON b.BranchID = e.BranchID
JOIN Cities c ON c.CityID = b.CityID
UNION ALL
SELECT TOP 3 FirstName, CityName FROM Customers c
JOIN Cities ci ON ci.CityID = c.CityID
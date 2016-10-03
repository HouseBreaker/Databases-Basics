-- 09. Employee Address

SELECT TOP 5 e.EmployeeId, e.JobTitle, e.AddressID, a.AddressText FROM Employees as e
INNER JOIN Addresses as a
ON e.AddressID = a.AddressID
ORDER BY AddressID
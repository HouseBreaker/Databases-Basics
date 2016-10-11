SELECT CustomerID, FirstName, LastName, Gender, CityName FROM Customers c
JOIN Cities ci ON ci.CityID = c.CityID
WHERE (LastName LIKE 'Bu%' OR RIGHT(FirstName, 1) = 'a') AND LEN(CityName) >= 8
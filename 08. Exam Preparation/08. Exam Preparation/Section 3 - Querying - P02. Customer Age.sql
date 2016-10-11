SELECT
	FirstName,
	DateOfBirth,
	DATEDIFF(year, DateOfBirth, '20161001') AS Age
FROM Customers
WHERE DATEDIFF(year, DateOfBirth, '20161001') BETWEEN 40 AND 50
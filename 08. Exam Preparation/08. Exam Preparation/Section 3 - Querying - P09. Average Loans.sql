SELECT TOP 5 c.CustomerID, Amount FROM Customers c
JOIN Loans l ON l.CustomerID = c.CustomerID
WHERE Amount >
(SELECT AVG(Amount) FROM Loans l
JOIN Customers c ON c.CustomerID = l.CustomerID
WHERE c.Gender = 'M')
ORDER BY c.LastName
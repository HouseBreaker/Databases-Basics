SELECT c.CustomerID, Height FROM Customers c
LEFT JOIN Accounts a ON a.CustomerID = c.CustomerID
WHERE a.CustomerID IS NULL AND c.Height BETWEEN 1.74 AND 2.04
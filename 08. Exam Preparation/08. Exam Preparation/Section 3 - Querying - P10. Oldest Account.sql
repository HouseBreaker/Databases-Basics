SELECT c.CustomerID, FirstName, StartDate FROM Customers c
JOIN Accounts a ON a.CustomerID = c.CustomerID
WHERE StartDate = (SELECT MIN(StartDate) FROM Accounts)
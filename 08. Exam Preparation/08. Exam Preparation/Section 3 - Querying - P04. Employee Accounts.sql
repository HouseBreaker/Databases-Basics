SELECT TOP 5 e.EmployeeID, FirstName, AccountNumber FROM Employees e
JOIN EmployeesAccounts ec ON ec.EmployeeID = e.EmployeeID
JOIN Accounts a ON a.AccountID = ec.AccountID
WHERE YEAR(StartDate) > 2012
ORDER BY FirstName DESC
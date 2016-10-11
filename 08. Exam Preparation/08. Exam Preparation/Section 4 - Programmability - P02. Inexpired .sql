CREATE PROC usp_CustomersWithUnexpiredLoans @CustomerID INT
AS
SELECT c.CustomerID, FirstName, LoanID FROM Customers c
JOIN Loans l ON l.CustomerID = c.CustomerID
WHERE ExpirationDate IS NULL AND c.CustomerID = @CustomerID
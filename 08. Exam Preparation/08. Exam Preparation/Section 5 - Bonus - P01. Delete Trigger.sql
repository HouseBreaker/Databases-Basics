USE Bank
GO

CREATE TRIGGER tr_LogDeletes ON Accounts
AFTER DELETE
AS
BEGIN
	INSERT INTO AccountLogs
	SELECT AccountID, AccountNumber, StartDate, CustomerID
	FROM deleted
END
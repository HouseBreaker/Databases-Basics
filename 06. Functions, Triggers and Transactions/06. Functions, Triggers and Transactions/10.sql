-- 10. People with Balance Higher Than
-- Your task is to create a stored procedure usp_GetHoldersWithBalanceHigherThan that accepts a number as a parameter and returns all people who have more money in total of all their accounts than the supplied number. Submit your query statement as Run skeleton, run queries & check DB in Judge. 

USE FunctionsTriggers
GO

CREATE PROC usp_GetHoldersWithBalanceHigherThan @balance MONEY
AS
SELECT FirstName, LastName FROM AccountHolders
JOIN Accounts ON Accounts.AccountHolderId = AccountHolders.Id
GROUP BY FirstName, LastName
HAVING SUM(Balance) > @balance
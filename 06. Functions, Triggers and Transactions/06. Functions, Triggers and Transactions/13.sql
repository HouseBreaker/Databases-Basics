-- 13. Deposit Money
-- Add stored procedure usp_DepositMoney (AccountId, moneyAmount) that operate in transactions. Submit your query statement as Run skeleton, run queries & check DB in Judge.

CREATE PROC usp_DepositMoney @AccountId INT, @moneyAmount MONEY
AS
UPDATE Accounts
SET Balance += @moneyAmount
WHERE Id = @AccountId
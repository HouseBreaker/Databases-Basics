-- 14. Withdraw Money
-- Add stored procedures usp_WithdrawMoney (AccountId, moneyAmount) that operate in transactions. Submit your query statement as Run skeleton, run queries & check DB in Judge.

CREATE PROC usp_WithdrawMoney (@accountId INT, @moneyAmount MONEY)
AS
UPDATE Accounts
SET Balance -= @moneyAmount
WHERE Id = @accountId
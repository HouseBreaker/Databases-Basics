-- 18.	Scalar Function: Cash in User Games Odd Rows
-- Create a function ufn_CashInUsersGames that returns the sum of the cash on odd rows ordered by cash in descending order. The function should take a game name as a parameter and return the result as table. Submit only your function in judge as Run skeleton, run queries & check DB.
-- Execute the function over the following game names, ordered exactly like: “Bali”, “Lily Stargazer”, “Love in a mist”, “Mimosa”, “Ming fern”.

CREATE FUNCTION ufn_CashInUsersGames (@gameName NVARCHAR(MAX))
RETURNS TABLE
AS
RETURN
SELECT SumCash FROM
	(SELECT GameId, SUM(Cash) AS SumCash FROM
		(SELECT GameId, Cash, ROW_NUMBER() OVER (ORDER BY Cash DESC) as [Row]
		FROM UsersGames
		JOIN Games ON
		Games.Id = UsersGames.GameId
		WHERE Games.Name = @gameName) AS UsersGamesAndRows
	WHERE [Row] % 2 = 1
	GROUP BY GameId) AS GameIdsAndCashSums
GO
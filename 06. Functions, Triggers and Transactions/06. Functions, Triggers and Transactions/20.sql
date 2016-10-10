-- Problem 20.	Massive Shopping

USE Diablo

SET XACT_ABORT ON

BEGIN TRAN [BuyItems1]
BEGIN TRY
	DECLARE @gameId INT, @userId INT, @userGameId INT
	 
	SELECT
		@userId = Users.Id,
		@gameId = Games.Id,
		@userGameId = UsersGames.Id
	FROM Users
	JOIN UsersGames ON
	UsersGames.UserId = Users.Id
	JOIN Games ON
	Games.Id = UsersGames.GameId
	WHERE Users.FirstName = 'Stamat'
	AND Games.Name = 'Safflower';

	DECLARE @itemsTotalCash INT = (SELECT SUM(Price) FROM Items WHERE MinLevel BETWEEN 11 AND 12)
	
	UPDATE UsersGames
	SET Cash -= @itemsTotalCash
	WHERE UsersGames.Id = @userGameId

	INSERT INTO UserGameItems (UserGameId, ItemId)
	SELECT 110, Id FROM Items WHERE MinLevel BETWEEN 11 AND 12
COMMIT TRAN [BuyItems1]
END TRY
BEGIN CATCH
  ROLLBACK TRANSACTION [BuyItems1]
END CATCH

BEGIN TRAN [BuyItems2]
BEGIN TRY
	DECLARE @itemsTotalCash2 INT = (SELECT SUM(Price) FROM Items WHERE MinLevel BETWEEN 19 AND 21)
	
	UPDATE UsersGames
	SET Cash -= @itemsTotalCash2
	WHERE UsersGames.Id = @userGameId

	INSERT INTO UserGameItems (UserGameId, ItemId)
	SELECT 110, Id FROM Items WHERE MinLevel BETWEEN 19 AND 21
COMMIT TRAN [BuyItems2]
END TRY
BEGIN CATCH
  ROLLBACK TRANSACTION [BuyItems2]
END CATCH

SELECT Items.Name [Item Name] 
FROM Items 
INNER JOIN UserGameItems ON Items.Id = UserGameItems.ItemId 
WHERE UserGameId = @userGameId 
ORDER BY [Item Name]
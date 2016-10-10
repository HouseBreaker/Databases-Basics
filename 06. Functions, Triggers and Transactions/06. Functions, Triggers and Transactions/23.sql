-- 23. Users in Games with Their Items
SELECT
	Username,
	Games.Name AS [Game],
	COUNT(Items.Id) AS [Items Count],
	SUM(Items.Price) AS [Items Price]
FROM Users
JOIN UsersGames ON
UsersGames.UserId = Users.Id
JOIN Games ON
Games.Id = UsersGames.GameId
JOIN UserGameItems ON
UserGameItems.UserGameId = UsersGames.Id
JOIN Items ON
Items.Id = UserGameItems.ItemId
GROUP BY Username, Games.Name
HAVING COUNT(Items.Id) >= 10
ORDER BY [Items Count] DESC, [Items Price] DESC, Username
-- 22. All Users in Games
SELECT
	Games.Name AS [Game],
	GameTypes.Name AS [Game Type],
	Username,
	Level,
	Cash,
	Characters.Name AS [Character]
FROM Users
JOIN UsersGames ON
UsersGames.UserId = Users.Id
JOIN Games ON
Games.Id = UsersGames.GameId
JOIN GameTypes ON
GameTypes.Id = Games.GameTypeId
JOIN Characters ON
Characters.Id = CharacterId
ORDER BY Level DESC, Username, Game
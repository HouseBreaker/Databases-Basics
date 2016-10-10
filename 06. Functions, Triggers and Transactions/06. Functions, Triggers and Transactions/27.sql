-- 27. Buy Items for User in Game
SELECT Users.Id, Users.Username, UsersGames.GameId, UsersGames.Id AS UserGameId, Cash
INTO UserInfo
FROM Users
JOIN UsersGames ON
UsersGames.UserId = Users.Id
JOIN Games ON
Games.Id = UsersGames.GameId
WHERE Username = 'Alex' AND Games.Name = 'Edinburgh'

SELECT Items.Id, Name, Price
INTO ItemsInfo
FROM Items
WHERE Name IN ('Blackguard', 'Bottomless Potion of Amplification', 'Eye of Etlich (Diablo III)', 'Gem of Efficacious Toxin', 'Golden Gorget of Leoric', 'Hellfire Amulet')

UPDATE UsersGames
SET Cash -= (SELECT SUM(Price) FROM ItemsInfo)
WHERE UsersGames.Id = (SELECT UserInfo.UserGameId FROM UserInfo)

INSERT INTO UserGameItems (UserGameId, ItemId)
SELECT (SELECT UserGameId FROM UserInfo), Id FROM ItemsInfo

DROP TABLE UserInfo
DROP TABLE ItemsInfo

SELECT Users.Username, Games.Name, UsersGames.Cash, Items.Name [Item Name] FROM UsersGames
JOIN Games on UsersGames.GameId = Games.Id
JOIN Users on UsersGames.UserId = Users.Id
JOIN UserGameItems on UserGameItems.UserGameId = UsersGames.Id
JOIN Items on Items.Id = UserGameItems.ItemId
WHERE Games.Name = 'Edinburgh'
ORDER BY Items.Name
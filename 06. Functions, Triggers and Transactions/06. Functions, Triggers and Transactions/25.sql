-- 25. All Items with Greater than Average Statistics
SELECT [Name], Price, MinLevel, Strength, Defence, Speed, Luck, Mind FROM Items
JOIN [Statistics] ON [Statistics].Id = Items.StatisticId
WHERE
Mind > (SELECT AVG(Mind) FROM Items JOIN [Statistics] ON StatisticId = Items.StatisticId) AND
Luck > (SELECT AVG(Luck) FROM Items JOIN [Statistics] ON StatisticId = Items.StatisticId) AND
Speed > (SELECT AVG(Speed) FROM Items JOIN [Statistics] ON StatisticId = Items.StatisticId)
ORDER BY Items.[Name]
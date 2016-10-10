-- 26. Display All Items about Forbidden Game Type
SELECT
	Items.Name AS Item,
	Price,
	MinLevel,
	GameTypes.Name AS [Forbidden Game Type]
FROM Items
LEFT JOIN GameTypeForbiddenItems ON
GameTypeForbiddenItems.ItemId = Items.Id
LEFT JOIN GameTypes ON
GameTypes.Id = GameTypeForbiddenItems.GameTypeId
ORDER BY GameTypes.Name DESC, Items.Name
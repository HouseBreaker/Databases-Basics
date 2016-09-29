-- 12. Games From 2011 and 2012 Year
-- Find the top 50 games ordered by start date, then by name of the game. Display only games from 2011 and 2012 year. Display start date in the format “YYYY-MM-DD”. Submit your query statements as Prepare DB & run queries.

SELECT TOP 50
	[Name] AS [Game],
	FORMAT([Start], 'yyyy-MM-dd')
FROM Games
WHERE YEAR([Start]) IN (2011, 2012)
ORDER BY [Start],
[Name]
-- 21. Number of Users for Email Provider

SELECT EmailProvider, COUNT(*) AS [Number Of Users] FROM
	(SELECT SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email)) AS EmailProvider, * FROM Users) AS EmailProviders
GROUP BY EmailProvider
ORDER BY COUNT(*) DESC, EmailProvider
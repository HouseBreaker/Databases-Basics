-- 03. Towns Starting With
-- Write a stored procedure usp_GetTownsStartingWith that accept string as parameter and returns all town names starting with that string. Submit your query statement as Run skeleton, run queries & check DB in Judge.

CREATE PROC usp_GetTownsStartingWith @prefix NVARCHAR(MAX)
AS
SELECT Name FROM Towns
WHERE Name LIKE @prefix + '%'
GO

EXEC usp_GetTownsStartingWith 'sea'
GO
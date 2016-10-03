-- 07.	Define Function
-- Define a function ufn_IsWordComprised(@setOfLetters, @word) that returns true or false depending on that if the word is a comprised of the given set of letters. Submit your query statement as Run skeleton, run queries & check DB in Judge.

DROP FUNCTION IF EXISTS dbo.ufn_IsWordComprised
GO

CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(MAX), @word VARCHAR(MAX))
RETURNS BIT
AS
BEGIN
	DECLARE @counter INT = 1
	WHILE (@counter < LEN(@word))
	BEGIN
		DECLARE @char VARCHAR = SUBSTRING(@word, @counter, 1);
		IF(CHARINDEX(@char, @setOfLetters, 1) = 0)
		BEGIN
			RETURN 0
		END
		SET @counter += 1
	END
RETURN 1
END
GO

SELECT [Name] FROM Towns
WHERE dbo.ufn_IsWordComprised('afiso', [Name]) = 1
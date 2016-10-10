-- 31. Count of Countries by Currency
SELECT
	cu.CurrencyCode,
	Description AS Currency,
	NumberOfCountries
FROM
	(SELECT cu.CurrencyCode, COUNT(c.CountryCode) AS NumberOfCountries FROM Currencies AS cu
	LEFT JOIN Countries AS c ON c.CurrencyCode = cu.CurrencyCode
	GROUP BY cu.CurrencyCode) AS CurrencyCount
JOIN Currencies cu ON cu.CurrencyCode = CurrencyCount.CurrencyCode
ORDER BY NumberOfCountries DESC, Currency
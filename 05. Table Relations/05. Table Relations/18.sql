-- 18. Continents and Currencies
SELECT
ContinentCode,
CurrencyCode, COUNT(*) AS CurrencyUsage
INTO ContinentCurrencyUsage
FROM Countries
GROUP BY ContinentCode, CurrencyCode
HAVING COUNT(*) > 1

SELECT
ContinentCode, 
MAX(CurrencyUsage) AS MaxUsage
INTO MaxCurrencyUsage
FROM ContinentCurrencyUsage
GROUP BY ContinentCode

SELECT ContinentCurrencyUsage.ContinentCode, CurrencyCode, CurrencyUsage FROM ContinentCurrencyUsage
LEFT JOIN MaxCurrencyUsage ON
ContinentCurrencyUsage.ContinentCode = MaxCurrencyUsage.ContinentCode
WHERE CurrencyUsage = MaxUsage
ORDER BY ContinentCurrencyUsage.ContinentCode

DROP TABLE ContinentCurrencyUsage
DROP TABLE MaxCurrencyUsage
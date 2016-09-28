-- 24. Countries and Currency (Euro / Not Euro)
-- Find all countries along with information about their currency. Display the country code, country name and information about its currency: either "Euro" or "Not Euro". Sort the results by country name alphabetically. Submit your query statements as Prepare DB & run queries.

SELECT CountryName, CountryCode, (CASE WHEN CurrencyCode='EUR' THEN 'Euro' ELSE 'Not Euro' END) AS Currency
FROM Countries
ORDER BY CountryName
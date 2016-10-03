-- 16.	Count Mountain Ranges
SELECT CountryCode, COUNT(*) FROM Mountains
JOIN MountainsCountries
ON Mountains.Id = MountainsCountries.MountainId
WHERE CountryCode IN ('US', 'RU', 'BG')
GROUP BY CountryCode
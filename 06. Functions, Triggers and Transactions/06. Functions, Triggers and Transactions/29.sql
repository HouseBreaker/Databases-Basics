-- 29.	Peaks with Their Mountain, Country and Continent
SELECT
	PeakName, MountainRange AS Mountain, CountryName, ContinentName
FROM Peaks p
JOIN Mountains m ON m.Id = p.MountainId
JOIN MountainsCountries mc ON mc.MountainId = m.Id
JOIN Countries c ON c.CountryCode = mc.CountryCode
JOIN Continents co ON co.ContinentCode = c.ContinentCode
ORDER BY PeakName, CountryName
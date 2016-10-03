-- 21. Highest Peak Name and Elevation by Country

SELECT TOP 5
CountryName AS Country,
ISNULL(Peaks.PeakName, '(no highest peak)') AS [Highest Peak Name],
ISNULL(HighestPeakElevation, 0) AS [Highest Peak Elevation],
CASE WHEN HighestPeakElevation IS NULL OR MountainRange IS NULL THEN '(no mountain)' ELSE MountainRange END AS Mountain
FROM Countries
LEFT JOIN
(
	SELECT mc.CountryCode, MAX(Elevation) AS HighestPeakElevation FROM MountainsCountries mc
	JOIN Countries c
	ON mc.CountryCode = c.CountryCode
	JOIN Peaks as p
	ON p.MountainId = mc.MountainId
	GROUP BY mc.CountryCode
)
AS HighestPeaksByCountry ON
HighestPeaksByCountry.CountryCode = Countries.CountryCode
LEFT JOIN MountainsCountries ON
Countries.CountryCode = MountainsCountries.CountryCode
LEFT JOIN Mountains ON
Mountains.Id = MountainsCountries.MountainId
LEFT JOIN Peaks ON
Peaks.MountainId = Mountains.Id
WHERE HighestPeakElevation = Elevation OR HighestPeakElevation IS NULL
AND Countries.CountryCode IS NOT NULL
ORDER BY CountryName,
PeakName
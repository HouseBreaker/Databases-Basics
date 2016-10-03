-- 20.	Highest Peak and Longest River by Country

SELECT TOP 5 CountryName, HighestPeakElevation, LongestRiverLength FROM Countries
LEFT OUTER JOIN
(SELECT mc.CountryCode, MAX(Elevation) AS HighestPeakElevation FROM MountainsCountries mc
JOIN Countries c
ON mc.CountryCode = c.CountryCode
JOIN Peaks as p
ON p.MountainId = mc.MountainId
GROUP BY mc.CountryCode) AS HighestPeaksByCountry ON
HighestPeaksByCountry.CountryCode = Countries.CountryCode
LEFT OUTER JOIN
(SELECT cr.CountryCode, MAX(Length) as LongestRiverLength FROM CountriesRivers cr
JOIN Countries c
ON c.CountryCode = cr.CountryCode
JOIN Rivers as r
ON r.Id = cr.RiverId
GROUP BY cr.CountryCode) AS LongestRiversByCountry ON
LongestRiversByCountry.CountryCode = Countries.CountryCode
ORDER BY HighestPeakElevation DESC,
LongestRiverLength DESC,
CountryName
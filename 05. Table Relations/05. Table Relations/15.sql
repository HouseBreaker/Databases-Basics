-- 15.	Highest peak in Bulgaria
SELECT CountryCode, MountainRange, PeakName, Elevation FROM Peaks as p
JOIN Mountains as m
ON p.MountainId = m.Id
JOIN MountainsCountries as mc
ON m.Id = mc.MountainId
WHERE mc.CountryCode = 'BG'
AND Elevation > 2835
ORDER BY Elevation DESC
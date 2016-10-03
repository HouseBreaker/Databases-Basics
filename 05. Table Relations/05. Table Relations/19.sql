-- 19. Countries Without any Mountains
SELECT COUNT(*) AS CountryCode FROM Countries
LEFT OUTER JOIN MountainsCountries
ON Countries.CountryCode = MountainsCountries.CountryCode
WHERE MountainsCountries.MountainId IS NULL
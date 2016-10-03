-- 17. Countries With or Without Rivers
SELECT TOP 5 CountryName, RiverName FROM Countries
LEFT OUTER JOIN CountriesRivers
ON Countries.CountryCode = CountriesRivers.CountryCode
LEFT OUTER JOIN Rivers
ON Rivers.Id = CountriesRivers.RiverId
WHERE ContinentCode = 'AF'
ORDER BY CountryName
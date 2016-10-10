-- 28.	Peaks and Mountains
SELECT PeakName, MountainRange AS Mountain, Elevation FROM Peaks p
JOIN Mountains m on m.Id = p.MountainId
ORDER BY Elevation DESC, PeakName
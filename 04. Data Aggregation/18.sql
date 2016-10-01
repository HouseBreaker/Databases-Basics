--	18. Salary Challenge
/* 
	Write a query that returns
	•	FirstName
	•	LastName
	•	DepartmentID
	for all employees who have salary higher than the average salary of their respective departments. Select only the first 10 rows. Order by DepartmentID. 
*/

SELECT TOP 10 e.FirstName, e.LastName, e.DepartmentID FROM Employees AS e
JOIN 
	(
		SELECT DepartmentId, AVG(Salary) AS AverageSalary
		FROM Employees
		GROUP BY DepartmentID
	) AS asbd
ON e.DepartmentID = asbd.DepartmentID
WHERE e.Salary > asbd.AverageSalary
ORDER BY e.DepartmentID
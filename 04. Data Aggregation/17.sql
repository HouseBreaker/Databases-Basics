-- 17. 3rd Highest Salary
-- Find the third highest salary in each department if there is such. 
SELECT DepartmentID, Salary,
DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS SalaryRank
INTO TempEmployeesSalaryRank
FROM Employees

SELECT DISTINCT DepartmentID, Salary FROM TempEmployeesSalaryRank
WHERE SalaryRank = 3

DROP TABLE TempEmployeesSalaryRank
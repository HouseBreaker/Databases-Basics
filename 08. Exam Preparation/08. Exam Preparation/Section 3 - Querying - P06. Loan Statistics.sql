SELECT SUM(Amount) AS TotalLoanAmount, MAX(Interest) AS MaxInterest, MIN(Salary) AS MinEmployeeSalary FROM Loans l
JOIN EmployeesLoans el ON el.LoanID = l.LoanID
JOIN Employees e ON e.EmployeeID = el.EmployeeID
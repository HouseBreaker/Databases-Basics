CREATE TRIGGER tr_NewEmployees ON Employees
AFTER INSERT
AS
BEGIN
	DECLARE @EmployeeID INT;
	DECLARE CR CURSOR FOR SELECT inserted.EmployeeID FROM inserted

	OPEN CR
		FETCH NEXT FROM CR INTO @EmployeeID
		WHILE @@FETCH_STATUS = 0
		BEGIN
			UPDATE EmployeesLoans
			SET EmployeeID = @EmployeeID
			WHERE EmployeeID = @EmployeeID - 1
			FETCH NEXT FROM CR INTO @EmployeeID
		END
	CLOSE CR
END
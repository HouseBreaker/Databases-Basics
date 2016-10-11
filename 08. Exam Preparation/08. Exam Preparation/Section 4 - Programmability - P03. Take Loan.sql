CREATE PROC usp_TakeLoan @CustomerID INT, @LoanAmount DECIMAL, @Interest DECIMAL(4,2), @StartDate DATE
AS
BEGIN TRAN	
	IF @LoanAmount NOT BETWEEN 0.01 AND 100000
	BEGIN
		ROLLBACK
		RAISERROR('Invalid Loan Amount.', 16, 1);
		RETURN
	END

	INSERT INTO Loans (CustomerID, Amount, Interest, StartDate) VALUES
	(@CustomerID, @LoanAmount, @Interest, @StartDate)
	COMMIT
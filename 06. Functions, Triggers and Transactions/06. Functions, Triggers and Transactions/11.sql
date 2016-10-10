-- 11. Future Value Function
-- Your task is to create a function ufn_CalculateFutureValue that accepts as parameters – sum, yearly interest rate and number of years. It should calculate and return the future value of the initial sum. Using the following formula:
-- FV = I * ((1 + R) ^ T)

CREATE FUNCTION ufn_CalculateFutureValue (@initial MONEY, @yearlyInterest FLOAT, @years FLOAT)
RETURNS MONEY
AS
BEGIN
	RETURN @initial * POWER((1 + @yearlyInterest), @years)
END
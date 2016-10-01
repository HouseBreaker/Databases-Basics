-- 12. Rich Wizard, Poor Wizard
-- Mr. Bodrog definitely likes his werewolves more than you. This is your last chance to survive! Give him some data to play his favorite game Rich Wizard, Poor Wizard. The rules are simple: You compare the deposits of every wizard with the wizard after him. If a wizard is the last one in the database, simply ignore it. At the end you have to sum the difference between the deposits.


SELECT SUM(HostDeposit-GuestDeposit) AS SumDifference FROM
	(SELECT
		FirstName AS HostWizard,
		DepositAmount AS HostDeposit,
		LEAD(FirstName) OVER (ORDER BY ID) AS GuestWizard,
		LEAD(DepositAmount) OVER (ORDER BY ID) AS GuestDeposit
	FROM WizzardDeposits) AS AdjacentDeposits
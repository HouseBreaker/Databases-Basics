-- 10. First Letter

SELECT DISTINCT LEFT(FirstName, 1) FROM WizzardDeposits
WHERE DepositGroup = 'Troll Chest'
ORDER BY LEFT(FirstName, 1)
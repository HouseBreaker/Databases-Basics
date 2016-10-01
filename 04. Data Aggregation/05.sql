-- 05. Deposits Sum
-- Select all deposit groups and its total deposit sum.

SELECT DepositGroup, SUM(DepositAmount)
FROM WizzardDeposits
GROUP BY DepositGroup
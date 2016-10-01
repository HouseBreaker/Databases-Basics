-- 04. Smallest Deposit Group per Magic Wand Size
-- Select the deposit group with the lowest average wand size

SELECT DepositGroup FROM
	(SELECT DepositGroup, AVG(MagicWandSize) AverageMagicWandSize
	FROM WizzardDeposits
	GROUP BY DepositGroup) AverageMagicWandSizeByDepositGroup
WHERE AverageMagicWandSize = 
	(SELECT MIN(AverageMagicWandSize) FROM 
		(SELECT 
			DepositGroup,
			AVG(MagicWandSize) AverageMagicWandSize
		FROM WizzardDeposits
	GROUP BY DepositGroup) AverageMagicWandSizeByDepositGroup)
-- 
USE SoftUni
SELECT EmployeeID
	,COUNT([ProjectID]) AS Project
	FROM EmployeesProjects
	GROUP BY EmployeeID
	ORDER BY Project ASC


--01. Records’ Count
USE Gringotts
SELECT COUNT(*) AS [Count]
FROM WizzardDeposits 


--02. Longest Magic Wand
USE Gringotts
SELECT MAX(MagicWandSize) AS [LongestMagicWand]
FROM WizzardDeposits

--03. Longest Magic Wand per Deposit Groups
USE Gringotts
SELECT 
	DepositGroup,
	MAX(wd.MagicWandSize) AS [LongestMagicWand]
FROM  WizzardDeposits AS wd
GROUP BY wd.DepositGroup

--04*. Smallest Deposit Group per Magic Wand Size
USE Gringotts
SELECT 
	AVG(MagicWandSize) AS AverageWandSize,
	DepositGroup
INTO AverageWandSizeResult
FROM WizzardDeposits
GROUP BY DepositGroup

SELECT DepositGroup
FROM WizzardDeposits
GROUP BY DepositGroup
HAVING AVG(MagicWandSize) =  (SELECT MIN(AverageWandSize) FROM AverageWandSizeResult)

DROP TABLE AverageWandSizeResult
		

--05. Deposits Sum
SELECT DepositGroup,
		SUM(DepositAmount) AS TotalSum
FROM WizzardDeposits
GROUP BY DepositGroup
--ORDER BY TotalSum DESC

--06. Deposits Sum for Ollivander Family
SELECT DepositGroup,
		SUM(DepositAmount) AS TotalSum
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander Family'
GROUP BY DepositGroup

--07. Deposits Filter
SELECT DepositGroup,
		SUM(DepositAmount) AS TotalSum
FROM WizzardDeposits
WHERE MagicWandCreator = 'Ollivander Family'
GROUP BY DepositGroup
HAVING SUM(DepositAmount) < 150000
ORDER BY TotalSum DESC

--08. Deposit Charge
SELECT DepositGroup,
		MagicWandCreator,
		MIN(DepositCharge) AS MinDepositCharge
FROM WizzardDeposits
GROUP BY DepositGroup, MagicWandCreator

--09. Age Groups
SELECT 
	CASE 
		WHEN Age BETWEEN 0 AND 10 THEN '[0-10]'
		WHEN AGE BETWEEN 11 AND 20 THEN '[11-20]'
		WHEN AGE BETWEEN 21 AND 30 THEN '[21-30]'
		WHEN AGE BETWEEN 31 AND 40 THEN '[31-40]'
		WHEN AGE BETWEEN 41 AND 50 THEN '[41-50]'
		WHEN AGE BETWEEN 51 AND 60 THEN '[51-60]'
		ELSE '[61+]'
		END AS AgeGroup,
		COUNT(Age) AS WizardCount
FROM WizzardDeposits
GROUP BY (
CASE 
		WHEN Age BETWEEN 0 AND 10 THEN '[0-10]'
		WHEN AGE BETWEEN 11 AND 20 THEN '[11-20]'
		WHEN AGE BETWEEN 21 AND 30 THEN '[21-30]'
		WHEN AGE BETWEEN 31 AND 40 THEN '[31-40]'
		WHEN AGE BETWEEN 41 AND 50 THEN '[41-50]'
		WHEN AGE BETWEEN 51 AND 60 THEN '[51-60]'
		ELSE '[61+]'
		END
)

--10. First Letter
SELECT SUBSTRING(FirstName, 1,1) AS FirstLetter
FROM WizzardDeposits
WHERE WizzardDeposits.DepositGroup = 'Troll Chest'
GROUP BY SUBSTRING(FirstName, 1,1)
ORDER BY FirstLetter
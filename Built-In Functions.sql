--01 
SELECT 
	FirstName, LastName 
	FROM [SoftUni].[dbo].Employees
WHERE FirstName LIKE 'SA%';


--02
SELECT 
	FirstName, LastName
	FROM [SoftUni].[dbo].Employees
WHERE LastName LIKE '%ei%'


--03
SELECT 
	FirstName 
	FROM [SoftUni].[dbo].Employees
AS e
WHERE (e.DepartmentID = 3 OR e.DepartmentID =10)
AND (YEAR(e.HireDate) BETWEEN '1995' AND '2005')

--04
SELECT 
	FirstName, LastName 
	FROM [SoftUni].[dbo].Employees AS e 
WHERE e.JobTitle NOT LIKE '%engineer%'

--05
SELECT 
	[Name] 
	FROM [SoftUni].[dbo].Towns 
WHERE LEN([Name]) = 5 OR LEN([Name]) = 6
ORDER BY [Name] 

--06 
SELECT 
	TownId, [Name] 
	FROM [SoftUni].[dbo].Towns
WHERE [Name] LIKE '[MKBE]%'
ORDER BY [Name]

--07
SELECT 
	TownId, [Name] 
	FROM [SoftUni].[dbo].Towns
WHERE [Name] NOT LIKE '[RBD]%'
ORDER BY [Name]

--08 
CREATE VIEW EmployeesHiredAfter2000 AS
SELECT 
	FirstName, LastName 
	FROM [SoftUni].[dbo].Employees
WHERE YEAR(HireDate) > '2000'

--09
SELECT 
	FirstName, LastName 
	FROM [SoftUni].[dbo].Employees
WHERE LEN(LastName) = '5'


--10
SELECT 
	CountryName, IsoCode 
	FROM [Geography].[dbo].Countries
WHERE LEN(CountryName) - LEN(REPLACE(CountryName, 'a', '')) >= 3
ORDER BY IsoCode

--11
SELECT 
	PeakName, 
	RiverName,
	LOWER(PeakName + RIGHT(RiverName, LEN(RiverName) -1)) AS Mix
	 FROM [Geography].[dbo].Rivers,[Geography].[dbo].Peaks
WHERE RIGHT(PeakName, 1) = LEFT(RiverName, 1)
ORDER BY Mix

--12 
SELECT 
	TOP 50 [Name], 
	FORMAT([Start], 'yyyy-MM-dd') AS [Start]
	FROM [Diablo].[dbo].Games
WHERE YEAR(Games.Start) = '2011'
OR YEAR(Games.Start) = '2012'
ORDER BY Games.Start ASC, [Name] ASC

--13
SELECT 
	Username, 
	SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email)) AS [Email Provider]
	FROM [Diablo].[dbo].Users
ORDER BY [Email Provider], Username

--14
USE Diablo
SELECT
	Username, 
	IpAddress AS [IP Address] 
	FROM Users
	WHERE IpAddress LIKE '___.1%.%.___'	
ORDER BY Username

--15
USE Diablo
SELECT g.[Name],
			"Part of the Day" =
			CASE   
         WHEN DATEPART(HOUR, g.[Start]) BETWEEN 0 AND 11 THEN 'Morning'  
         WHEN DATEPART(HOUR, g.[Start]) BETWEEN 12 AND 17 THEN 'Afternoon'    
         WHEN DATEPART(HOUR, g.[Start]) BETWEEN 18 AND 23 THEN 'Evening'
		END,
		[Duration] =
		CASE   
         WHEN g.[Duration] <= 3 THEN 'Extra Short'  
         WHEN g.[Duration] BETWEEN 4 AND 6 THEN 'Short'  
         WHEN g.[Duration] > 6 THEN 'Long'
		 WHEN g.[Duration] IS NULL THEN 'Extra Long'
		END
FROM Games AS g
ORDER BY g.[Name], Duration, [Part of the Day]
--01 
SELECT FirstName, LastName 
FROM [SoftUni].[dbo].Employees
WHERE FirstName LIKE 'SA%';


--02
SELECT FirstName, LastName
FROM [SoftUni].[dbo].Employees
WHERE LastName LIKE '%ei%'


--03
SELECT FirstName FROM [SoftUni].[dbo].Employees
AS e
WHERE (e.DepartmentID = 3 OR e.DepartmentID =10)
AND (YEAR(e.HireDate) BETWEEN '1995' AND '2005')

--04
SELECT FirstName, LastName FROM [SoftUni].[dbo].Employees AS e 
WHERE e.JobTitle NOT LIKE '%engineer%'

--05
SELECT [Name] FROM [SoftUni].[dbo].Towns 
WHERE LEN([Name]) = 5 OR LEN([Name]) = 6
ORDER BY [Name] 

--06 
SELECT TownId, [Name] FROM [SoftUni].[dbo].Towns
WHERE [Name] LIKE '[MKBE]%'
ORDER BY [Name]

--07
SELECT TownId, [Name] FROM [SoftUni].[dbo].Towns
WHERE [Name] NOT LIKE '[RBD]%'
ORDER BY [Name]

--08 
CREATE VIEW EmployeesHiredAfter2000 AS
SELECT FirstName, LastName FROM [SoftUni].[dbo].Employees
WHERE YEAR(HireDate) > '2000'

--09
SELECT FirstName, LastName FROM [SoftUni].[dbo].Employees
WHERE LEN(LastName) = '5'


--10
SELECT CountryName, IsoCode FROM [Geography].[dbo].Countries
WHERE LEN(CountryName) - LEN(REPLACE(CountryName, 'a', '')) >= 3
ORDER BY IsoCode
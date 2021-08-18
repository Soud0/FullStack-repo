USE AdventureWorks2019
GO
--1
SELECT ProductID,Name,Color,ListPrice
FROM Production.Product
--2
SELECT ProductID,Name,Color,ListPrice
FROM Production.Product
WHERE ListPrice <> 0.00

--3
SELECT ProductID,Name,Color,ListPrice
FROM Production.Product
WHERE Color IS NULL

--4
SELECT ProductID,Name,Color,ListPrice
FROM Production.Product
WHERE Color IS NOT NULL

--5
SELECT ProductID,Name,Color,ListPrice
FROM Production.Product
WHERE Color IS NOT NULL AND ListPrice >0.00

--6
SELECT pp.Name,pp.Color
FROM Production.Product AS pp
WHERE Color IS NOT NULL

--7
SELECT 'NAME:'+ Name +' -- '+ 'COLOR:'+ Color AS [Name And Color]
FROM Production.Product 
WHERE Color IS NOT NULL

--8
SELECT Productid, Name
FROM Production.Product
WHERE ProductID BETWEEN 400 AND 500

--9
SELECT Productid, Name, Color
FROM Production.Product
WHERE Color IN ('black','blue') 

--10
SELECT *
FROM Production.Product
WHERE Name LIKE 'S%'

--11
SELECT Name,ListPrice
FROM Production.Product
WHERE Name LIKE 'S%' ORDER BY Name

--12
SELECT Name,ListPrice
FROM Production.Product p
WHERE p.Name LIKE 'a%' or p.Name Like 's%'
ORDER BY Name

--13
SELECT *
FROM Production.Product p
WHERE p.Name LIKE 'spo[^k]%'
ORDER BY Name

--14
SELECT distinct Color
FROM Production.Product 
ORDER by Color DESC

--15
SELECT distinct ProductSubcategoryID, Color
FROM Production.Product p 
WHERE p.Color is not NULL and p.ProductSubcategoryID is not NULL
ORDER by 1,2

--16
SELECT ProductSubCategoryID
      , LEFT([Name],35) AS [Name]
      , Color, ListPrice 
FROM Production.Product
WHERE NOT ProductSubCategoryID = 1 AND Color IN ('Red','Black') 
      or ListPrice BETWEEN 1000 AND 2000 
      
ORDER BY ProductID


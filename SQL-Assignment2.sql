USE AdventureWorks2019
GO
--Answer following questions

--1.	What is a result set?
-- A result set is the output of a query.

--2.	What is the difference between Union and Union All?
-- Union only combins distinct value, Union All combins all values

--3.	What are the other Set Operators SQL Server has? 
-- UNION, UNION ALL, INTERSECT, EXCEPT

--4.	What is the difference between Union and Join?
-- Join is used to combine columns from different tables, the union is used to combine rows.

--5.	What is the difference between INNER JOIN and FULL JOIN?
-- Inner join returns only the matching rows between both the tables, non-matching rows are eliminated. 
-- Full Join or Full Outer Join returns all rows from both the tables (left & right tables), including non-matching rows from both the tables

--6.	What is difference between left join and outer join
-- Left join returns all records from the left table,even if there are no matches in the right table
-- Outer join returns all the rows from the left table and all the rows from the right table 

--7.	What is cross join?
-- It combines each row from the first table with each row from the second table

--8.	What is the difference between WHERE clause and HAVING clause?
-- WHERE Clause is used to filter the records from the table based on the specified condition. 
-- HAVING Clause is used to filter record from the groups based on the specified condition

--9.	Can there be multiple group by columns?
-- A GROUP BY clause can contain two or more columns


--Write queries for following scenarios
--1.
SELECT COUNT(Name) AS [Total Number]
FROM Production.Product

--2.
SELECT p.ProductSubcategoryID
FROM Production.Product p INNER JOIN Production.ProductCategory c ON p.ProductSubcategoryID = c.ProductCategoryID
WHERE p.ProductSubcategoryID IS NOT NULL

--3
SELECT p.ProductSubcategoryID,COUNT(p.ProductSubcategoryID) AS CountedProducts
FROM Production.Product p INNER JOIN Production.ProductCategory c on p.ProductSubcategoryID = c.ProductCategoryID
WHERE p.ProductSubcategoryID IS NOT NULL
GROUP BY p.ProductSubcategoryID

--4
SELECT COUNT(p.ProductSubcategoryID) AS [Total Number]
FROM Production.Product p inner join Production.ProductCategory c ON p.ProductSubcategoryID IS NULL

--5
SELECT SUM(Quantity) as TheSum
FROM Production.ProductInventory


--6

SELECT ProductID, SUM(Quantity) as TheSum
FROM Production.ProductInventory 
WHERE LocationID = '40' AND Quantity <100
GROUP BY ProductID


--7
SELECT p.Shelf, p.ProductID, SUM(p.Quantity) as TheSum
FROM Production.ProductInventory p
WHERE p.LocationID = '40' AND p.Quantity <100
GROUP BY p.Shelf,p.ProductID

--8
SELECT  p.ProductID, AVG(p.Quantity) as TheAvg
FROM Production.ProductInventory p
WHERE p.LocationID = '10' 
GROUP BY p.ProductID

--9
SELECT  p.ProductID,p.Shelf,AVG(p.Quantity) as TheAvg
FROM Production.ProductInventory p
GROUP BY p.ProductID,p.Shelf

--10
SELECT  p.ProductID,p.Shelf,AVG(p.Quantity) as TheAvg
FROM Production.ProductInventory p
WHERE p.Shelf<> 'N/A'
GROUP BY p.ProductID,p.Shelf

--11
SELECT Color, Class, COUNT(*) as TheCount,AVG(ListPrice) as AvgPrice
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color,Class

--12
SELECT c.Name as Country, s.Name as Province
FROM person.CountryRegion c INNER JOIN Person.StateProvince s on c.CountryRegionCode = s.CountryRegionCode

--13
SELECT c.Name as Country, s.Name as Province
FROM person.CountryRegion c INNER JOIN Person.StateProvince s on c.CountryRegionCode = s.CountryRegionCode
WHERE c.Name IN('Germany','Canada')

--14
USE Northwind
GO 

SELECT * 
FROM Products CROSS JOIN Orders
WHERE YEAR(GETDATE())-YEAR(OrderDate)<=25

--15
SELECT TOP 5 ShipPostalCode
FROM Orders 
WHERE ShipPostalCode IS NOT NULL 
GROUP BY ShipPostalCode

--16
SELECT TOP 5 ShipPostalCode
FROM Orders 
WHERE ShipPostalCode IS NOT NULL AND YEAR(GETDATE())-YEAR(OrderDate)<=25
GROUP BY ShipPostalCode

--17
SELECT city, COUNT(*)AS TOTAL
FROM Customers
GROUP BY CITY

--18
SELECT city, COUNT(*) AS TOTAL
FROM Customers o
GROUP BY City
HAVING COUNT(*)> = 2

--19
SELECT c.ContactName, o.OrderDate
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >'1998-1-1'


--20
SELECT c.ContactName 
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
where (GETDATE()-o.OrderDate)

--21
SELECT c.ContactName, COUNT(OrderID) AS count
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.ContactName

--22
SELECT c.CustomerID, COUNT(o.OrderID) AS count
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
having COUNT(o.OrderID)>100

--23
select 
from Suppliers s join
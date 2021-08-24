/*
1.	What is View? What are the benefits of using views?
	View is a virtual table whose contents are defined by a query.
	Views can represent a subset of the data contained in a table. 
	Views can join and simplify multiple tables into a single virtual table.
	Views can act as aggregated tables, where the database engine aggregates data (sum, average, etc.) and presents the calculated results as part of the data.
	Views can hide the complexity of data.
	Views take very little space to store.
	Depending on the SQL engine used, views can provide extra security.

2.	Can data be modified through views?
	NO

3.	What is stored procedure and what are the benefits of using it?
	Store procedure groups one or more transact-sql statements into a logical unit,
	stored as an object in a sql serev database.

	benefits: Increase databse security.
			  Faster excution.
			  stored procedures help centralize your transact-sql code in the data tier. 

4.	What is the difference between view and stored procedure?
	

5.	What is the difference between stored procedure and functions?

6.	Can stored procedure return multiple result sets?
	YES

7.	Can stored procedure be executed as part of SELECT Statement? Why?
	YES.

8.	What is Trigger? What types of Triggers are there?
	Triggers are a special type of stored procedure that get executed (fired) when a specific event happens.
	insert, delete, update
9.	What are the scenarios to use Triggers?
	Enforce Integrity beyond simple Referential Integrity
	Implement business rules
	Maintain audit record of changes
	Accomplish cascading updates and deletes

10.	What is the difference between Trigger and Stored Procedure?
	trigger will be executed, sp won't

*/
use Northwind
go

--1. Lock tables Region, Territories, EmployeeTerritories and Employees. Insert following information into the database. In case of an error, no changes should be made to DB.
--a.	A new region called ¡°Middle Earth¡±;
begin tran
select * from Region
insert into Region(RegionID,RegionDescription) values (5,'Middle Earth')
commit

--b.	A new territory called ¡°Gondor¡±, belongs to region ¡°Middle Earth¡±;

begin tran
insert into Territories(TerritoryID,TerritoryDescription,RegionID) values (90314,'Gondor',5)
select * from Territories
commit

--c.	A new employee ¡°Aragorn King¡± who's territory is ¡°Gondor¡±.

begin tran
insert into Employees(EmployeeID,LastName,FirstName)values (10,'King','Aragorn')  
select * from Employees
commit

--2.	Change territory ¡°Gondor¡± to ¡°Arnor¡±.
begin tran
update Territories set TerritoryDescription = 'Arnor'
where TerritoryDescription = 'gondor'
select * from Territories
commit

--3.	Delete Region ¡°Middle Earth¡±. (tip: remove referenced data first) (Caution: do not forget WHERE or you will delete everything.) In case of an error, no changes should be made to DB. Unlock the tables mentioned in question 1.

begin tran
delete from Territories where RegionID = 5 
delete from Region where RegionID = 5 
select * from Region 
commit

--4.	Create a view named ¡°view_product_order_[your_last_name]¡±, list all products and total ordered quantity for that product.

create view view_products_order_du as
select distinct p.ProductName,count(od.Quantity) as total
from Products p,[Order Details] od
group by p.ProductName
select * from view_products_order_du

--5.	Create a stored procedure ¡°sp_product_order_quantity_[your_last_name]¡± that accept product id as an input and total quantities of order as output parameter.
create proc sp_product_order_quantity_du 
@productid int,
@totalqua int output
as
select ProductID
from [Order Details]
where ProductID = @productid

select Quantity 
from [Order Details]
where Quantity = @totalqua

go

--6.	Create a stored procedure ¡°sp_product_order_city_[your_last_name]¡± that accept product name as an input and top 5 cities that ordered most that product combined with the total quantity of that product ordered from that city as output.

create sp_product_order_city_du 
@pdname varchar(50),
@cityname varchar(50) output
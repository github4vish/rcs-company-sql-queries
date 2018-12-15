-------- w3 schools basic Queries---------------
	select * from Customers

	select * from Categories

	select * from Employee

	select * from OrderDetails

	select * from Orders

	select * from Products

	select * from Shippers

	select * from Suppliers


	 SELECT DISTINCT City FROM Customers; 

	 SELECT * FROM Customers
WHERE Country='Mexico';


SELECT TOP 2 * FROM Customers; 

SELECT * FROM Customers
WHERE City LIKE 's%';

-------------------------------------------------
--joins-----

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID=Customers.CustomerID;



SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders
ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName; 



SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City; 

SELECT *
INTO CustomersBackup2016
FROM Customers;


SELECT *
INTO CustomersBackup2013
FROM Customers
WHERE Country='Germany';

SELECT Customers.CustomerName, Orders.OrderID
INTO CustomersOrderBackup2014
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID=Orders.CustomerID;

select * from CustomersOrderBackup2014


SELECT *
INTO EmployeesBackup2016
FROM Employees
WHERE 1=0;

select * from EmployeesBackup2016

INSERT INTO Customers (CustomerName, Country)
SELECT SupplierName, Country FROM Suppliers; 


INSERT INTO Customers (CustomerName, Country)
SELECT SupplierName, Country FROM Suppliers
WHERE Country='Germany'; 

---------create db--------------

CREATE DATABASE dbname;

CREATE DATABASE my_db;

CREATE TABLE Persons
(
P_Id int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255),
Address varchar(255),
City varchar(255),
CONSTRAINT pk_PersonID PRIMARY KEY (P_Id,LastName)
)

ALTER TABLE Persons
DROP CONSTRAINT pk_PersonID

ALTER TABLE Persons
ADD CONSTRAINT pk_PersonID PRIMARY KEY (P_Id) 

drop table Orders



CREATE TABLE Orders
(
O_Id int NOT NULL,
OrderNo int NOT NULL,
P_Id int,
PRIMARY KEY (O_Id),
CONSTRAINT fk_PerOrders FOREIGN KEY (P_Id)
REFERENCES Persons(P_Id)
)




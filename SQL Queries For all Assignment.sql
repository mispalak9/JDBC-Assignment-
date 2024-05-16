create database Employee;
use Employee;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(50),
    city VARCHAR(50),
    region VARCHAR(50),
    TitleOfCourtesy VARCHAR(50),
    birthdate DATE
);
drop table employees;
INSERT INTO employees (id, first_name, last_name, job_title, city, region, TitleOfCourtesy, birthdate)
VALUES 
(1, 'John', 'Doe', 'Sales Representative', 'London', 'WA', 'Mr.', '1955-01-01'),
(2, 'Jane', 'Doe', 'Sales Manager', 'London', 'WA', 'Mrs.', '1956-01-01'),
(3, 'Sam', 'Smith', 'Sales Representative', 'New York', 'NY', 'Mr.', '1957-01-01'),
(4, 'Sara', 'Johnson', 'Sales Manager', 'New York', 'NY', 'Ms.', '1958-01-01');

select * from employees;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    unit_price DECIMAL(10, 2),
    discontinued BOOLEAN
);
INSERT INTO products (product_id, product_name, unit_price, discontinued) 
VALUES 
(1, 'Product 1', 10.99, FALSE),
(2, 'Product 2', 20.99, FALSE),
(3, 'Product 3', 30.99, TRUE),
(4, 'Product 4', 40.99, FALSE);

select * from products;

SELECT product_id, product_name, unit_price FROM products;

SELECT product_id AS id, product_name AS name, unit_price AS price FROM products;

SELECT * FROM employees WHERE region = 'WA';

SELECT * FROM products WHERE discontinued IS FALSE;

SELECT * FROM employees WHERE city <> 'London';

SELECT * FROM employees WHERE city != 'London';

SELECT * FROM employees WHERE job_title IN ('Sales Representative', 'Sales Manager');

SELECT * FROM employees WHERE job_title IN ('Sales Representative', 'Sales Manager') AND city = 'London';

SELECT * FROM employees WHERE TitleOfCourtesy NOT LIKE 'Mr.';

SELECT * FROM employees WHERE first_name LIKE 'S%';

SELECT * FROM employees WHERE first_name LIKE '_a%';

SELECT * FROM employees WHERE YEAR(birthdate) BETWEEN 1953 AND 1958;

SELECT * FROM employees WHERE job_title IN ('Sales Representative', 'Sales Manager');

SELECT last_name, first_name,
CASE 
    WHEN TitleOfCourtesy IN ('Ms.', 'Mrs.') THEN 'Female'
    WHEN TitleOfCourtesy IN ('Dr.', 'Mr.') THEN 'Male'
END AS Gender
FROM Employees;


use northwind;
-- Create employee table
CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    title VARCHAR(50),
    department VARCHAR(50)
);

-- Insert data into employee table
INSERT INTO employee VALUES (1, 'Riya', 'Khan', 'Sales Representative', 'Sales');
INSERT INTO employee VALUES (2, 'Mia', 'Singh', 'Sales Manager', 'Sales');
INSERT INTO employee VALUES (3, 'Sara', 'Sharma', 'Developer', 'IT');
INSERT INTO employee VALUES (4, 'Maya', 'Mishra', 'Developer', 'IT');

set @start_time = CURRENT_TIMESTAMP;

-- Place your query here
SELECT * FROM employees;

set @end_time = CURRENT_TIMESTAMP; 
select TIMESTAMPDIFF(MICROSECOND, @start_time, @end_time);

select * from employee;

-- Create product table
CREATE TABLE product (
    id INT PRIMARY KEY,
    product_name VARCHAR(50),
    unit_price DECIMAL(10, 2),
    units_in_stock INT
);

-- Insert data into products table
INSERT INTO product VALUES (1, 'Product 1', 10.00, 100);
INSERT INTO product VALUES (2, 'Product 2', 20.00, 200);
INSERT INTO product VALUES (3, 'Product 3', 30.00, 300);
INSERT INTO product VALUES (4, 'Product 4', 40.00, 400);

set @start_time = CURRENT_TIMESTAMP;

-- Place your query here
SELECT * FROM product;

set @end_time = CURRENT_TIMESTAMP; 
select TIMESTAMPDIFF(MICROSECOND, @start_time, @end_time);

select * from product;

-- Create orders table
CREATE TABLE orders (
    id INT PRIMARY KEY,
    freight DECIMAL(10, 2),
    order_date DATE,
    ShipCountry VARCHAR(50)
);

-- Insert data into orders table
INSERT INTO orders VALUES (1, 10.00, '1996-07-04', 'USA');
INSERT INTO orders VALUES (2, 20.00, '1996-07-05', 'USA');
INSERT INTO orders VALUES (3, 30.00, '1996-07-06', 'USA');
INSERT INTO orders VALUES (4, 40.00, '1996-07-07', 'USA');

set @start_time = CURRENT_TIMESTAMP;

-- Place your query here
SELECT * FROM orders;

set @end_time = CURRENT_TIMESTAMP; 
select TIMESTAMPDIFF(MICROSECOND, @start_time, @end_time);

select * from orders;

-- Assignment 1
SELECT * FROM employee ORDER BY first_name;

-- Assignment 2
SELECT * FROM employee ORDER BY first_name, last_name;

-- Assignment 3
SELECT product_name, unit_price FROM product ORDER BY unit_price DESC;

-- Assignment 4
SELECT product_name, unit_price, unit_price * 1.2 AS increased_price
FROM product
WHERE unit_price * 0.2 > 30
ORDER BY increased_price DESC;

-- Assignment 5
SELECT COUNT(*) FROM employee WHERE title = 'Sales Representative';

-- Assignment 6
SELECT COUNT(*) FROM employee;

-- Assignment 7
SELECT DISTINCT title FROM employee;

-- Assignment 8
SELECT COUNT(DISTINCT title) FROM employee;

-- Assignment 9
SELECT product_name, MAX(unit_price) AS max_price FROM product GROUP BY product_name ORDER BY max_price DESC LIMIT 1;

-- Assignment 10
SELECT product_name, MIN(units_in_stock) AS min_stock FROM product GROUP BY product_name ORDER BY min_stock ASC LIMIT 1;

-- Assignment 11
SELECT AVG(freight) FROM orders WHERE ShipCountry = 'USA';

-- Assignment 12
SELECT SUM(freight) FROM orders WHERE MONTH(order_date) = 7 AND YEAR(order_date) = 1996;


DROP TABLE Employees;
DROP TABLE orders;
DROP DATABASE Employee;


use northwind;

CREATE TABLE Employees (
    EmployeeID INT,
    FirstName VARCHAR(50)
);

-- Insert values into Employees table
INSERT INTO Employees (EmployeeID, FirstName) VALUES
(1, 'Nancy'),
(2, 'Andrew'),
(3, 'Janet'),
(4, 'Margaret'),
(5, 'Steven'),
(6, 'Michael'),
(7, 'Robert'),
(8, 'Laura'),
(9, 'Anne');

select * from employees;

CREATE TABLE Orders (
    OrderID INT,
    EmployeeID INT,
    NumberOfOrders INT
);

-- Insert values into Orders table
INSERT INTO Orders (OrderID, EmployeeID, NumberOfOrders) VALUES
(101, 1, 123),
(102, 2, 96),
(103, 3, 127),
(104, 4, 156),
(105, 5, 42),
(106, 6, 67),
(107, 7, 72),
(108, 8, 104),
(109, 9, 43);

SELECT Employees.EmployeeID, Employees.FirstName, Orders.NumberOfOrders
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;


USE northwind;

CREATE TABLE Customers (
    CustomerID VARCHAR(5) PRIMARY KEY,
    CompanyName VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CompanyName, City)
VALUES ('ALFKI', 'Alfreds Futterkiste', 'Berlin');

CREATE TABLE Shippers (
    ShipperID INT PRIMARY KEY,
    CompanyName VARCHAR(100)
);

INSERT INTO Shippers (ShipperID, CompanyName)
VALUES (1, 'Speedy Express');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(5),
    EmployeeID INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia INT,
    Freight DECIMAL(10, 2),
    ShipName VARCHAR(100),
    ShipAddress VARCHAR(100),
    ShipCity VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShipVia) REFERENCES Shippers(ShipperID)
);

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity)
VALUES (10643, 'ALFKI', 6, '25/08/1997', '22/09/1997', '02/09/1997', 1, 29.46, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin'),
       (10702, 'ALFKI', 4, '13/10/1997', '24/11/1997', '21/10/1997', 1, 23.94, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin'),
       (10952, 'ALFKI', 1, '16/03/1998', '27/04/1998', '24/03/1998', 1, 40.42, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin'),
       (11011, 'ALFKI', 3, '09/04/1998', '07/05/1998', '13/04/1998', 1, 1.21, 'Alfreds Futterkiste', 'Obere Str. 57', 'Berlin');

SELECT 
    O.OrderID,
    O.CustomerID,
    O.EmployeeID,
    O.OrderDate, 
    O.RequiredDate, 
    O.ShippedDate, 
    O.ShipVia, 
    O.Freight, 
    O.ShipName, 
    O.ShipAddress, 
    O.ShipCity
FROM 
    Orders O
INNER JOIN 
    Customers C ON O.CustomerID = C.CustomerID
INNER JOIN 
    Shippers S ON O.ShipVia = S.ShipperID
WHERE 
    S.CompanyName = 'Speedy Express' AND C.City = 'Berlin';
    


CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO Suppliers (SupplierID, SupplierName) VALUES
(1, 'P&G'),
(2, 'Nord-Ost-Fisch Handelsgesellschaft'),
(3, 'Refrescos Americanas LTDA'),
(4, 'Escargots Nouveaux'),
(5, 'Cooperativa de Quesos Las Cabras'),
(6, 'Aux joyeux ecclesiastiques'),
(7, 'Forets d\'erables'),
(8, 'Gai paturage'),
(9, 'Lyngbysild'),
(10, 'Ma Maison'),
(11, 'Zaanse Snoepfabriek'),
(12, 'New England Seafood Cannery'),
(13, 'Pasta Buttini s.r.l.'),
(14, 'PB Knackebrod AB'),
(15, 'Norske Meierier'),
(16, 'Tokyo Traders'),
(17, 'Svensk Sjofoda AB'),
(18, 'Mayumi\'s'),
(19, 'Leka Trading'),
(20, 'G\'day, Mate'),
(21, 'Grandma Kelly\'s Homestead'),
(22, 'Heli Suswaren GmbH & Co. KG'),
(23, 'Karkki Oy'),
(24, 'Formaggi Fortini s.r.l.'),
(25, 'Exotic Liquids'),
(26, 'Bigfoot Breweries'),
(27, 'Specialty Biscuits, Ltd.'),
(28, 'New Orleans Cajun Delights Pavlova, Ltd.'),
(29, 'Plutzer Lebensmittelgrosmarkte AG');

INSERT INTO Products (ProductID, SupplierID) VALUES
(1, 2), -- Nord-Ost-Fisch Handelsgesellschaft has 1 product
(2, 3), -- Refrescos Americanas LTDA has 1 product
(3, 4), -- Escargots Nouveaux has 1 product
(4, 5), (5, 5), -- Cooperativa de Quesos Las Cabras has 2 products
(6, 6), (7, 6), -- Aux joyeux ecclesiastiques has 2 products
(8, 7), (9, 7), -- Forets d'erables has 2 products
(10, 8), (11, 8), -- Gai paturage has 2 products
(12, 9), (13, 9), -- Lyngbysild has 2 products
(14, 10), (15, 10), -- Ma Maison has 2 products
(16, 11), (17, 11), -- Zaanse Snoepfabriek has 2 products
(18, 12), (19, 12), -- New England Seafood Cannery has 2 products
(20, 13), (21, 13), -- Pasta Buttini s.r.l. has 2 products
(22, 14), (23, 14), -- PB Knackebrod AB has 2 products
(24, 15), (25, 15), (26, 15), -- Norske Meierier has 3 products
(27, 16), (28, 16), (29, 16), -- Tokyo Traders has 3 products
(30, 17), (31, 17), (32, 17), -- Svensk Sjofoda AB has 3 products
(33, 18), (34, 18), (35, 18), -- Mayumi's has 3 products
(36, 19), (37, 19), (38, 19), -- Leka Trading has 3 products
(39, 20), (40, 20), (41, 20), -- G'day, Mate has 3 products
(42, 21), (43, 21), (44, 21), -- Grandma Kelly's Homestead has 3 products
(45, 22), (46, 22), (47, 22), -- Heli Suswaren GmbH & Co. KG has 3 products
(48, 23), (49, 23), (50, 23), -- Karkki Oy has 3 products
(51, 24), (52, 24), (53, 24), -- Formaggi Fortini s.r.l. has 3 products
(54, 25), (55, 25), (56, 25), -- Exotic Liquids has 3 products
(57, 26), (58, 26), (59, 26), (60, 26), -- Bigfoot Breweries has 4 products
(61, 27), (62, 27), (63, 27), (64, 27), -- Specialty Biscuits, Ltd. has 4 products
(65, 28), (66, 28), (67, 28), (68, 28), (69, 28), -- New Orleans Cajun Delights Pavlova, Ltd. has 5 products
(70, 29), (71, 29), (72, 29), (73, 29), (74, 29); -- Plutzer Lebensmittelgrosmarkte AG has 5 products
    

SELECT COUNT(Products.ProductID) AS ProductCount, Suppliers.SupplierName
FROM Suppliers
LEFT JOIN Products ON Suppliers.SupplierID = Products.SupplierID
GROUP BY Suppliers.SupplierName;

drop table Employees;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    ReportsTo INT,
    FOREIGN KEY (ReportsTo) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees (EmployeeID, FirstName, ReportsTo) VALUES
(1, 'Nancy Davolio', 2),
(2, 'Andrew Fuller', NULL),
(3, 'Janet Leverling', 2),
(4, 'Margaret Peacock', 2),
(5, 'Steven Buchanan', 2),
(6, 'Michael Suyama', 5),
(7, 'Robert King', 5),
(8, 'Laura Callahan', 2),
(9, 'Anne Dodsworth', 5),
(10, 'Aamir Khan', 2);
SET FOREIGN_KEY_CHECKS=1;

SET FOREIGN_KEY_CHECKS=0;

SELECT E1.FirstName AS EmployeeName, E2.FirstName AS BossName
FROM Employees E1
JOIN Employees E2 ON E1.ReportsTo = E2.EmployeeID;



-- Now you can drop the orders table
DROP TABLE orders;

CREATE TABLE orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(255),
    EmployeeID INT,
    OrderDate DATE,
    RequiredDate DATE,
    ShippedDate DATE,
    ShipVia INT,
    Freight DECIMAL(5,2),
    ShipName VARCHAR(255)
);

INSERT INTO orders (OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, ShipName)
VALUES (11077, 'RATTC', 1, '1998-06-05', '1998-06-03', NULL, 2, 8.53, 'Rattlesnake Car'),
(11076, 'BONAP', 4, '1998-06-05', '1998-06-03', NULL, 2, 38.28, 'Bon app'),
(11075, 'RICSU', 8, '1998-06-05', '1998-06-03', NULL, 2, 6.19, 'Richter Superm'),
(11074, 'SIMOB', 7, '1998-06-05', '1998-06-03', NULL, 2, 18.44, 'Simons bistro');

SELECT *
FROM orders
WHERE OrderDate = (SELECT MAX(OrderDate) FROM orders);

drop table suppliers;
DROP TABLE products;
DROP TABLE orders;

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(255),
    contact_name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    postal_code VARCHAR(255),
    country VARCHAR(255),
    phone VARCHAR(255)
);

INSERT INTO suppliers (supplier_id, supplier_name, contact_name, address, city, postal_code, country, phone)
VALUES (1, 'Palak', 'Mishra', 'AP', 'KKD', '533437', 'India', '809-246-6408'),
(2, 'Miya', 'Jiya', 'MP', 'Punjab', '123456', 'USA', '171-555-2222'),
(3, 'Tiya', 'Niya', 'London', 'USA', '987654', 'UK', '1-504-555-4822');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id VARCHAR(255),
    supplier_id INT,
    order_date DATE,
    ship_date DATE,
    freight DECIMAL(5,2),
    ship_name VARCHAR(255)
);

INSERT INTO orders (order_id, customer_id, supplier_id, order_date, ship_date, freight, ship_name)
VALUES (1, 'Riya', 1, '1996-07-04', '1996-07-16', 32.38, 'ABC'),
(2, 'Riya', 4, '1997-08-05', '1996-07-10', 11.61, 'DEF'),
(3, 'Riya', 3, '1998-09-06', '1996-07-12', 65.83, 'GHI');

SELECT *
FROM suppliers s
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.supplier_id = s.supplier_id
);

SELECT *
FROM suppliers s
WHERE NOT EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.supplier_id = s.supplier_id
);

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, CustomerName)
VALUES (1, 'Customer A'), (2, 'Customer B'), (3, 'Customer C');

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID)
VALUES (1, 1), (2, 2),(3, 3);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, UnitPrice, Quantity, Discount)
VALUES 
(1, 1, 100.00, 2, 0.00), 
(2, 1, 200.00, 1, 0.00), 
(3, 2, 150.00, 1, 0.00), 
(4, 2, 50.00, 3, 0.10);

SELECT C.CustomerID, C.CustomerName, MAX(sub.OrderValue) as MostExpensiveOrder
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN (
    SELECT OrderID, (UnitPrice * Quantity - Discount) as OrderValue
    FROM OrderDetails
) sub ON O.OrderID = sub.OrderID
GROUP BY C.CustomerID, C.CustomerName;

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    firstname VARCHAR(255),
    lastname VARCHAR(255)
);

-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, firstname, lastname)
VALUES 
(1, 'A', 'A1'), 
(2, 'B', 'B1');

-- Create Employee_Temp table
CREATE TABLE Employee_Temp (
    firstname VARCHAR(255),
    lastname VARCHAR(255)
);

-- Insert data from Employees table into Employee_Temp table
INSERT INTO Employee_Temp (firstname, lastname)
SELECT firstname, lastname FROM Employees;

-- Execute a query to confirm the data transfer
SELECT * FROM Employee_Temp;


-- Assignment 4 
USE northwind2;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(250)
);

INSERT INTO Customers (CustomerID, CustomerName)
VALUES (1, 'Customer A'), (2, 'Customer B'), (3, 'Customer C');
       
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    EmployeeID INT,
	CustomerID INT,
    OrderDate DATE,
    RequiredDate DATE,
    Freight DECIMAL(10, 2),
    TotalAmount DECIMAL(10, 2),
    NumberOfOrders INT
);

INSERT INTO Orders (OrderID, EmployeeID, CustomerID, OrderDate, RequiredDate, Freight, TotalAmount, NumberOfOrders)
VALUES (1, 100, 1, '1997-06-17', '1997-08-22', 22.30, 100.00, 4),
       (2, 101, 2, '1997-06-21', '1997-08-28', 40.85, 150.00, 2),
       (3, 102, 3, '1997-06-20', '1997-08-26', 35.60, 200.00, 3);
     
CREATE TABLE OrderDetails (
    OrderID INT,
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(5, 2)
);

INSERT INTO OrderDetails (OrderID, UnitPrice, Quantity, Discount)
VALUES 
    (1, 10.50, 2, 0.50),
    (2, 15.75, 3, 1.25),
    (3, 20.00, 1, 0.75);
    
SELECT
    c.CustomerID,
    c.CustomerName, MAX(od.UnitPrice * od.Quantity - od.Discount) AS MostExpensiveItemValue
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY
    c.CustomerID, c.CustomerName;








CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Inserting data into Customers table
INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'A1'),
(2, 'B1'),
(3, 'C1');

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Inserting data into Orders table
INSERT INTO Orders (OrderID, CustomerID) VALUES
(101, 1),
(102, 1),
(103, 2),
(104, 3);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(4, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting data into OrderDetails table
INSERT INTO OrderDetails (OrderDetailID, OrderID, UnitPrice, Quantity, Discount) VALUES
(201, 101, 10.00, 2, 0.05),
(202, 101, 20.00, 1, 0.00),
(203, 102, 15.00, 3, 0.10),
(204, 103, 25.00, 1, 0.00),
(205, 104, 30.00, 2, 0.15),o
(206, 104, 12.00, 4, 0.00);

SELECT
    c.CustomerID,
    c.CustomerName,
    MAX(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS MostExpensivePurchase
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY
    c.CustomerID, c.CustomerName;
    
drop table products;   

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL
);

INSERT INTO products (product_id, product_name)
VALUES (1, 'Product 1'), (2, 'Product 2'), (3, 'Product 3');

SELECT RIGHT(product_name, 3) AS last_three_chars
FROM products;



CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    postal_code VARCHAR(9)
);

INSERT INTO customers (customer_id, customer_name, postal_code)
VALUES (1, 'Customer 1', '123456789'),
       (2, 'Customer 2', '67890'),
       (3, 'Customer 3', '23456');
       
SELECT LPAD(postal_code, 9, '0') AS padded_postal_code
FROM customers;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    unitprice DECIMAL(10, 2)
);

INSERT INTO products (product_id, product_name, unitprice)
VALUES (1, 'Product 1', 12.34),
       (2, 'Product 2', 56.78),
       (3, 'Product 3', 90.12);
       
SELECT FLOOR(unitprice) AS unitprice_without_decimal
FROM products;


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    price DECIMAL(10, 2)
);

INSERT INTO orders (product_id, price) VALUES
(1, 10.50),
(1, 15.75),
(2, 20.00),
(2, 25.25),
(3, 30.75);

SELECT order_id, FLOOR(SUM(price)) AS final_order_price
FROM orders
GROUP BY order_id;

SELECT order_id, CEIL(SUM(price)) AS final_order_price
FROM orders
GROUP BY order_id;


CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    price DECIMAL(10, 2)
);

INSERT INTO orders (order_date, price) VALUES
('2024-04-23', 10.50),
('2024-04-23', 15.75),
('2024-04-24', 20.00),
('2024-04-24', 25.25),
('2024-04-25', 30.75);

SELECT order_id, DATE_FORMAT(order_date, '%Y/%m/%d') AS formatted_order_date
FROM orders;

SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 5;











-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Address VARCHAR(100),
    City VARCHAR(50),
    Region VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, FullName, Address, City, Region, PostalCode, Country, Phone)
VALUES 
    (1, 'A', 'Delhi', 'City1', 'Region1', '12345', 'USA', '555-1234'),
    (2, 'B', 'Mumbai', 'City2', 'Region2', '67890', 'Canada', '555-5678'),
    (3, 'C', 'Pune', 'City3', 'Region3', '13579', 'India', '555-9876'),
    (4, 'D', 'Noida', 'City4', 'Region4', '13578', 'Australia', '555-9872'),
    (5, 'E', 'Hyderabad', 'City5', 'Region5', '13574', 'Europe', '555-9870');

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Address VARCHAR(100),
    City VARCHAR(50),
    Region VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    Phone VARCHAR(20)
);

-- Insert data into Employees table
INSERT INTO Employees (EmployeeID, FullName, Address, City, Region, PostalCode, Country, Phone)
VALUES 
    (1, 'A1', 'Jaipur', 'City6', 'Region6', '24680', 'Algeria', '555-1111'),
    (2, 'B1', 'Bengaluru', 'city7', 'Region7', '36912', 'New Zealand', '555-2222'),
    (3, 'C1', 'Visakhapatnam', 'city8', 'Region8', '75319', 'Albania', '555-3333'),
    (4, 'D1', 'Bhopal', 'city9', 'Region9', '75311', 'Armenia', '555-4444'),
    (5, 'E1', 'Chennai', 'city10', 'Region10', '75315', 'Afghanistan', '555-5555');

-- Query to display unique customer's as well as employees' FullName, Address, City, Region, PostalCode, Country, and Phone whose names start with the character 'A'
SELECT FullName, Address, City, Region, PostalCode, Country, Phone
FROM (
    SELECT FullName, Address, City, Region, PostalCode, Country, Phone
    FROM Customers
    WHERE FullName LIKE 'A%'
    UNION
    SELECT FullName, Address, City, Region, PostalCode, Country, Phone
    FROM Employees
    WHERE FullName LIKE 'A%'
) AS CombinedResults;

SELECT FullName, Address, City, Region, PostalCode, Country, Phone
FROM (
    SELECT FullName, Address, City, Region, PostalCode, Country, Phone
    FROM Customers
    WHERE Country = 'India'
    UNION
    SELECT FullName, Address, City, Region, PostalCode, Country, Phone
    FROM Employees
    WHERE Country = 'India'
) AS IndianResidents;


-- Step 1: Create Table
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255)
);

-- Step 2: Insert Values
INSERT INTO suppliers (supplier_name, contact_name, city, country)
VALUES ('Supplier A', 'A1', 'Los Angeles', 'USA'),
       ('Supplier B', 'B1', 'Berlin', 'Germany');

-- Step 3: Execute Query (optional)
SELECT * FROM suppliers;

-- Step 1: Create Table
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Step 2: Insert Values
-- Example: Inserting products for Supplier A (Assuming Supplier A has supplier_id = 1)
INSERT INTO products (product_name, supplier_id)
VALUES ('Product 1 for Supplier A', 1),
       ('Product 2 for Supplier A', 1);

-- Example: Inserting products for Supplier B (Assuming Supplier B has supplier_id = 2)
INSERT INTO products (product_name, supplier_id)
VALUES ('Product 1 for Supplier B', 2),
       ('Product 2 for Supplier B', 2);

-- Step 3: Execute Query (optional)
SELECT * FROM products;











drop table orders;
drop table products;
drop table suppliers;


-- Create suppliers table
CREATE TABLE suppliers (
    supplierID INT PRIMARY KEY,
    supplierName VARCHAR(255)
);

-- Create products table
CREATE TABLE products (
    productID INT PRIMARY KEY,
    productName VARCHAR(255),
    supplierID INT,
    FOREIGN KEY (supplierID) REFERENCES suppliers(supplierID)
);

-- Create orders table
CREATE TABLE orders (
    orderID INT PRIMARY KEY,
    supplierID INT,
    employeeID INT,
    orderDate DATE,
    discount DECIMAL(5,2),
    FOREIGN KEY (supplierID) REFERENCES suppliers(supplierID)
);

-- Insert two suppliers in suppliers table
INSERT INTO suppliers (supplierID, supplierName) VALUES (1, 'Supplier 1'), (2, 'Supplier 2');

SELECT * FROM suppliers;

-- Insert product in products table for specific suppliers
INSERT INTO products (productID, productName, supplierID) VALUES (1, 'Product 1', 1), (2, 'Product 2', 2);

SELECT * FROM products;

-- Place orders for one supplier's products
INSERT INTO orders (orderID, supplierID, employeeID, orderDate, discount) VALUES (1, 1, 1, '2022-01-01', 0.00), (2, 2, 2, '1997-07-07', 0.00);

SELECT * FROM orders;

-- Update employeeID of orders table for specific supplier's one product
UPDATE orders SET employeeID = 2 WHERE supplierID = 1 AND orderID = 1;

SELECT * FROM orders WHERE supplierID = 1 AND orderID = 1;

-- Update discount in order for specific supplier's one product who placed order in July, 1997
UPDATE orders SET discount = 0.10 WHERE supplierID = 1 AND MONTH(orderDate) = 7 AND YEAR(orderDate) = 1997;

SELECT * FROM orders WHERE supplierID = 1 AND MONTH(orderDate) = 7 AND YEAR(orderDate) = 1997;

-- Remove order and its details for specific supplier's one product
DELETE FROM orders WHERE supplierID = 1 AND orderID = 1;

SELECT * FROM orders;


CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Title VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(255),
    Country VARCHAR(255),
    HomePhone VARCHAR(255)
);

INSERT INTO Employee (EmployeeID, FirstName, LastName, Title, Address, City, Country, HomePhone)
VALUES (1, 'John', 'Doe', 'Manager', '123 Street', 'City', 'Country', '1234567890');

select * from employee;
drop table employee;



-- SQL Query to create the "Employee" table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Title VARCHAR(100),
    Address VARCHAR(255),
    City VARCHAR(100),
    Country VARCHAR(100),
    HomePhone VARCHAR(20)
);

-- SQL Query to insert values into the "Employee" table
INSERT INTO Employee (EmployeeID, FirstName, LastName, Title, Address, City, Country, HomePhone)
VALUES 
(1, 'Palak', 'Mishra', 'Manager', 'Main Street', 'Delhi', 'India', '123-456-7890'),
(2, 'payal', 'Singh', 'Developer', 'Green Road', 'Pinetown', 'Canada', '456-789-0123');

select * from employee;

use northwind;

SHOW DATABASES;
CREATE DATABASE Employee;
drop table employee;



use northwind;
-- Create employee table
CREATE TABLE employee (
    employeeId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    title VARCHAR(100),
    address VARCHAR(255),
    homePhone VARCHAR(20)
);

-- Insert values into employee table
INSERT INTO employee (name, title, address, homePhone) VALUES
('palak', 'Manager', '123 Main St, City', '123-456-7890'),
('riya', 'Sales Associate', '456 Elm St, Town', '456-789-0123'),
('pallavi', 'Accountant', '789 Oak St, Village', '789-012-3456'),
('Boby', 'Engineer', '321 Pine St, County', '321-654-9870'),
('maya', 'Marketing Specialist', '654 Maple St, Country', '654-987-0123');

select * from employee;

-- Create SalesByCategory stored procedure
DELIMITER //
CREATE PROCEDURE SalesByCategory(IN categoryName VARCHAR(255), IN orderYear INT)
BEGIN
    SELECT ProductName, SUM(Quantity * UnitPrice) AS TotalPurchase
    FROM Products
    INNER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
    INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
    WHERE YEAR(Orders.OrderDate) = orderYear
    AND Products.CategoryName = categoryName
    GROUP BY ProductName;
END //
DELIMITER ;

-- Create Products exists
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255),
    CategoryName VARCHAR(255),
    QuantityPerUnit VARCHAR(255),
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT
);
-- Insert data into Products table
INSERT INTO Products (ProductName, CategoryName, QuantityPerUnit, UnitPrice, UnitsInStock) VALUES
('Product A', 'Seafood', '10 boxes', 10.50, 100),
('Product B', 'Seafood', '20 boxes', 15.75, 200),
('Product C', 'Produce', '5 bags', 8.25, 150),
('Product D', 'Produce', '15 bags', 12.00, 250),
('Product E', 'Produce', '25 bags', 18.50, 300);

SHOW PROCEDURE STATUS;
SHOW TABLES;
drop table Products;




drop table Categories;
drop table Products; 
drop table Orders;
drop table Orderdetails;
------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE SalesByCategory(IN categoryName VARCHAR(255), IN orderYear INT)
BEGIN
    SELECT ProductName, SUM(Quantity * UnitPrice) AS TotalPurchase
    FROM Products
    INNER JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
    INNER JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
    INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
    WHERE Categories.CategoryName = categoryName
    AND YEAR(Orders.OrderDate) = orderYear
    GROUP BY ProductName;
END //

DELIMITER ;

-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);
INSERT INTO Categories (CategoryName) VALUES
('Seafood'),
('Produce');

-- Create Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
-- Insert data for Products table
INSERT INTO Products (ProductName, CategoryID) VALUES
('Salmon', 1), 
('Tuna', 1), 
('Apple', 2), 
('Banana', 2);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    OrderDate DATE
);
-- Insert data for Orders table
INSERT INTO Orders (OrderDate) VALUES
('1996-01-01'),
('1996-02-01'),
('1996-03-01'),
('1996-04-01');

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert data for OrderDetails table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 10, 5.99),
(2, 1, 8, 6.99),
(3, 2, 15, 7.99),
(4, 3, 20, 0.99),
(4, 4, 25, 0.79);

-- View data
SELECT c.CategoryName, p.ProductName, o.OrderDate, od.Quantity, od.UnitPrice
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID;

drop table employees;

-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(255),
    FirstName VARCHAR(255),
    Title VARCHAR(255),
    BirthDate DATE
);

-- Inserting data into the Employees table
INSERT INTO Employees (EmployeeID, LastName, FirstName, Title, BirthDate)
VALUES
    (1, 'A', 'A1', 'Manager', '1980-01-01'),
    (2, 'B', 'B1', 'Assistant Manager', '1985-05-15'),
    (3, 'C', 'C1', 'Supervisor', '1990-10-20'),
    (4, 'D', 'D1', 'Team Leader', '1988-03-12'),
    (5, 'E', 'E1', 'Staff', '1995-07-25');

SELECT EmployeeID, LastName, FirstName, Title, BirthDate
FROM Employees;

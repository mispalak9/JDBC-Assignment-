-- Day 2 SQL Query
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

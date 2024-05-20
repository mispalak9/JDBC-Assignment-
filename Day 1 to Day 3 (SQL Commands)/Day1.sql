-- Day 1 SQL Query
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

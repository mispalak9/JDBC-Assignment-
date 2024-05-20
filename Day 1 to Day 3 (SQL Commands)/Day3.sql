-- Creating the Employees table
-- Day 3 SQL Query
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
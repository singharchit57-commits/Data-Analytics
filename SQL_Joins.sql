CREATE DATABASE create_function;
USE create_function;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50));
    INSERT INTO Customers VALUES
(1, 'John Smith', 'New York'),
(2, 'Mary Johnson', 'Chicago'),
(3, 'Peter Adams', 'Los Angeles'),
(4, 'Robert White', 'Houston'),
(5, 'Nancy Miller', 'Miami');

CREATE TABLE Orders (OrderID INT PRIMARY KEY,CustomerID INT,OrderDate DATE,Amount INT);
INSERT INTO Orders VALUES
(101, 1, '2024-10-01', 250),(102, 2, '2024-10-05', 300),(103, 1, '2024-10-07', 150),
(104, 3, '2024-10-10', 450),(105, 6, '2024-10-12', 400);

CREATE TABLE Payments (PaymentID VARCHAR(10) PRIMARY KEY,CustomerID INT,PaymentDate DATE,Amount INT);
INSERT INTO Payments VALUES
('P001', 1, '2024-10-02', 250),('P002', 2, '2024-10-06', 300),
('P003', 3, '2024-10-11', 450),('P004', 4, '2024-10-15', 200);

CREATE TABLE  Employees ( EmployeesID VARCHAR(10) PRIMARY KEY,EmployeeName VARCHAR(50),ManagerID INT);
INSERT INTO Employees VALUES (1,'Alex Green',NULL),(2,'Brian Lee',1),(3,'Carol Ray',1),
(4,'David Kim',2),(5,'Eva Smith',2);

-- 1. Retrieve all customers who have placed at least one order
SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 2. Retrieve all customers and their orders, including customers who have not placed any orders.
SELECT c.CustomerID, c.CustomerName, c.City, o.OrderID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 3. Retrieve all orders and their corresponding customers, including orders placed by unknown customers.
SELECT o.OrderID, o.CustomerID, o.OrderDate, o.Amount,c.CustomerName, c.City
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 4.Display all customers and orders, whether matched or not
-- (Full Outer Join using UNION)
SELECT c.CustomerID, c.CustomerName, c.City, o.OrderID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.CustomerName, c.City, o.OrderID, o.OrderDate, o.Amount
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- 5. Find customers who have not placed any orders
SELECT c.CustomerID, c.CustomerName, c.City
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- 6. Retrieve customers who made payments but did not place any orders
SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Payments p ON c.CustomerID = p.CustomerID
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- 7. Generate a list of all possible combinations between Customers and Orders
SELECT c.CustomerID, c.CustomerName, c.City, o.OrderID, o.OrderDate, o.Amount
FROM Customers c CROSS JOIN Orders o;

-- 8. Show all customers along with order and payment amounts in one table
SELECT c.CustomerID, c.CustomerName, c.City, o.OrderID, o.OrderDate, o.Amount AS OrderAmount,
p.PaymentID, p.PaymentDate, p.Amount AS PaymentAmount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON c.CustomerID = p.CustomerID;

-- 9.Retrieve all customers who have both placed orders and made payments
SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN Payments p ON c.CustomerID = p.CustomerID;
--QUESTION 1
-- Creating the initial table
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(50),
    Products VARCHAR(255)
);

-- Inserting the provided data
INSERT INTO ProductDetail (OrderID, CustomerName, Products)
VALUES
(101, 'John Doe', 'Laptop, Mouse'),
(102, 'Jane Smith', 'Tablet, Keyboard, Mouse'),
(103, 'Emily Clark', 'Phone');

-- Transforming the table into 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(50),
    Product VARCHAR(50)
);

-- Splitting Products into individual rows
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Query to view the transformed table
SELECT * FROM ProductDetail_1NF;

--QUESTION 2
-- Creating the initial table
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);

-- Inserting the provided data
INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity)
VALUES
(101, 'John Doe', 'Laptop', 2),
(101, 'John Doe', 'Mouse', 1),
(102, 'Jane Smith', 'Tablet', 3),
(102, 'Jane Smith', 'Keyboard', 1),
(102, 'Jane Smith', 'Mouse', 2),
(103, 'Emily Clark', 'Phone', 1);

-- Creating a new table for customers (OrderID -> CustomerName)
CREATE TABLE CustomerDetails (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

-- Populating the CustomerDetails table
INSERT INTO CustomerDetails (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Creating a new table for OrderDetails in 2NF
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product)
);

-- Populating the OrderDetails_2NF table
INSERT INTO OrderDetails_2NF (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Query to view the normalized tables
SELECT * FROM CustomerDetails;
SELECT * FROM OrderDetails_2NF;

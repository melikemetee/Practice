-- STEP 1: Creating the Database Schema (Tables)
-- Creating the Customers table to store account profiles
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    RiskSegment VARCHAR(20)
);

-- Creating the Transactions table with a Foreign Key connecting to Customers
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    CustomerID INT,
    Amount_USD DECIMAL(10,2),
    Location VARCHAR(50),
    TransactionDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- STEP 2: Ingesting Data (Inserting Sample Records)
INSERT INTO Customers VALUES (1, 'Alice Smith', 'Medium');
INSERT INTO Customers VALUES (2, 'Bob Jones', 'High');
INSERT INTO Customers VALUES (3, 'Charlie Brown', 'Low');

INSERT INTO Transactions VALUES (101, 1, 150.00, 'Istanbul', '2026-05-01');
INSERT INTO Transactions VALUES (102, 2, 45000.00, 'Ankara', '2026-05-02'); -- High Amount
INSERT INTO Transactions VALUES (103, 3, 200.00, 'Izmir', '2026-05-03');
INSERT INTO Transactions VALUES (104, 1, 9500.00, 'Miami', '2026-05-04');  -- Overseas Location
INSERT INTO Transactions VALUES (105, 2, 12000.00, 'Ankara', '2026-05-05'); -- Another High Amount

-- STEP 3: Advanced Data Engineering Queries (Anomaly Detection)

-- Query A: Flagging individual suspicious transactions (Amount > $10,000 OR overseas location)
-- This covers the "Rule-Based System" and "Data Processing" part of the job description
SELECT 
    t.TransactionID,
    c.CustomerName,
    t.Amount_USD,
    t.Location,
    c.RiskSegment
FROM Transactions t
INNER JOIN Customers c ON t.CustomerID = c.CustomerID
WHERE t.Amount_USD > 10000 OR t.Location = 'Miami';

-- Query B: Aggregating total risk exposure per customer (GROUP BY & HAVING)
-- This identifies customers who have accumulated more than $20,000 in total transaction volume
SELECT 
    c.CustomerName,
    COUNT(t.TransactionID) AS Total_Transactions,
    SUM(t.Amount_USD) AS Total_Spent_USD
FROM Transactions t
INNER JOIN Customers c ON t.CustomerID = c.CustomerID
GROUP BY c.CustomerName
HAVING SUM(t.Amount_USD) > 20000;
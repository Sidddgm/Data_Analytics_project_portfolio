-- Create Database
CREATE DATABASE financial_fraud;

USE financial_fraud;

-- Create Table
CREATE TABLE fraud_transactions (
    Time FLOAT,
    Amount DECIMAL(10,2),
    Class INT,
    Hour INT,
    Amount_Category VARCHAR(20),
    High_Value BOOLEAN
);

-- Total Transactions
SELECT COUNT(*) AS Total_Transactions
FROM fraud_transactions;

-- Fraud Transactions
SELECT COUNT(*) AS Fraud_Transactions
FROM fraud_transactions
WHERE Class = 1;

-- Genuine Transactions
SELECT COUNT(*) AS Genuine_Transactions
FROM fraud_transactions
WHERE Class = 0;

-- Total Transaction Amount
SELECT SUM(Amount) AS Total_Amount
FROM fraud_transactions;

-- Average Transaction Amount
SELECT AVG(Amount) AS Average_Amount
FROM fraud_transactions;

-- High Value Transactions
SELECT COUNT(*) AS High_Value_Transactions
FROM fraud_transactions
WHERE High_Value = TRUE;

-- Fraud by Hour
SELECT Hour, COUNT(*) AS Fraud_Count
FROM fraud_transactions
WHERE Class = 1
GROUP BY Hour
ORDER BY Hour;

-- Transactions by Amount Category
SELECT Amount_Category, COUNT(*) AS Transactions
FROM fraud_transactions
GROUP BY Amount_Category;

-- Top 10 Fraud Transactions
SELECT *
FROM fraud_transactions
WHERE Class = 1
ORDER BY Amount DESC
LIMIT 10;
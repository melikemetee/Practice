-- STEP 1: Creating the Database Schema (LLM Logs)
-- Creating a table to monitor and audit AI platform API interactions
CREATE TABLE LLM_Generation_Logs (
    LogID INT PRIMARY KEY,
    User_ID INT,
    Model_Name VARCHAR(30),        -- e.g., 'gpt-4o', 'claude-3-5'
    Prompt_Text TEXT,
    AI_Response TEXT,
    Prompt_Tokens INT,
    Completion_Tokens INT,
    Total_Cost_USD DECIMAL(10,5),  -- Calculates data pipeline efficiency
    Log_Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- STEP 2: Ingesting Data (Simulating LLM Platform Logs)
INSERT INTO LLM_Generation_Logs VALUES (
    1, 201, 'gpt-4o', 
    'Analyze my credit card statements for fraud.', 
    'Analysis complete. 2 high-risk anomalies detected in your recent overseas transactions.', 
    15, 35, 0.00085, '2026-06-01 10:15:00'
);

INSERT INTO LLM_Generation_Logs VALUES (
    2, 202, 'gpt-4o', 
    'Generate a financial risk report for Q1.', 
    'Summary: Risk score is stable at 4.2/10. Portfolio volatility remains low.', 
    12, 45, 0.00102, '2026-06-01 11:20:00'
);

INSERT INTO LLM_Generation_Logs VALUES (
    3, 203, 'claude-3-5', 
    'Optimize this SQL query for faster runtime.', 
    'Recommendation: Add an INNER JOIN index on CustomerID to reduce compute cost.', 
    20, 80, 0.00210, '2026-06-01 12:05:00'
);

-- STEP 3: Advanced Analytical Inquiries for AI Infrastructure

-- Query A: Identifying heavy/expensive AI usage (Cost Monitoring)
-- Helps data engineers optimize system performance and budget allocation
SELECT 
    Model_Name,
    COUNT(LogID) AS Total_Requests,
    SUM(Prompt_Tokens + Completion_Tokens) AS Total_Tokens_Consumed,
    SUM(Total_Cost_USD) AS Accumulated_Cost_USD
FROM LLM_Generation_Logs
GROUP BY Model_Name;

-- Query B: Searching logs for specific data pipelines (Security & Compliance)
-- Flags requests that handled fraud-related queries
SELECT 
    LogID,
    User_ID,
    Prompt_Text,
    AI_Response
FROM LLM_Generation_Logs
WHERE Prompt_Text LIKE '%fraud%' OR AI_Response LIKE '%anomaly%';
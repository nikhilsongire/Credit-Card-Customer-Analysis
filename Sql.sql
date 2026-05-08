CREATE DATABASE Credit_Card_Analysis;

USE Credit_Card_Analysis;

-- Total Customers
SELECT COUNT(*) AS Total_Customers
FROM credit_card_data;

-- Churned Customers
SELECT COUNT(*) AS Churned_Customers
FROM credit_card_data
WHERE Customer_Status = 'Attrited Customer';

-- Churn Rate
SELECT 
ROUND(
COUNT(CASE 
WHEN Customer_Status = 'Attrited Customer' THEN 1 
END) * 100.0 / COUNT(*), 2
) AS Churn_Rate
FROM credit_card_data;

-- Customers by Income Category
SELECT 
Income_Category,
COUNT(*) AS Total_Customers
FROM credit_card_data
GROUP BY Income_Category
ORDER BY Total_Customers DESC;

-- Customers by Education Level
SELECT 
Education_Level,
COUNT(*) AS Total_Customers
FROM credit_card_data
GROUP BY Education_Level;

-- Average Credit Limit
SELECT 
AVG(Credit_Limit) AS Avg_Credit_Limit
FROM credit_card_data;

-- Average Utilization Ratio
SELECT 
AVG(Avg_Utilization) AS Avg_Utilization_Ratio
FROM credit_card_data;

-- Churn by Card Category
SELECT 
Card_Category,
COUNT(*) AS Churned_Customers
FROM credit_card_data
WHERE Customer_Status = 'Attrited Customer'
GROUP BY Card_Category;

-- Gender Distribution
SELECT 
Gender,
COUNT(*) AS Total_Customers
FROM credit_card_data
GROUP BY Gender;

-- High Risk Customers
SELECT 
COUNT(*) AS High_Risk_Customers
FROM credit_card_data
WHERE Inactive_Months > 3
AND Avg_Utilization < 0.2;

-- Funnel Analysis
SELECT
COUNT(*) AS Total_Customers,
SUM(CASE 
WHEN Customer_Status = 'Existing Customer' 
THEN 1 ELSE 0 
END) AS Active_Customers,

SUM(CASE 
WHEN Inactive_Months > 3 
THEN 1 ELSE 0 
END) AS Inactive_Customers

FROM credit_card_data;

-- Average Transaction Amount by Customer Status
SELECT
Customer_Status,
AVG(Total_Transaction_Amount) AS Avg_Transaction_Amount
FROM credit_card_data
GROUP BY Customer_Status;

-- Average Revolving Balance by Customer Status
SELECT
Customer_Status,
AVG(Total_Revolving_Balance) AS Avg_Revolving_Balance
FROM credit_card_data
GROUP BY Customer_Status;

-- Customer Distribution by Age Group
SELECT
CASE
WHEN Customer_Age BETWEEN 25 AND 34 THEN '25-34'
WHEN Customer_Age BETWEEN 35 AND 44 THEN '35-44'
WHEN Customer_Age BETWEEN 45 AND 54 THEN '45-54'
ELSE '55+'
END AS Age_Group,

COUNT(*) AS Total_Customers

FROM credit_card_data
GROUP BY Age_Group
ORDER BY Total_Customers DESC;

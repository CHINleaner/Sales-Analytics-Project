
-- =========================================
-- E-COMMERCE SALES ANALYSIS PROJECT
-- Dataset: Superstore
-- Tools: SQL Server Management Studio
-- =========================================

CREATE DATABASE superstore_db;
USE superstore_db;

-- =========================================
-- 1. VIEW TOP 10 RECORDS
-- =========================================

SELECT TOP 10 *
FROM [Sample - Superstore(NEW)];


-- =========================================
-- 2. TOTAL SALES
-- =========================================

SELECT 
    CAST(ROUND(SUM(Sales), 2) AS DECIMAL(18,2)) AS Total_Sales
FROM [Sample - Superstore(NEW)];


-- =========================================
-- 3. TOTAL PROFIT
-- =========================================

SELECT 
    CAST(ROUND(SUM(Profit), 2) AS DECIMAL(18,2)) AS Total_Profit
FROM [Sample - Superstore(NEW)];


-- =========================================
-- 4. TOTAL UNIQUE ORDERS
-- =========================================

SELECT 
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM [Sample - Superstore(NEW)];


-- =========================================
-- 5. REGION-WISE SALES ANALYSIS
-- =========================================

SELECT 
    Region,
    CAST(ROUND(SUM(Sales), 2) AS DECIMAL(18,2)) AS Total_Sales
FROM [Sample - Superstore(NEW)]
GROUP BY Region
ORDER BY Total_Sales DESC;


-- =========================================
-- 6. STATE-WISE SALES ANALYSIS
-- =========================================

SELECT 
    State,
    CAST(ROUND(SUM(Sales), 2) AS DECIMAL(18,2)) AS Total_Sales
FROM [Sample - Superstore(NEW)]
GROUP BY State
ORDER BY Total_Sales DESC;


-- =========================================
-- 7. CATEGORY-WISE PROFIT ANALYSIS
-- =========================================

SELECT 
    Category,
    CAST(ROUND(SUM(Profit), 2) AS DECIMAL(18,2)) AS Total_Profit
FROM [Sample - Superstore(NEW)]
GROUP BY Category
ORDER BY Total_Profit DESC;


-- =========================================
-- 8. SEGMENT-WISE SALES ANALYSIS
-- =========================================

SELECT 
    Segment,
    CAST(ROUND(SUM(Sales), 2) AS DECIMAL(18,2)) AS Total_Sales
FROM [Sample - Superstore(NEW)]
GROUP BY Segment
ORDER BY Total_Sales DESC;


-- =========================================
-- 9. TOP 10 CUSTOMERS BY SALES
-- =========================================

SELECT TOP 10
    Customer_ID,
    CAST(ROUND(SUM(Sales), 2) AS DECIMAL(18,2)) AS Total_Purchase
FROM [Sample - Superstore(NEW)]
GROUP BY Customer_ID
ORDER BY Total_Purchase DESC;


-- =========================================
-- 10. MONTHLY SALES TREND
-- =========================================

SELECT 
    Order_Month,
    CAST(ROUND(SUM(Sales), 2) AS DECIMAL(18,2)) AS Monthly_Sales
FROM [Sample - Superstore(NEW)]
GROUP BY Order_Month
ORDER BY Monthly_Sales DESC;


-- =========================================
-- 11. YEARLY SALES TREND
-- =========================================

SELECT 
    Order_Year,
    CAST(ROUND(SUM(Sales), 2) AS DECIMAL(18,2)) AS Total_Sales
FROM [Sample - Superstore(NEW)]
GROUP BY Order_Year
ORDER BY Order_Year;


-- =========================================
-- 12. DISCOUNT VS AVERAGE PROFIT ANALYSIS
-- =========================================

SELECT 
    Discount,
    CAST(ROUND(AVG(Profit), 2) AS DECIMAL(18,2)) AS Avg_Profit
FROM [Sample - Superstore(NEW)]
GROUP BY Discount
ORDER BY Discount;


-- =========================================
-- 13. AVERAGE DELIVERY TIME
-- =========================================

SELECT 
    ROUND(AVG(DATEDIFF(day, Order_Date, Ship_Date)), 2) AS Avg_Delivery_Days
FROM [Sample - Superstore(NEW)];


-- =========================================
-- 14. LOSS-MAKING PRODUCTS
-- =========================================

SELECT 
    Product_Name,
    CAST(ROUND(SUM(Profit), 2) AS DECIMAL(18,2)) AS Total_Loss
FROM [Sample - Superstore(NEW)]
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Total_Loss ASC;


-- =========================================
-- 15. TOP 10 PRODUCTS BY SALES
-- =========================================

SELECT TOP 10
    Product_Name,
    CAST(ROUND(SUM(Sales), 2) AS DECIMAL(18,2)) AS Total_Revenue
FROM [Sample - Superstore(NEW)]
GROUP BY Product_Name
ORDER BY Total_Revenue DESC;
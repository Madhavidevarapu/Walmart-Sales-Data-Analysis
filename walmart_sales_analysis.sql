CREATE TABLE WalmartSales (
    Store INTEGER,
    Date TEXT,
    Weekly_Sales REAL,
    Holiday_Flag INTEGER,
    Temperature REAL,
    Fuel_Price REAL,
    CPI REAL,
    Unemployment REAL
);

SELECT COUNT(*) FROM WalmartSales;
SELECT COUNT(*) FROM Walmart_Sales;

ALTER TABLE Walmart_Sales RENAME COLUMN c1 TO Store;
ALTER TABLE Walmart_Sales RENAME COLUMN c2 TO Date;
ALTER TABLE Walmart_Sales RENAME COLUMN c3 TO Weekly_Sales;
ALTER TABLE Walmart_Sales RENAME COLUMN c4 TO Holiday_Flag;
ALTER TABLE Walmart_Sales RENAME COLUMN c5 TO Temperature;
ALTER TABLE Walmart_Sales RENAME COLUMN c6 TO Fuel_Price;
ALTER TABLE Walmart_Sales RENAME COLUMN c7 TO CPI;
ALTER TABLE Walmart_Sales RENAME COLUMN c8 TO Unemployment;


-- Total sales by store
SELECT Store, SUM(Weekly_Sales) AS Total_Sales
FROM Walmart_Sales
GROUP BY Store
ORDER BY Total_Sales DESC;

-- Holiday vs Non-holiday total sales
SELECT Holiday_Flag, SUM(Weekly_Sales) AS Total_Sales
FROM Walmart_Sales
GROUP BY Holiday_Flag;

-- Monthly sales trend
SELECT 
    strftime('%Y', Date) AS Year,
    strftime('%m', Date) AS Month,
    SUM(Weekly_Sales) AS Monthly_Sales
FROM Walmart_Sales
GROUP BY Year, Month
ORDER BY Year, Month;

-- Monthly sales trend (final verdict)
SELECT
    substr(Date, 7, 4) AS Year,
    substr(Date, 4, 2) AS Month,
    SUM(Weekly_Sales) AS Monthly_Sales
FROM Walmart_Sales
GROUP BY Year, Month
ORDER BY Year, Month;

-- Monthly sales trend (FINAL CLEAN VERDICT)
SELECT
    substr(Date, 7, 4) AS Year,
    substr(Date, 4, 2) AS Month,
    SUM(Weekly_Sales) AS Monthly_Sales
FROM Walmart_Sales
WHERE Date IS NOT NULL
  AND length(Date) = 10
GROUP BY Year, Month
ORDER BY Year, Month;

-- Average weekly sales per store
SELECT 
    Store,
    AVG(Weekly_Sales) AS Avg_Weekly_Sales
FROM Walmart_Sales
GROUP BY Store
ORDER BY Avg_Weekly_Sales DESC;

-- Holiday impact on average weekly sales
SELECT 
    Holiday_Flag,
    AVG(Weekly_Sales) AS Avg_Sales
FROM Walmart_Sales
GROUP BY Holiday_Flag;









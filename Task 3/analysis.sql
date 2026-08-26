-- DATA ANALYST INTERNSHIP - TASK 3
-- SQL, Python & Power BI Business Analysis
-- Database: Chinook SQLite Database

-- 1. TOTAL REVENUE
SELECT ROUND(SUM(Total), 2) AS Total_Revenue FROM Invoice;

-- 2. TOP-SELLING TRACKS
SELECT t.Name AS Track_Name, SUM(il.Quantity) AS Units_Sold
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
GROUP BY t.TrackId, t.Name
ORDER BY Units_Sold DESC LIMIT 10;

-- 3. TOTAL CUSTOMERS
SELECT COUNT(*) AS Total_Customers FROM Customer;

-- 4. TOTAL ORDERS
SELECT COUNT(*) AS Total_Orders FROM Invoice;

-- 5. AVERAGE ORDER VALUE
SELECT ROUND(AVG(Total), 2) AS Average_Order_Value FROM Invoice;

-- 6. AVERAGE SPENDING PER CUSTOMER
SELECT ROUND(AVG(Customer_Total), 2) AS Average_Spending_Per_Customer
FROM (
    SELECT CustomerId, SUM(Total) AS Customer_Total
    FROM Invoice GROUP BY CustomerId
);

-- 7. TOP 10 CUSTOMERS BY SPENDING
SELECT c.CustomerId, c.FirstName || ' ' || c.LastName AS Customer_Name,
       ROUND(SUM(i.Total), 2) AS Total_Spending
FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, Customer_Name
ORDER BY Total_Spending DESC LIMIT 10;

-- 8. REVENUE BY COUNTRY
SELECT c.Country, ROUND(SUM(i.Total), 2) AS Revenue
FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.Country ORDER BY Revenue DESC;

-- 9. CUSTOMER COUNT BY COUNTRY
SELECT Country, COUNT(*) AS Customer_Count
FROM Customer GROUP BY Country ORDER BY Customer_Count DESC;

-- 10. TOP-SELLING GENRES
SELECT g.Name AS Genre, SUM(il.Quantity) AS Units_Sold
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.GenreId, g.Name
ORDER BY Units_Sold DESC;

-- 11. TOP-SELLING ARTISTS
SELECT ar.Name AS Artist, SUM(il.Quantity) AS Units_Sold
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.ArtistId, ar.Name
ORDER BY Units_Sold DESC LIMIT 10;

-- 12. REVENUE BY YEAR
SELECT strftime('%Y', InvoiceDate) AS Year, ROUND(SUM(Total), 2) AS Revenue
FROM Invoice GROUP BY Year ORDER BY Year;

-- 13. REVENUE BY MONTH
SELECT strftime('%m', InvoiceDate) AS Month_Number, ROUND(SUM(Total), 2) AS Revenue
FROM Invoice GROUP BY Month_Number ORDER BY Month_Number;

-- 14. YEARLY SALES GROWTH
WITH YearlyRevenue AS (
    SELECT strftime('%Y', InvoiceDate) AS Year, SUM(Total) AS Revenue
    FROM Invoice GROUP BY Year
)
SELECT Year, ROUND(Revenue, 2) AS Revenue,
       ROUND((Revenue - LAG(Revenue) OVER (ORDER BY Year)) * 100.0 /
             LAG(Revenue) OVER (ORDER BY Year), 2) AS Revenue_Growth_Percentage
FROM YearlyRevenue ORDER BY Year;

-- 15. HIGHEST-PERFORMING COUNTRY
SELECT c.Country, ROUND(SUM(i.Total), 2) AS Revenue
FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.Country ORDER BY Revenue DESC LIMIT 1;

-- 16. HIGHEST-PERFORMING MONTH
SELECT strftime('%m', InvoiceDate) AS Month_Number, ROUND(SUM(Total), 2) AS Revenue
FROM Invoice GROUP BY Month_Number ORDER BY Revenue DESC LIMIT 1;

-- 17. HIGHEST-PERFORMING ARTIST
SELECT ar.Name AS Artist, SUM(il.Quantity) AS Units_Sold
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Album al ON t.AlbumId = al.AlbumId
JOIN Artist ar ON al.ArtistId = ar.ArtistId
GROUP BY ar.ArtistId, ar.Name
ORDER BY Units_Sold DESC LIMIT 1;

-- 18. CUSTOMERS WITH HIGHEST PURCHASE FREQUENCY
SELECT c.CustomerId, c.FirstName || ' ' || c.LastName AS Customer_Name,
       COUNT(i.InvoiceId) AS Purchase_Frequency
FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, Customer_Name
ORDER BY Purchase_Frequency DESC LIMIT 10;

-- 19. REVENUE CONTRIBUTION OF TOP 10 CUSTOMERS
WITH CustomerRevenue AS (
    SELECT CustomerId, SUM(Total) AS Revenue
    FROM Invoice GROUP BY CustomerId
),
Top10Revenue AS (
    SELECT Revenue FROM CustomerRevenue
    ORDER BY Revenue DESC LIMIT 10
)
SELECT ROUND(SUM(Revenue), 2) AS Top_10_Revenue,
       ROUND(SUM(Revenue) * 100.0 /
             (SELECT SUM(Revenue) FROM CustomerRevenue), 2)
             AS Revenue_Contribution_Percentage
FROM Top10Revenue;

-- 20. CUSTOMER VALUE SEGMENTATION
WITH CustomerSpending AS (
    SELECT c.CustomerId, c.FirstName || ' ' || c.LastName AS Customer_Name,
           SUM(i.Total) AS Total_Spending
    FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId, Customer_Name
)
SELECT Customer_Name, ROUND(Total_Spending, 2) AS Total_Spending,
       CASE
           WHEN Total_Spending >= 40 THEN 'High Value'
           WHEN Total_Spending >= 30 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS Customer_Segment
FROM CustomerSpending ORDER BY Total_Spending DESC;

-- 21. HIGHEST-VALUE ORDERS
SELECT InvoiceId, CustomerId, ROUND(Total, 2) AS Order_Total
FROM Invoice ORDER BY Total DESC LIMIT 10;

-- 22. TOP 6 COUNTRIES BY REVENUE
SELECT c.Country, ROUND(SUM(i.Total), 2) AS Revenue
FROM Customer c JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.Country ORDER BY Revenue DESC LIMIT 6;

-- END OF TASK 3 SQL ANALYSIS

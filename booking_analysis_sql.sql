create database BOOKING;
USE BOOKING;
select* from bookings_data;
-- Total Number of Bookings
SELECT COUNT(*) AS Total_Bookings FROM bookings_data;
-- Total Revenue
SELECT SUM(Price) AS Total_Revenue FROM bookings_data;
-- Average Booking Price
SELECT AVG(Price) AS Avg_Booking_Value FROM bookings_data;
-- Unique Customers Count
SELECT COUNT(DISTINCT `Customer ID`) AS Unique_Customers FROM bookings_data;
-- Top 5 Booking Types by Revenue
SELECT `Booking Type`, SUM(Price) AS Total_Revenue
FROM bookings_data
GROUP BY `Booking Type`
ORDER BY Total_Revenue DESC
LIMIT 5;
-- Monthly Revenue Trend
SELECT DATE_FORMAT(`Booking Date`, '%Y-%m') AS Month, SUM(Price) AS Revenue
FROM bookings_data
GROUP BY Month
ORDER BY Month;
alter table bookings_data
rename column `ï»¿Booking ID` to `Booking_ID`;
-- Top 10 High-Value Customers
SELECT `Customer Name`, COUNT(`Booking_ID`) AS Total_Bookings, SUM(Price) AS Total_Spending
FROM bookings_data
GROUP BY `Customer Name`
ORDER BY Total_Spending DESC
LIMIT 10;
-- Customers Who Made More Than 1 Booking
SELECT `Customer Name`, COUNT(Booking_ID) AS Total_Bookings
FROM bookings_data
GROUP BY `Customer Name`
HAVING Total_Bookings > 1;
-- Repeat vs. One-Time Customers
    SELECT Customer_Type, COUNT(`Customer ID`) AS Customer_Count
FROM (
    SELECT `Customer ID`,
        CASE 
            WHEN COUNT(Booking_ID) > 1 THEN 'Repeat Customer'
            ELSE 'One-Time Customer'
        END AS Customer_Type
    FROM bookings_data
    GROUP BY `Customer ID`
) AS Customer_Segments
GROUP BY Customer_Type;
-- Booking Status & Cancellations
SELECT Status, COUNT(*) AS Booking_Count
FROM bookings_data
GROUP BY Status;
-- Cancellation Rate
SELECT 
    (COUNT(CASE WHEN Status = 'Canceled' THEN 1 END) * 100.0 / COUNT(*)) AS Cancellation_Rate
FROM bookings_data;
-- Most Popular Services
SELECT `Service Name`, COUNT(*) AS Total_Bookings
FROM bookings_data
GROUP BY `Service Name`
ORDER BY Total_Bookings DESC
LIMIT 5;
-- Revenue by Facility
SELECT Facility, SUM(Price) AS Total_Revenue
FROM bookings_data
GROUP BY Facility
ORDER BY Total_Revenue DESC;





    









CREATE TABLE ecommerce_funnel (
    User_ID VARCHAR(10),
    Session_ID VARCHAR(10),
    Device_Type VARCHAR(20),
    Traffic_Source VARCHAR(30),
    Product_Category VARCHAR(30),
    Product_Viewed VARCHAR(10),
    Added_To_Cart VARCHAR(10),
    Checkout_Started VARCHAR(10),
    Purchase_Completed VARCHAR(10),
    Cart_Value INT,
    Purchase_Value INT,
    Payment_Method VARCHAR(20),
    Session_Duration_Minutes INT,
    Bounce_Rate_Flag VARCHAR(10),
    Repeat_Customer VARCHAR(10),
    City VARCHAR(30)
);

SHOW TABLES;

SELECT COUNT(*) FROM ecommerce_funnel;

SELECT * FROM ecommerce_funnel;

SELECT COUNT(User_ID) AS Total_Users
FROM ecommerce_funnel;

SELECT 
ROUND(
COUNT(CASE WHEN Added_To_Cart = 'Yes' THEN 1 END) * 100.0
/ COUNT(*),
2
) AS Add_To_Cart_Rate
FROM ecommerce_funnel;

SELECT 
ROUND(
COUNT(CASE WHEN Purchase_Completed = 'Yes' THEN 1 END) * 100.0
/ COUNT(*),
2
) AS Conversion_Rate
FROM ecommerce_funnel;

SELECT 
ROUND(
COUNT(CASE 
WHEN Added_To_Cart = 'Yes'
AND Purchase_Completed = 'No'
THEN 1 END) * 100.0
/
COUNT(CASE WHEN Added_To_Cart = 'Yes' THEN 1 END),
2
) AS Cart_Abandonment_Rate
FROM ecommerce_funnel;

SELECT 
Device_Type,
COUNT(CASE WHEN Purchase_Completed = 'Yes' THEN 1 END) AS Purchases
FROM ecommerce_funnel
GROUP BY Device_Type;

SELECT 
Traffic_Source,
SUM(Purchase_Value) AS Revenue
FROM ecommerce_funnel
GROUP BY Traffic_Source
ORDER BY Revenue DESC;

SELECT 
Repeat_Customer,
AVG(Purchase_Value) AS Avg_Revenue
FROM ecommerce_funnel
GROUP BY Repeat_Customer;

SELECT 
Product_Category,
SUM(Purchase_Value) AS Revenue
FROM ecommerce_funnel
GROUP BY Product_Category
ORDER BY Revenue DESC;
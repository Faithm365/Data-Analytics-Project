-- I want to see all columns in the Bright Coffee Shop table
SELECT
  *
FROM
  "SALES"."CASESTUDY"."BRIGHT_COFFEE_SHOP"
--Checking revenue calculations
SELECT transaction_id,
       transaction_qty*unit_price AS revenue
      FROM "SALES"."CASESTUDY"."BRIGHT_COFFEE_SHOP"
;

-- Remember that with the ID's we use the COUNT NOT SUM 
-- This is the total number of sales/transactions made
SELECT COUNT(transaction_id) AS number_of_transactions
FROM "SALES"."CASESTUDY"."BRIGHT_COFFEE_SHOP";

--COUNT the number of different shops we have in this data 
SELECT COUNT(DISTINCT store_id) AS number_of_shops
FROM "SALES"."CASESTUDY"."BRIGHT_COFFEE_SHOP";

-- To show us the name of the different store location which is actually 3 different shops
SELECT DISTINCT store_location, store_id
FROM "SALES"."CASESTUDY"."BRIGHT_COFFEE_SHOP";

--How to calculate the revenue by store location 
SELECT store_location,
       SUM(transaction_qty*unit_price) AS revenue
FROM "SALES"."CASESTUDY"."BRIGHT_COFFEE_SHOP"
GROUP BY store_location;

-- What time does the shop opens
SELECT MIN(transaction_time) openig_time
FROM "SALES"."CASESTUDY"."BRIGHT_COFFEE_SHOP";

-- What time does the shop close
SELECT MAX(transaction_time) closing_time
FROM "SALES"."CASESTUDY"."BRIGHT_COFFEE_SHOP";
SELECT
  Transaction_date,
  YEAR(Transaction_date) AS Year,
  MONTH(Transaction_date) AS Month,
  MONTHNAME(Transaction_date) AS Month_Name,
  DAY(Transaction_date) AS Day_Of_Month,
  DAYNAME(Transaction_date) AS Day_Name,
  CASE 
    WHEN DAYNAME(Transaction_date) IN ('Saturday', 'Sunday') THEN 'Weekend'
    ELSE 'Weekday'
  END AS Day_Of_Week_Classification,
  Store_location,
  FROM "SALES"."CASESTUDY"."BRIGHT_COFFEE_SHOP";
  SELECT MAX(transaction_time) closing_time
FROM "SALES"."CASESTUDY"."BRIGHT_COFFEE_SHOP";
SELECT
  product_category,
  SUM(transaction_qty * unit_price) AS revenue,
  store_location,
  transaction_date,
  YEAR(transaction_date) AS Year,
  MONTH(transaction_date) AS Month,
  MONTHNAME(transaction_date) AS Month_Name,
  DAY(transaction_date) AS Day_Of_Month,
  DAYNAME(transaction_date) AS Day_Name,
  transaction_time,
  CASE
    WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN '01. Morning'
    WHEN transaction_time BETWEEN '12:00:00' AND '15:59:59' THEN '02. Afternoon'
    WHEN transaction_time BETWEEN '16:00:00' AND '19:59:59' THEN '03. Evening'
    WHEN transaction_time >= '20:00:00' THEN '04. Night'
  END AS time_bucket
FROM "SALES"."CASESTUDY"."BRIGHT_COFFEE_SHOP"
WHERE transaction_date > '2023-01-01'
GROUP BY 
  product_category,
  store_location,
  transaction_date,
  YEAR(transaction_date),
  MONTH(transaction_date),
  MONTHNAME(transaction_date),
  DAY(transaction_date),
  DAYNAME(transaction_date),
  transaction_time,
  time_bucket
ORDER BY revenue DESC;



 
-----------------------


    
    
    
    ,
   


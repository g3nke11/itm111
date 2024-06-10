-- -------------------------------------------------------------------------------------------

USE magazine;


-- (REMINDER: With all of these problems, make sure you use aliases, such as "3% off,")
-- -------------------------------------------------------------------------------------------
-- 1. List the magazine name and then take 3% off the magazine price 
--    and round to two decimal places.
-- -------------------------------------------------------------------------------------------
SELECT magazineName,
		ROUND((magazinePrice - (magazinePrice * 0.03)), 2) AS "3% off"
FROM magazine;

-- -------------------------------------------------------------------------------------------
-- 2. Show the primary key of id from the subscriber table 
--    and using the date of 2020-12-20 as if it were today's date, 
--    how long in years, ROUNDED to the nearest year, has it been since their subscription started?  
-- -------------------------------------------------------------------------------------------
SELECT subscriberKey,
		ROUND(DATEDIFF("2020-12-20", subscriptionStartDate)/365, 0) AS "Years since subscription"
FROM subscription;

-- -------------------------------------------------------------------------------------------
-- 3. Show the subscriptionStartDate and subscriptionLength 
--    and add the subscriptionLength to the subscriptionStartDate 
--    to see the date of how long their subscription will go. 
--    After you have that date, then include the format function 
--    to change the date to the format of: September 1, 2023.
-- -------------------------------------------------------------------------------------------
SELECT subscriptionStartDate,
		subscriptionLength,
        DATE_FORMAT(DATE_ADD(subscriptionStartDate, INTERVAL subscriptionLength MONTH), "%M %d, %Y") AS "Subscription end"
FROM subscription;


USE bike;

-- -------------------------------------------------------------------------------------------
-- 4. We need a list of all the products without the year 
--    at the end of the product_name string. 
--    Notice that some have two years listed, 
--    make sure you take those off as well. 
--    Order your results by product_id and 
--    limit your results to the first 14.
-- -------------------------------------------------------------------------------------------
SELECT SUBSTRING(product_name, 1, LOCATE(" - ", product_name)) AS "Product Name without Year"
FROM product
ORDER BY product_id
LIMIT 14;

-- -------------------------------------------------------------------------------------------
-- 5. List the 2019 model year bikes, their price, 
--    show the amount needed for a 10% down payment 
--    and divide the remaining balance into 4 equal payments. 
--    Display all monetary values with a dollar sign, 
--    comma at the thousands place and two decimal places. 
--    Adjust the column headings to appear as the screenshot shows.
-- -------------------------------------------------------------------------------------------
SELECT product_name AS "Bike",
		CONCAT("$", list_price) AS Price,
        CONCAT("$", ROUND(list_price * 0.1), ".00") AS "10% Down",
        CONCAT("$", ROUND((list_price - (list_price * 0.1)) / 4), ".00") AS "Four Equal Payments"
FROM product
WHERE model_year = 2019;
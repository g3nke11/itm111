-- ------------------------------------------------------------------------------------

USE v_art;

-- ------------------------------------------------------------------------------------
-- 1. The manager wants to add the artist Milo Rambaldi as an artist in the database.
--    He was born in 1444, died in 1495, and is from Italy. 
--    He is not a local artist. 
--    Write what the insert statement would look like that 
--    would run as the manager adds a new artist to the system. 
--    (HINT: assign this artist a primary key that is next in sequence for the Artist table)
-- ------------------------------------------------------------------------------------
INSERT INTO artist
(fname,
lname,
dob,
dod,
country,
local)
VALUES
('Milo', 
'Rambaldi',
1444,
1495,
'Italy',
'n');

-- ------------------------------------------------------------------------------------
-- 2. The manager wants to list all the artists sorted by the last name of the artist.
--    Write the query that would allow the 7 columns of values 
--    (all but the primary key) to show up alphabetically by the last name. 
-- ------------------------------------------------------------------------------------
SELECT fname,
		mname,
        lname,
        dob,
        dod,
        country,
        local
FROM artist
ORDER BY lname ASC
LIMIT 7;

-- ------------------------------------------------------------------------------------
-- 3. The manager wants to edit Rambaldi's information. 
--    She finds out that he died in 1496 not 1495. 
--    The manager changes the 'Date of Death' (dod) value to be 1496 and clicks 'Apply'
--    Write the SQL statement that will run in the background to accomplish this edit. 
--   (The UPDATE should include a WHERE clause!)
-- ------------------------------------------------------------------------------------
UPDATE artist SET dod = 1496 WHERE artist_id = 10;

-- ------------------------------------------------------------------------------------------
-- 4. The manager decides that she wants to delete Rambaldi as an artist from her database.
--    Write the SQL statement that would delete Milo Rambaldi from the database. 
--    (Don't forget a WHERE clause!)
-- ------------------------------------------------------------------------------------------
DELETE FROM artist WHERE artist_id = 10;


-- ~
USE bike;
-- ~
-- ------------------------------------------------------------------------------------
-- 5.  There is a product demonstration and bike race planned in Oakland, California 
--     and you'd like to text each of your customers from that city
--     to see if they will participate.
--     You need a list of their first and last names and phone numbers.
-- ------------------------------------------------------------------------------------
SELECT first_name,
		last_name,
        phone
FROM customer
WHERE city = 'Oakland';

-- ------------------------------------------------------------------------------------
-- 6. You need to sell more of your high-end bikes. 
--    You want to take $500 off all bikes that have a list price of $5,000.00 or more.
--    You need to have a list showing the bike name, list price and discount price 
--    with an alias of 'Discount Price'. 
--    Order the list showing the most expensive bike first
-- ------------------------------------------------------------------------------------
SELECT product_name,
		list_price,
        list_price - 500 AS 'Discount Price'
FROM product
WHERE list_price >= 5000
ORDER BY list_price DESC;

-- ------------------------------------------------------------------------------------
-- 7. An important announcement was given to all the staff at your store (store_id 1).
--    The same announcement needs to get to all the other staff at the other stores.
--    You don't want to email all your staff again.
--    You need a list of all the staff and their email who are not from your store.
-- ------------------------------------------------------------------------------------
SELECT first_name,
		last_name,
        email
FROM staff
WHERE store_id != 1;

-- ------------------------------------------------------------------------------------
-- 8. A customer needs more information about a specific bike, 
--    but all they know is that is has the word 'spider' in the name. 
--    You need to list the name, model year, and list price of all the bikes 
--    with the word 'spider' somewhere in the name. 
-- ------------------------------------------------------------------------------------
SELECT product_name,
		model_year,
        list_price
FROM product
WHERE product_name LIKE '%spider%';

-- ------------------------------------------------------------------------------------
-- 9. You need to list all bikes names 
--    that have a range of prices from $500 to $550 sorted with the lowest price first.
-- ------------------------------------------------------------------------------------
SELECT product_name,
		list_price
FROM product
WHERE list_price BETWEEN 500 AND 550
ORDER BY list_price;

-- ------------------------------------------------------------------------------------------
-- 10. Show the customer's first_name, last_name, phone, street, city, state, zip_code who:
--     have a phone number listed
--     AND whose city has the letters 'ach' or 'och' somewhere in their name of the city
--     OR whose last name is William 
--     (HINT: because of the OR, someone with last name William 
--            does not have to have a phone number or live in an 'ach'/'och' city). 
--     Limit the result set to the first 5 results.
-- ------------------------------------------------------------------------------------------
SELECT first_name,
		last_name,
        phone,
        street,
        city,
        state,
        zip_code
FROM customer
WHERE (phone IS NOT NULL AND (city LIKE '%ach%' OR city LIKE '%och%'))
		OR last_name = 'William'
LIMIT 5;

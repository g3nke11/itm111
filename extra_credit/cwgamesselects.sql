-- Questions for Concept Workshop using cwgames -- COPYRIGHT Nicholas Boss 2024

USE cwgames;
--------------------------------------
            -- WEEK 07 --
--------------------------------------
--------------------------------------
-- Question 1 
-- Difficulty: Easy
-- Practice
--------------------------------------
-- What are the titles of the games and when were they released? Which is the oldest game?
SELECT game_title,
		release_date
FROM game
ORDER BY release_date;

--------------------------------------
-- Question 2
-- Difficulty: Easy
-- Practice
--------------------------------------
-- Find the title, release date, and rating id of all games 
-- that either contain the string 'Zelda' or have a rating M


--------------------------------------
            -- WEEK 08 --
--------------------------------------
--------------------------------------
-- Question 3
-- Difficulty: Medium
-- Practice
--------------------------------------
-- Find and round 25% of each price plus 3 dollars to 2 decimal places 
-- with an alias of 'Twenty-five Percent + $3'. 


--------------------------------------
-- Question 4
-- Difficulty: Medium
-- Practice
--------------------------------------
-- Get all rows of the game table with a single column called 'Game Name - Date' 
-- Where the column is the name and a dash with a year after it, like this: 
-- 'Legend of Zelda: Breath of the Wild - 2017'. 
-- Sort by release date in descending order.


--------------------------------------
-- Question 5
-- Difficulty: Hard
-- Example
--------------------------------------
-- How long have the games been around? 
-- Floor the date to the nearest year, 
-- add 'years' to the end of the number given 
-- and give an alias to the column name
-- Add release date at the end to double check our work
SELECT game_title,
		CONCAT(FLOOR(DATEDIFF(NOW(), release_date) / 365), ' years') AS 'Since Released'
FROM game
ORDER BY release_date;

--------------------------------------
            -- WEEK 09 --
--------------------------------------
--------------------------------------
-- Question 6
-- Difficulty: Easy
-- Practice
--------------------------------------
-- List the name and rating for each game
SELECT ga.game_title,
		ra.rating_level
FROM game ga
JOIN rating ra
	ON ga.rating_id = ra.rating_id;


--------------------------------------
-- Question 7
-- Difficulty: Medium
-- Practice
--------------------------------------
-- Make the same query as above, but also include the company. 
SELECT ga.game_title,
		ra.rating_level,
        co.company_name
FROM game ga
JOIN rating ra
	ON ga.rating_id = ra.rating_id
JOIN game_company gc
	ON ga.game_id = gc.game_id
JOIN company co
	ON co.company_id = gc.company_id;


--------------------------------------
-- Question 8
-- Difficulty: Hard
-- Example
--------------------------------------
--  Find all game companies that have charged more than $50 for a game.
--  What are the games and their prices?
SELECT co.company_name,
		ga.game_title,
        pr.price_value
FROM game_platform gp
JOIN game ga
	ON ga.game_id = gp.game_id
JOIN price pr
	ON pr.price_id = gp.price_id
JOIN game_company gc
	ON gc.game_id = ga.game_id
JOIN company co
	ON co.company_id = gc.company_id
WHERE pr.price_value >= 50;

--------------------------------------
-- Question 9
-- Difficulty: Hard
-- Practice
--------------------------------------
-- What is the company that released The Legend of Zelda: Twilight Princess?
-- Provide the game's rating, the platform(s) it is on, 
-- its price (formatted with a $),
-- and its release date formated like: January 4th, 2010
-- Provide aliases for your column names.
SELECT ga.game_title AS 'Game Title',
		co.company_name AS 'Company',
		ra.rating_level AS 'Rating',
        pl.platform_name AS 'Platform',
        CONCAT('$', pr.price_value) AS 'Price',
        DATE_FORMAT(release_date, '%M %D, %Y') AS 'Release Date'
FROM game_platform gp
JOIN game ga
	ON ga.game_id = gp.game_id
JOIN platform pl
	ON pl.platform_id = gp.platform_id
JOIN price pr
	ON pr.price_id = gp.price_id
JOIN game_company gc
	ON gc.game_id = ga.game_id
JOIN company co
	ON co.company_id = gc.company_id
JOIN rating ra
	ON ra.rating_id = ga.rating_id
WHERE ga.game_title LIKE '%Twilight%';

--------------------------------------
-- Question 10
-- Difficulty: Hard
-- Example
--------------------------------------
-- What is the largest city in the country of Argentina? 
-- What is the population of that city and what language do they speak? 
-- What percent of the population speak that language?
-- Provide the city name, population, language
-- and percentage of the population that speaks the language in that city.
-- Sort them by population from greatest to least.
-- Format the population and concat '%' to the percentage.
-- Limit to the top 3 results.
USE world;

SELECT ci.Name,
		FORMAT(ci.Population, 0, 'en'),
        cl.Language,
        CONCAT(cl.Percentage, '%')
FROM city ci
JOIN country co
	ON co.Code = ci.CountryCode
JOIN countrylanguage cl
	ON cl.CountryCode = co.Code
WHERE co.Name = 'Argentina'
ORDER BY ci.Population DESC
LIMIT 3;

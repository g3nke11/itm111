-- -------------------------------------------------------------------------------------------

USE v_art;


-- -------------------------------------------------------------------------------------------
-- 1. When you visit art.ceiwebdev.com, and you search by Period/Style 
--    and you choose Impressionism, you get two resulting images 
--    ("Woman in the Garden" and "Irises"). 
--    Write the query to return those images.
--    HINT: No join is needed. 
-- -------------------------------------------------------------------------------------------
SELECT artfile
FROM artwork
WHERE period = 'Impressionism';

-- -------------------------------------------------------------------------------------------
-- 2. When you visit art.ceiwebdev.com, and you search by Subject and type in the word flower, 
--    you get three images. Write the query to display those images.
--   (remember the keyword might have been 'flowers' but they typed 'flower')
-- -------------------------------------------------------------------------------------------
SELECT artfile
FROM artwork_keyword aw_k
JOIN artwork aw
	ON aw.artwork_id = aw_k.artwork_id
JOIN keyword k
	ON k.keyword_id = aw_k.keyword_id
WHERE k.keyword LIKE '%flower%';

-- -------------------------------------------------------------------------------------------
-- 3. List ALL the artists from the artist table, 
--    but only the related artwork from the artwork table.
--    We need the first and last name and artwork title. 
-- -------------------------------------------------------------------------------------------
SELECT fname, lname, title
FROM  artist a
LEFT JOIN artwork aw
	ON a.artist_id = aw.artist_id;


USE magazine;

-- -------------------------------------------------------------------------------------------
-- 4. List all subscriptions with magazine name, last and first name.
--    Sort alphabetically by magazine name.
-- -------------------------------------------------------------------------------------------
SELECT m.magazineName,
		s.subscriberLastName,
        s.subscriberFirstName
FROM subscription sm
JOIN magazine m
	ON m.magazineKey = sm.magazineKey
JOIN subscriber s
	ON s.subscriberKey = sm.subscriberKey
ORDER BY m.magazineName;

-- -------------------------------------------------------------------------------------------
-- 5.  List all the magazines that Samantha Sanders subscribes to. 
-- -------------------------------------------------------------------------------------------
SELECT m.magazineName
FROM subscription sm
JOIN magazine m
	ON m.magazineKey = sm.magazineKey
JOIN subscriber s
	ON s.subscriberKey = sm.subscriberKey
WHERE s.subscriberFirstName = 'Samantha' AND s.subscriberLastName = 'Sanders';


USE employees;


-- -------------------------------------------------------------------------------------------
-- 6. List the first 5 employees from the Customer Service Department. 
--    Put them in alphabetical order by last name.
-- -------------------------------------------------------------------------------------------
SELECT emp.first_name,
		emp.last_name
FROM dept_emp de
JOIN departments dp
	ON dp.dept_no = de.dept_no
JOIN employees emp
	ON emp.emp_no = de.emp_no
WHERE dp.dept_name = 'Customer Service'
ORDER BY emp.last_name
LIMIT 5;

-- -------------------------------------------------------------------------------------------
-- 7. Find out the current salary and department of Mayuko Warwick. 
--    You can use the ORDER BY and LIMIT to get just the most recent salary. 
--    Format the salary to be readable (Use FORMAT())
-- -------------------------------------------------------------------------------------------
SELECT emp.first_name,
		emp.last_name,
        dp.dept_name,
        CONCAT("$", FORMAT(sa.salary, 0, 'en_US')) AS 'salary'
FROM dept_emp de
JOIN departments dp
	ON dp.dept_no = de.dept_no
JOIN employees emp
	ON emp.emp_no = de.emp_no
JOIN salaries sa
	ON sa.emp_no = de.emp_no
WHERE emp.first_name = 'Mayuko' 
	AND emp.last_name = 'Warwick'
ORDER BY sa.salary DESC
LIMIT 1;
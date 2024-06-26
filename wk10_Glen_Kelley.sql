-- -------------------------------------------------------------------------------------------

USE bike;

-- -------------------------------------------------------------------------------------------
-- 1. Get the average quantity that we have in all our bike stocks.
--    Round to the nearest whole number.
-- -------------------------------------------------------------------------------------------
SELECT FLOOR(AVG(quantity)) AS 'Stock Average'
FROM stock;

-- -------------------------------------------------------------------------------------------
-- 2. Show each bike that needs to be reordered
--    (those bikes that are out of stock).
--    Filter the results to only the lowest quantity of zero.
-- -------------------------------------------------------------------------------------------
SELECT p.product_name
FROM product p
JOIN stock s
	ON p.product_id = s.product_id
WHERE quantity IN (0)
ORDER BY product_name;

-- -------------------------------------------------------------------------------------------
-- 3. How many bikes for each category of bike do we have in stock at
--    our "Rowlett Bikes" store. We need to see the name of the category
--    as well as the number of bikes in the category.
--    Sort it by lowest total first.
-- -------------------------------------------------------------------------------------------
SELECT c.category_name,
		SUM(so.quantity) AS 'instock'
FROM product p
JOIN stock so
	ON p.product_id = so.product_id
JOIN category c
	ON c.category_id = p.category_id
JOIN store st
	ON st.store_id = so.store_id
WHERE so.quantity != (0) AND st.store_name LIKE '%Rowlett Bikes%'
GROUP BY c.category_name
ORDER BY instock;



USE employees;


-- -------------------------------------------------------------------------------------------
-- 4. How many employees do we have?
-- -------------------------------------------------------------------------------------------
SELECT COUNT(last_name) AS 'Number of Employees'
FROM employees;

-- -------------------------------------------------------------------------------------------
-- 5. Get the average salaries in each department.
--    We only need those departments that have
--    average salaries that are below 60,000.
--    Format the salary to 2 decimal places and a comma
--    in the thousands place and dollar sign in front. 
-- -------------------------------------------------------------------------------------------
SELECT dp.dept_name,
		CONCAT("$", FORMAT(AVG(sa.salary), 2)) AS 'average_salary'
FROM dept_emp de
JOIN salaries sa
	ON sa.emp_no = de.emp_no
JOIN departments dp
	ON dp.dept_no = de.dept_no
GROUP BY dept_name
HAVING AVG(sa.salary) < 60000;

-- -------------------------------------------------------------------------------------------
-- 6. Find out how many males work in each department
--    List the department name and number of male workers,
--    ordered from most to least.
-- -------------------------------------------------------------------------------------------
SELECT dp.dept_name,
		FORMAT(COUNT(em.gender), 0) AS 'Number of Males'
FROM dept_emp de
JOIN employees em
	ON em.emp_no = de.emp_no
JOIN departments dp
	ON dp.dept_no = de.dept_no
WHERE em.gender LIKE ('M')
GROUP BY dept_name
ORDER BY COUNT(em.gender) DESC;
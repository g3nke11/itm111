
USE `university`;

-- ----------------------------------------------------------------------
-- Query 1: Students, and their birthdays, of students born in September. 
--          Format the date to look like it is shown in the result set. 
-- ----------------------------------------------------------------------
SELECT person_first_name AS 'first_name',
		person_last_name AS 'last_name',
        DATE_FORMAT(person_birthdate, "%M %d, %Y") AS 'September Birthdays'
FROM person
WHERE MONTH(person_birthdate) = 9;

-- ----------------------------------------------------------------------------
-- Query 2: Student's age in years and days as of Jan. 5, 2017.  
--          Sorted from oldest to youngest. No duplicates  
--          (You can assume a 365 day year and ignore leap day.) 
--          Hint: Use the mod function to calculate the days left over 
--                after dividing by full years. 
--          The 5th column is just the 3rd and 4th column combined with labels.
-- ----------------------------------------------------------------------------
SELECT DISTINCT
		p.person_last_name AS 'last_name',
		p.person_first_name AS 'first_name',
        p.person_birthdate AS 'dob',
        FLOOR(DATEDIFF('2017-01-05', p.person_birthdate) / 365) AS 'Years',
        MOD(DATEDIFF('2017-01-05', p.person_birthdate), 365) AS 'Days',
        CONCAT(FLOOR(DATEDIFF('2017-01-05', p.person_birthdate) / 365),
        ' - Yrs, ',
        MOD(DATEDIFF('2017-01-05', p.person_birthdate), 365),
        ' - Days') AS 'Years and Days'
FROM person p
JOIN enrollment e
ON p.person_id = e.person_id
JOIN role r
ON r.role_id = e.role_id
WHERE role_type LIKE '%Student%'
ORDER BY p.person_birthdate;

-- ----------------------------------------------------------------------
-- Query 3: Who is enrolled in Organ Lessons I.
--          Sort by person_type.
-- ----------------------------------------------------------------------
SELECT DISTINCT
		p.person_first_name AS 'first_name',
		p.person_last_name AS 'last_name',
        r.role_type AS 'person_type'        
FROM person p
JOIN enrollment e
ON p.person_id = e.person_id
JOIN section s
ON s.section_id = e.section_id
JOIN course c
ON c.course_id = s.course_id
JOIN role r
ON r.role_id = e.role_id
WHERE course_title LIKE '%Organ Lessons%'
ORDER BY r.role_type;

-- ----------------------------------------------------------------------
-- Query 4: Find the TAs. What are their names? 
--          Confirm that they are in fact TAs, 
--          and find what course they TA for.
-- ----------------------------------------------------------------------
SELECT DISTINCT
		p.person_first_name AS 'first_name',
		p.person_last_name AS 'last_name',
        r.role_type AS 'person_type' ,
        c.course_title AS 'course_title'
FROM person p
JOIN enrollment e
ON p.person_id = e.person_id
JOIN section s
ON s.section_id = e.section_id
JOIN course c
ON c.course_id = s.course_id
JOIN role r
ON r.role_id = e.role_id
WHERE r.role_type LIKE '%TA%';

-- ----------------------------------------------------------------------
-- Query 5: Students that take Data Intuition and Insight in Fall 2024
--          Sort by student last name.
-- ----------------------------------------------------------------------
SELECT DISTINCT
		p.person_first_name AS 'first_name',
		p.person_last_name AS 'last_name'
FROM person p
JOIN enrollment e
ON p.person_id = e.person_id
JOIN section s
ON s.section_id = e.section_id
JOIN course c
ON c.course_id = s.course_id
JOIN term t
ON t.term_id = s.term_id
JOIN role r
ON r.role_id = e.role_id
WHERE c.course_title LIKE '%Data Intuition and Insight%' AND 
		t.term_season LIKE '%Fall%' AND t.term_year = 2024 AND
        r.role_type LIKE '%Student%'
ORDER BY p.person_last_name;

-- ----------------------------------------------------------------------
-- Query 6: A report showing all of Bryce Carlson's courss for Winter
--          Sort by the name of the course.
-- ----------------------------------------------------------------------
SELECT DISTINCT
		c.course_code AS 'course_code',
		c.course_num AS 'course_number',
        c.course_title AS 'course_name'
FROM person p
JOIN enrollment e
ON p.person_id = e.person_id
JOIN section s
ON s.section_id = e.section_id
JOIN course c
ON c.course_id = s.course_id
JOIN term t
ON t.term_id = s.term_id
WHERE p.person_first_name LIKE '%Bryce%' AND
			p.person_last_name LIKE '%Carlson%' AND
            t.term_season LIKE '%Winter%'
ORDER BY c.course_title;

-- ----------------------------------------------------------------------
-- Query 7: The number of students enrolled for Fall 2024
-- ----------------------------------------------------------------------
SELECT -- Not done yet
		t.term_season as 'term_name',
        t.term_year as 'term_year',
		COUNT(DISTINCT p.person_first_name) AS 'Enrollment'
FROM person p
JOIN enrollment e
ON p.person_id = e.person_id
JOIN section s
ON s.section_id = e.section_id
JOIN term t
ON t.term_id = s.term_id
JOIN role r
ON r.role_id = e.role_id
WHERE t.term_season = 'Fall' AND t.term_year = 2024 
		AND r.role_type = 'Student'
GROUP BY t.term_season, t.term_year;

-- ----------------------------------------------------------------------
-- Query 8: The number of courses in each department. 
--          Sort by department name.
-- ----------------------------------------------------------------------
SELECT DISTINCT
		dp.department_name as 'department_name',
		COUNT(c.course_title) AS 'Courses'
FROM course c
JOIN degree dg
ON dg.degree_id = c.degree_id
JOIN department dp
ON dp.department_id = dg.department_id
GROUP BY dp.department_name;

-- ---------------------------------------------------------------------------
-- Query 9: The total number of students each professor can teach in Winter.
--          Sort by that total number of students (teaching capacity).
-- ---------------------------------------------------------------------------
SELECT
		p.person_first_name AS 'first_name',
        p.person_last_name AS 'last_name',
        SUM(s.section_capacity) AS 'TeachingCapacity'
FROM enrollment e
JOIN person p
ON p.person_id = e.person_id
JOIN role r
ON r.role_id = e.role_id
JOIN section s
ON s.section_id = e.section_id
JOIN term t
ON t.term_id = s.term_id
WHERE r.role_type = 'Teacher' AND
		t.term_season = 'Winter' AND t.term_year = 2025
GROUP BY p.person_first_name, p.person_last_name
ORDER BY TeachingCapacity;

-- ---------------------------------------------------------------------------
-- Query 10: Each student's total credit load for Fall, 
--           but only students with a credit load greater than three.
--           Sort by credit load in descending order. 
-- ---------------------------------------------------------------------------
SELECT 
		p.person_last_name AS 'last_name',
        p.person_first_name AS 'first_name',
        SUM(c.course_credits) AS 'Credits'
FROM enrollment e
JOIN person p
ON p.person_id = e.person_id
JOIN role r
ON r.role_id = e.role_id
JOIN section s
ON s.section_id = e.section_id
JOIN course c
ON c.course_id = s.course_id
JOIN term t
ON t.term_id = s.term_id
WHERE t.term_season = 'Fall' AND t.term_year = 2024 AND
		r.role_type = 'Student'
GROUP BY p.person_last_name, p.person_first_name
HAVING SUM(c.course_credits) > 3;
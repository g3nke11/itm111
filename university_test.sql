USE university;

SELECT p.person_first_name AS 'first_name',
		p.person_last_name AS 'last_name',
        r.role_type AS 'person_type',
        CONCAT(c.course_code, ' ', c.course_num) AS 'cource',
        s.section_number,
        t.term_season AS 'term_name',
        t.term_year
FROM enrollment e
INNER JOIN section s ON s.section_id = e.section_id
INNER JOIN course c ON s.course_id = c.course_id
INNER JOIN term t ON s.term_id = t.term_id
INNER JOIN person p ON p.person_id = e.person_id
INNER JOIN role r ON r.role_id = e.role_id
WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Bryce Carlson';
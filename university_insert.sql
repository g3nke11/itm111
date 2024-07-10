-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `university` ;

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`department` ;

CREATE TABLE IF NOT EXISTS `university`.`department` (
  `department_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`degree`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`degree` ;

CREATE TABLE IF NOT EXISTS `university`.`degree` (
  `degree_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `degree_name` VARCHAR(45) NOT NULL,
  `department_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`degree_id`),
  INDEX `fk_degree_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_degree_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `university`.`department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`course` ;

CREATE TABLE IF NOT EXISTS `university`.`course` (
  `course_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `course_code` VARCHAR(45) NOT NULL,
  `course_num` VARCHAR(45) NOT NULL,
  `course_title` VARCHAR(45) NOT NULL,
  `course_credits` INT NOT NULL,
  `degree_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_degree1_idx` (`degree_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_degree1`
    FOREIGN KEY (`degree_id`)
    REFERENCES `university`.`degree` (`degree_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`person`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`person` ;

CREATE TABLE IF NOT EXISTS `university`.`person` (
  `person_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_first_name` VARCHAR(45) NOT NULL,
  `person_last_name` VARCHAR(45) NOT NULL,
  `person_gender` VARCHAR(45) NULL,
  `person_city` VARCHAR(45) NULL,
  `person_state` VARCHAR(2) NULL,
  `person_birthdate` DATE NULL,
  PRIMARY KEY (`person_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`role` ;

CREATE TABLE IF NOT EXISTS `university`.`role` (
  `role_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`term`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`term` ;

CREATE TABLE IF NOT EXISTS `university`.`term` (
  `term_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_season` VARCHAR(45) NOT NULL,
  `term_year` YEAR(4) NOT NULL,
  PRIMARY KEY (`term_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`section` ;

CREATE TABLE IF NOT EXISTS `university`.`section` (
  `section_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `section_number` VARCHAR(45) NOT NULL,
  `section_capacity` INT NOT NULL,
  `course_id` INT UNSIGNED NOT NULL,
  `term_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `university`.`term` (`term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `university`.`enrollment` ;

CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `enrollment_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `person_id` INT UNSIGNED NOT NULL,
  `role_id` INT UNSIGNED NOT NULL,
  `section_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`enrollment_id`),
  INDEX `fk_enrollment_person1_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_enrollment_role1_idx` (`role_id` ASC) VISIBLE,
  INDEX `fk_enrollment_section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_enrollment_person1`
    FOREIGN KEY (`person_id`)
    REFERENCES `university`.`person` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `university`.`role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_enrollment_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO department
(department_name)
VALUES
('Computer Science and Engineering'),
('Mathematics'),
('Music');

INSERT INTO degree
(degree_name,
department_id)
VALUES
('Computer Science',
(SELECT department_id FROM department WHERE department_name = 'Computer Science and Engineering')),
('Data Science',
(SELECT department_id FROM department WHERE department_name = 'Mathematics')),
('Organ Performance',
(SELECT department_id FROM department WHERE department_name = 'Music'));

INSERT INTO course
(course_code,
course_num,
course_title,
course_credits,
degree_id)
VALUES
('CSE',
'180',
'Algorithmic Thinking',
2,
(SELECT degree_id FROM degree WHERE degree_name = 'Computer Science')),
('CSE',
'110',
'Intro to Programming',
3,
(SELECT degree_id FROM degree WHERE degree_name = 'Computer Science')),
('DS',
'150',
'Data Intuition and Insight',
2,
(SELECT degree_id FROM degree WHERE degree_name = 'Data Science')),
('MUSIC',
'160B',
'Organ Lessons I',
2,
(SELECT degree_id FROM degree WHERE degree_name = 'Organ Performance'));

INSERT INTO term
(term_season,
term_year)
VALUES
('Fall',
2024),
('Winter',
2025);

INSERT INTO section
(section_number,
section_capacity,
course_id,
term_id)
VALUES
(1,
30,
(SELECT course_id FROM course WHERE course_code = 'CSE' AND course_num = '180'),
(SELECT term_id FROM term WHERE term_season = 'Fall' AND term_year = 2024)),
(1,
50,
(SELECT course_id FROM course WHERE course_code = 'CSE' AND course_num = '110'),
(SELECT term_id FROM term WHERE term_season = 'Fall' AND term_year = 2024)),
(2,
45,
(SELECT course_id FROM course WHERE course_code = 'CSE' AND course_num = '110'),
(SELECT term_id FROM term WHERE term_season = 'Fall' AND term_year = 2024)),
(1,
35,
(SELECT course_id FROM course WHERE course_code = 'DS' AND course_num = '150'),
(SELECT term_id FROM term WHERE term_season = 'Fall' AND term_year = 2024)),
(1,
30,
(SELECT course_id FROM course WHERE course_code = 'MUSIC' AND course_num = '160B'),
(SELECT term_id FROM term WHERE term_season = 'Fall' AND term_year = 2024)),
(2,
30,
(SELECT course_id FROM course WHERE course_code = 'CSE' AND course_num = '180'),
(SELECT term_id FROM term WHERE term_season = 'Winter' AND term_year = 2025)),
(3,
35,
(SELECT course_id FROM course WHERE course_code = 'CSE' AND course_num = '180'),
(SELECT term_id FROM term WHERE term_season = 'Winter' AND term_year = 2025)),
(1,
50,
(SELECT course_id FROM course WHERE course_code = 'CSE' AND course_num = '110'),
(SELECT term_id FROM term WHERE term_season = 'Winter' AND term_year = 2025)),
(2,
50,
(SELECT course_id FROM course WHERE course_code = 'CSE' AND course_num = '110'),
(SELECT term_id FROM term WHERE term_season = 'Winter' AND term_year = 2025)),
(1,
30,
(SELECT course_id FROM course WHERE course_code = 'MUSIC' AND course_num = '160B'),
(SELECT term_id FROM term WHERE term_season = 'Winter' AND term_year = 2025));


INSERT INTO person
(person_first_name,
person_last_name,
person_gender,
person_city,
person_state,
person_birthdate)
VALUES
('Marty',
'Morring',
NULL,
NULL,
NULL,
NULL),
('Nate',
'Norris',
NULL,
NULL,
NULL,
NULL),
('Ben',
'Barrus',
NULL,
NULL,
NULL,
NULL),
('John',
'Jensen',
NULL,
NULL,
NULL,
NULL),
('Bill',
'Barney',
NULL,
NULL,
NULL,
NULL),
('Paul',
'Miller',
'M',
'Dallas',
'TX',
'1996-02-22'),
('Katie',
'Smith',
'F',
'Provo',
'UT',
'1995-07-22'),
('Kelly',
'Jones',
'F',
'Provo',
'UT',
'1998-06-22'),
('Devon',
'Merrill',
'M',
'Mesa',
'AZ',
'2000-07-22'),
('Mandy',
'Murdock',
'F',
'Topeka',
'KS',
'1996-11-22'),
('Alece',
'Adams',
'F',
'Rigby',
'ID',
'1997-05-22'),
('Bryce',
'Carlson',
'M',
'Bozeman',
'MT',
'1997-11-22'),
('Preston',
'Larsen',
'M',
'Decatur',
'TN',
'1996-09-22'),
('Julia',
'Madsen',
'F',
'Rexburg',
'ID',
'1998-09-22'),
('Susan',
'Sorensen',
'F',
'Mesa',
'AZ',
'1998-08-09');

INSERT INTO role
(role_type)
VALUES
('Teacher'),
('Student'),
('TA');

INSERT INTO enrollment
(person_id, section_id, role_id)
VALUES
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Marty Morring')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Marty Morring')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_number = 2)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Nate Norris')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Nate Norris')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_number = 2)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Nate Norris')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Nate Norris')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_number = 2)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Ben Barrus')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'DS 150'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'John Jensen')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'John Jensen')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Ben Barrus')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_number = 3)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Teacher')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Paul Miller')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Paul Miller')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_number = 2)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Katie Smith')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'DS 150'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Kelly Jones')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'DS 150'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Devon Merrill')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Mandy Murdock')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'DS 150'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Mandy Murdock')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Fall 2024'
   AND   CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Alece Adams')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_number = 3)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'TA')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Bryce Carlson')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_number = 2)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Bryce Carlson')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'TA')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Bryce Carlson')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'MUSIC 160B'
   AND   section_number = 1)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Preston Larsen')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_number = 2)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Julia Madsen')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 110'
   AND   section_number = 2)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Student')
),
( (SELECT person_id 
   FROM person 
   WHERE CONCAT(person_first_name, ' ', person_last_name) = 'Susan Sorensen')
, (SELECT section_id
   FROM   section s
   INNER JOIN course c ON s.course_id = c.course_id
   INNER JOIN term t ON s.term_id = t.term_id
   WHERE CONCAT(term_season, ' ', term_year) = 'Winter 2025'
   AND   CONCAT(course_code, ' ', course_num) = 'CSE 180'
   AND   section_number = 2)
, (SELECT role_id 
   FROM role 
   WHERE role_type = 'Student')
);
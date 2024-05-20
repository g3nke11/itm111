-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema church
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `church` ;

-- -----------------------------------------------------
-- Schema church
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `church` ;
USE `church` ;

-- -----------------------------------------------------
-- Table `church`.`unit_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `church`.`unit_type` ;

CREATE TABLE IF NOT EXISTS `church`.`unit_type` (
  `unit_type_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `unit_type_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`unit_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `church`.`unit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `church`.`unit` ;

CREATE TABLE IF NOT EXISTS `church`.`unit` (
  `unit_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `unit_name` VARCHAR(45) NOT NULL,
  `unit_type_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`unit_id`),
  INDEX `fk_unit_unit_type_idx` (`unit_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_unit_unit_type`
    FOREIGN KEY (`unit_type_id`)
    REFERENCES `church`.`unit_type` (`unit_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `church`.`organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `church`.`organization` ;

CREATE TABLE IF NOT EXISTS `church`.`organization` (
  `organization_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`organization_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `church`.`member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `church`.`member` ;

CREATE TABLE IF NOT EXISTS `church`.`member` (
  `member_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_fname` VARCHAR(45) NOT NULL,
  `member_lname` VARCHAR(45) NOT NULL,
  `member_dob` DATE NOT NULL,
  `unit_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`member_id`),
  INDEX `fk_member_unit1_idx` (`unit_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_unit1`
    FOREIGN KEY (`unit_id`)
    REFERENCES `church`.`unit` (`unit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `church`.`position`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `church`.`position` ;

CREATE TABLE IF NOT EXISTS `church`.`position` (
  `position_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `position_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`position_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `church`.`calling`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `church`.`calling` ;

CREATE TABLE IF NOT EXISTS `church`.`calling` (
  `calling_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_id` INT UNSIGNED NOT NULL,
  `organization_id` INT UNSIGNED NOT NULL,
  `position_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`calling_id`),
  INDEX `fk_calling_member1_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_calling_organization1_idx` (`organization_id` ASC) VISIBLE,
  INDEX `fk_calling_position1_idx` (`position_id` ASC) VISIBLE,
  CONSTRAINT `fk_calling_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `church`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_calling_organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `church`.`organization` (`organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_calling_position1`
    FOREIGN KEY (`position_id`)
    REFERENCES `church`.`position` (`position_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `church`.`unit_organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `church`.`unit_organization` ;

CREATE TABLE IF NOT EXISTS `church`.`unit_organization` (
  `unit_organization_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` INT UNSIGNED NOT NULL,
  `unit_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`unit_organization_id`),
  INDEX `fk_unit_organization_organization1_idx` (`organization_id` ASC) VISIBLE,
  INDEX `fk_unit_organization_unit1_idx` (`unit_id` ASC) VISIBLE,
  CONSTRAINT `fk_unit_organization_organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `church`.`organization` (`organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_unit_organization_unit1`
    FOREIGN KEY (`unit_id`)
    REFERENCES `church`.`unit` (`unit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `church`.`mission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `church`.`mission` ;

CREATE TABLE IF NOT EXISTS `church`.`mission` (
  `mission_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mission_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mission_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `church`.`member_mission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `church`.`member_mission` ;

CREATE TABLE IF NOT EXISTS `church`.`member_mission` (
  `member_mission_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_mission_start` DATE NOT NULL,
  `member_mission_end` DATE NOT NULL,
  `mission_id` INT UNSIGNED NOT NULL,
  `member_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`member_mission_id`),
  INDEX `fk_member_mission_mission1_idx` (`mission_id` ASC) VISIBLE,
  INDEX `fk_member_mission_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_mission_mission1`
    FOREIGN KEY (`mission_id`)
    REFERENCES `church`.`mission` (`mission_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_mission_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `church`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `church`.`ordinance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `church`.`ordinance` ;

CREATE TABLE IF NOT EXISTS `church`.`ordinance` (
  `ordinance_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ordinance_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ordinance_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `church`.`member_ordinance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `church`.`member_ordinance` ;

CREATE TABLE IF NOT EXISTS `church`.`member_ordinance` (
  `member_ordinance_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_ordinance_date` DATE NOT NULL,
  `ordinance_id` INT UNSIGNED NOT NULL,
  `member_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`member_ordinance_id`),
  INDEX `fk_member_ordinance_ordinance1_idx` (`ordinance_id` ASC) VISIBLE,
  INDEX `fk_member_ordinance_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_ordinance_ordinance1`
    FOREIGN KEY (`ordinance_id`)
    REFERENCES `church`.`ordinance` (`ordinance_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_ordinance_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `church`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO unit_type (
	unit_type_name
) 
VALUES (
	'ward'
);

INSERT INTO unit
	(unit_name, unit_type_id)
VALUES
('Rexburg 1st', 1),
('Tiajuana 3rd', 1);

INSERT INTO ordinance
	(ordinance_type)
VALUES
('BabyBlessing'),
('Baptism'),
('APOrdination'),
('MPOrdination'),
('Endowment'),
('Marriage'),
('Sealing');

INSERT INTO position
(position_type)
VALUES
('1st Counselor'),
('Teacher');

INSERT INTO organization
(organization_name)
VALUES
('Elders Quorum'),
('Primary');

INSERT INTO mission
(mission_name)
VALUES
('USA Gerogia Macon'),
('Mexico Monterey');

INSERT INTO member
(member_fname,
member_lname,
member_dob,
unit_id)
VALUES
('Jared',
'MacWilliams',
'1990-01-01',
1),
('Doris',
'Garcia',
'1990-03-24',
2);

INSERT INTO unit_organization
(organization_id, unit_id)
VALUES
(1, 1),
(2, 2);

INSERT INTO member_mission
(member_mission_start,
member_mission_end,
mission_id,
member_id)
VALUES
('2009-06-23',
'2011-06-28',
1,
1),
('2011-08-11',
'2013-08-10',
2,
2);

INSERT INTO member_ordinance
(member_ordinance_date,
ordinance_id,
member_id)
VALUES
('1990-01-26',
1,
1),
('1990-01-04',
2,
1),
('2002-01-06',
3,
1),
('2009-04-08',
4,
1),
('2009-05-22',
5,
1),
('2013-09-12',
6,
1),
('2013-09-12',
7,
1),
('1998-01-04',
2,
2),
('2011-07-24',
5,
2),
('2017-04-04',
6,
2),
('2017-04-04',
7,
2);

INSERT INTO calling
(member_id,
organization_id,
position_id)
VALUES
(1, 1, 1),
(2, 2, 2);
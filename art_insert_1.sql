-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema art
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `art` ;

-- -----------------------------------------------------
-- Schema art
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `art` ;
USE `art` ;

-- -----------------------------------------------------
-- Table `art`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art`.`country` ;

CREATE TABLE IF NOT EXISTS `art`.`country` (
  `country_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art`.`style`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art`.`style` ;

CREATE TABLE IF NOT EXISTS `art`.`style` (
  `style_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `style_kind` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`style_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art`.`artist` ;

CREATE TABLE IF NOT EXISTS `art`.`artist` (
  `artist_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `artist_fname` VARCHAR(45) NOT NULL,
  `artist_lname` VARCHAR(45) NOT NULL,
  `artist_mname` VARCHAR(45) NULL,
  `artist_birth_place` VARCHAR(45) NULL,
  `country_id` INT UNSIGNED NULL,
  PRIMARY KEY (`artist_id`),
  INDEX `fk_artist_country_idx` (`country_id` ASC) VISIBLE,
  CONSTRAINT `fk_artist_country`
    FOREIGN KEY (`country_id`)
    REFERENCES `art`.`country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art`.`medium`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art`.`medium` ;

CREATE TABLE IF NOT EXISTS `art`.`medium` (
  `medium_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `medium_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`medium_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art`.`museum`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art`.`museum` ;

CREATE TABLE IF NOT EXISTS `art`.`museum` (
  `museum_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `museum_location` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`museum_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `art`.`painting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art`.`painting` ;

CREATE TABLE IF NOT EXISTS `art`.`painting` (
  `painting_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `painting_title` VARCHAR(45) NOT NULL,
  `painting_date` DATE NULL,
  `artist_id` INT UNSIGNED NOT NULL,
  `style_id` INT UNSIGNED NOT NULL,
  `medium_id` INT UNSIGNED NOT NULL,
  `museum_id` INT UNSIGNED NULL,
  PRIMARY KEY (`painting_id`),
  INDEX `fk_painting_artist1_idx` (`artist_id` ASC) VISIBLE,
  INDEX `fk_painting_style1_idx` (`style_id` ASC) VISIBLE,
  INDEX `fk_painting_medium1_idx` (`medium_id` ASC) VISIBLE,
  INDEX `fk_painting_museum1_idx` (`museum_id` ASC) VISIBLE,
  CONSTRAINT `fk_painting_artist1`
    FOREIGN KEY (`artist_id`)
    REFERENCES `art`.`artist` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_painting_style1`
    FOREIGN KEY (`style_id`)
    REFERENCES `art`.`style` (`style_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_painting_medium1`
    FOREIGN KEY (`medium_id`)
    REFERENCES `art`.`medium` (`medium_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_painting_museum1`
    FOREIGN KEY (`museum_id`)
    REFERENCES `art`.`museum` (`museum_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO country 
(country_name) 
VALUES 
('France')
,('Italy')
,('United States')
,('Netherlands')
,('Spain');

INSERT INTO artist
( artist_fname
, artist_lname
, country_id)
VALUES
('Vincent'
, 'Van Gogh'
, 1),
('Rembrandt'
, 'van Rijin'
, 4);

INSERT INTO museum
(museum_location)
VALUES
('London National Gallery')
, ('J. Paul Getty Museum');

INSERT INTO style
(style_kind)
VALUES
('Baroque')
, ('Dutch Golden Age');

INSERT INTO medium
(medium_type)
VALUES
('Oil')
, ('Tempra');


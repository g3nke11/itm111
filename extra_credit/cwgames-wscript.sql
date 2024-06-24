-- MySQL Workbench Forward Engineering -- COPYRIGHT Nicholas Boss 2024

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cwgames
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `cwgames` ;

-- -----------------------------------------------------
-- Schema cwgames
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cwgames` DEFAULT CHARACTER SET utf8 ;
USE `cwgames` ;

-- -----------------------------------------------------
-- Table `cwgames`.`rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cwgames`.`rating` ;

CREATE TABLE IF NOT EXISTS `cwgames`.`rating` (
  `rating_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rating_level` VARCHAR(4) NOT NULL COMMENT 'ESRB rating system',
  PRIMARY KEY (`rating_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cwgames`.`game`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cwgames`.`game` ;

CREATE TABLE IF NOT EXISTS `cwgames`.`game` (
  `game_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_title` VARCHAR(45) NOT NULL,
  `release_date` DATE NULL,
  `rating_id` INT UNSIGNED NULL,
  PRIMARY KEY (`game_id`),
  INDEX `game_rating_idx` (`rating_id` ASC) VISIBLE,
  CONSTRAINT `game_fk1`
    FOREIGN KEY (`rating_id`)
    REFERENCES `cwgames`.`rating` (`rating_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cwgames`.`owner`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cwgames`.`owner` ;

CREATE TABLE IF NOT EXISTS `cwgames`.`owner` (
  `owner_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`owner_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cwgames`.`company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cwgames`.`company` ;

CREATE TABLE IF NOT EXISTS `cwgames`.`company` (
  `company_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(45) NOT NULL,
  `is_developer` CHAR(1) NULL,
  `is_publisher` CHAR(1) NULL,
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cwgames`.`platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cwgames`.`platform` ;

CREATE TABLE IF NOT EXISTS `cwgames`.`platform` (
  `platform_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `platform_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`platform_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cwgames`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cwgames`.`genre` ;

CREATE TABLE IF NOT EXISTS `cwgames`.`genre` (
  `genre_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `genre_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cwgames`.`price`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cwgames`.`price` ;

CREATE TABLE IF NOT EXISTS `cwgames`.`price` (
  `price_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `price_value` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`price_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cwgames`.`game_platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cwgames`.`game_platform` ;

CREATE TABLE IF NOT EXISTS `cwgames`.`game_platform` (
  `game_platform_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_id` INT UNSIGNED NOT NULL,
  `platform_id` INT UNSIGNED NOT NULL,
  `owner_id` INT UNSIGNED NOT NULL,
  `price_id` INT UNSIGNED NULL,
  `has_played` CHAR(1) NULL,
  PRIMARY KEY (`game_platform_id`),
  INDEX `game_platform_idx1` (`platform_id` ASC) VISIBLE,
  INDEX `game_platform_idx2` (`game_id` ASC) VISIBLE,
  INDEX `game_platform_idx3` (`price_id` ASC) VISIBLE,
  INDEX `game_platform_idx4` (`owner_id` ASC) VISIBLE,
  CONSTRAINT `game_platform_fk1`
    FOREIGN KEY (`game_id`)
    REFERENCES `cwgames`.`game` (`game_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `game_platform_fk2`
    FOREIGN KEY (`platform_id`)
    REFERENCES `cwgames`.`platform` (`platform_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `game_platform_fk3`
    FOREIGN KEY (`price_id`)
    REFERENCES `cwgames`.`price` (`price_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `game_platform_fk4`
    FOREIGN KEY (`owner_id`)
    REFERENCES `cwgames`.`owner` (`owner_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cwgames`.`game_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cwgames`.`game_genre` ;

CREATE TABLE IF NOT EXISTS `cwgames`.`game_genre` (
  `game_genre_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_id` INT UNSIGNED NOT NULL,
  `genre_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`game_genre_id`),
  INDEX `game_genre_idx1` (`genre_id` ASC) VISIBLE,
  INDEX `game_game_idx2` (`game_id` ASC) VISIBLE,
  CONSTRAINT `game_genre_fk1`
    FOREIGN KEY (`game_id`)
    REFERENCES `cwgames`.`game` (`game_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `game_genre_fk2`
    FOREIGN KEY (`genre_id`)
    REFERENCES `cwgames`.`genre` (`genre_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cwgames`.`game_company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `cwgames`.`game_company` ;

CREATE TABLE IF NOT EXISTS `cwgames`.`game_company` (
  `game_company_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `game_id` INT UNSIGNED NOT NULL,
  `company_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`game_company_id`),
  INDEX `game_company_idx1` (`company_id` ASC) VISIBLE,
  INDEX `game_company_idx2` (`game_id` ASC) VISIBLE,
  CONSTRAINT `game_company_fk1`
    FOREIGN KEY (`game_id`)
    REFERENCES `cwgames`.`game` (`game_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `game_company_fk2`
    FOREIGN KEY (`company_id`)
    REFERENCES `cwgames`.`company` (`company_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

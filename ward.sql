-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ward
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ward` ;

-- -----------------------------------------------------
-- Schema ward
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ward` ;
USE `ward` ;

-- -----------------------------------------------------
-- Table `ward`.`unit_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ward`.`unit_type` ;

CREATE TABLE IF NOT EXISTS `ward`.`unit_type` (
  `unit_type_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `unit_type_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`unit_type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ward`.`unit`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ward`.`unit` ;

CREATE TABLE IF NOT EXISTS `ward`.`unit` (
  `unit_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `unit_name` VARCHAR(45) NOT NULL,
  `unit_type_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`unit_id`),
  INDEX `fk_unit_unit_type_idx` (`unit_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_unit_unit_type`
    FOREIGN KEY (`unit_type_id`)
    REFERENCES `ward`.`unit_type` (`unit_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ward`.`organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ward`.`organization` ;

CREATE TABLE IF NOT EXISTS `ward`.`organization` (
  `organization_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`organization_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ward`.`member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ward`.`member` ;

CREATE TABLE IF NOT EXISTS `ward`.`member` (
  `member_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_fname` VARCHAR(45) NOT NULL,
  `member_lname` VARCHAR(45) NOT NULL,
  `member_dob` DATE NOT NULL,
  `unit_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`member_id`),
  INDEX `fk_member_unit1_idx` (`unit_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_unit1`
    FOREIGN KEY (`unit_id`)
    REFERENCES `ward`.`unit` (`unit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ward`.`position`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ward`.`position` ;

CREATE TABLE IF NOT EXISTS `ward`.`position` (
  `position_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `position_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`position_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ward`.`calling`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ward`.`calling` ;

CREATE TABLE IF NOT EXISTS `ward`.`calling` (
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
    REFERENCES `ward`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_calling_organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `ward`.`organization` (`organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_calling_position1`
    FOREIGN KEY (`position_id`)
    REFERENCES `ward`.`position` (`position_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ward`.`unit_organization`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ward`.`unit_organization` ;

CREATE TABLE IF NOT EXISTS `ward`.`unit_organization` (
  `unit_organization_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `organization_id` INT UNSIGNED NOT NULL,
  `unit_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`unit_organization_id`),
  INDEX `fk_unit_organization_organization1_idx` (`organization_id` ASC) VISIBLE,
  INDEX `fk_unit_organization_unit1_idx` (`unit_id` ASC) VISIBLE,
  CONSTRAINT `fk_unit_organization_organization1`
    FOREIGN KEY (`organization_id`)
    REFERENCES `ward`.`organization` (`organization_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_unit_organization_unit1`
    FOREIGN KEY (`unit_id`)
    REFERENCES `ward`.`unit` (`unit_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ward`.`mission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ward`.`mission` ;

CREATE TABLE IF NOT EXISTS `ward`.`mission` (
  `mission_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mission_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mission_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ward`.`member_mission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ward`.`member_mission` ;

CREATE TABLE IF NOT EXISTS `ward`.`member_mission` (
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
    REFERENCES `ward`.`mission` (`mission_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_mission_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `ward`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ward`.`ordinance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ward`.`ordinance` ;

CREATE TABLE IF NOT EXISTS `ward`.`ordinance` (
  `ordinance_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ordinance_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ordinance_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ward`.`member_ordinance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ward`.`member_ordinance` ;

CREATE TABLE IF NOT EXISTS `ward`.`member_ordinance` (
  `member_ordinance_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `member_ordinance_date` VARCHAR(45) NULL,
  `ordinance_id` INT UNSIGNED NOT NULL,
  `member_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`member_ordinance_id`),
  INDEX `fk_member_ordinance_ordinance1_idx` (`ordinance_id` ASC) VISIBLE,
  INDEX `fk_member_ordinance_member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_member_ordinance_ordinance1`
    FOREIGN KEY (`ordinance_id`)
    REFERENCES `ward`.`ordinance` (`ordinance_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_ordinance_member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `ward`.`member` (`member_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

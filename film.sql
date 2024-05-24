-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema film
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `film` ;

-- -----------------------------------------------------
-- Schema film
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `film` ;
USE `film` ;

-- -----------------------------------------------------
-- Table `film`.`genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`genre` ;

CREATE TABLE IF NOT EXISTS `film`.`genre` (
  `genre_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `genre_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`rating` ;

CREATE TABLE IF NOT EXISTS `film`.`rating` (
  `rating_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rating_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rating_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie` ;

CREATE TABLE IF NOT EXISTS `film`.`movie` (
  `movie_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_title` VARCHAR(45) NOT NULL,
  `movie_year` YEAR(4) NOT NULL,
  `rating_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_id`),
  INDEX `fk_movie_rating1_idx` (`rating_id` ASC) VISIBLE,
  CONSTRAINT `fk_movie_rating1`
    FOREIGN KEY (`rating_id`)
    REFERENCES `film`.`rating` (`rating_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`studio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`studio` ;

CREATE TABLE IF NOT EXISTS `film`.`studio` (
  `studio_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `studio_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`studio_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`actor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`actor` ;

CREATE TABLE IF NOT EXISTS `film`.`actor` (
  `actor_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `actor_fname` VARCHAR(45) NOT NULL,
  `actor_lname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`special_feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`special_feature` ;

CREATE TABLE IF NOT EXISTS `film`.`special_feature` (
  `special_feature_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `special_feature_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`special_feature_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`media` ;

CREATE TABLE IF NOT EXISTS `film`.`media` (
  `media_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `media_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`media_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`price`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`price` ;

CREATE TABLE IF NOT EXISTS `film`.`price` (
  `price_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `price_amount` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`price_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie_actor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie_actor` ;

CREATE TABLE IF NOT EXISTS `film`.`movie_actor` (
  `movie_actor_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT UNSIGNED NOT NULL,
  `actor_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_actor_id`),
  INDEX `fk_movie_actor_movie_idx` (`movie_id` ASC) VISIBLE,
  INDEX `fk_movie_actor_actor1_idx` (`actor_id` ASC) VISIBLE,
  CONSTRAINT `fk_movie_actor_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_actor_actor1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `film`.`actor` (`actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie_special_feature`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie_special_feature` ;

CREATE TABLE IF NOT EXISTS `film`.`movie_special_feature` (
  `movie_special_feature_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `special_feature_id` INT UNSIGNED NOT NULL,
  `movie_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_special_feature_id`),
  INDEX `fk_movie_special_feature_special_feature1_idx` (`special_feature_id` ASC) VISIBLE,
  INDEX `fk_movie_special_feature_movie1_idx` (`movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_movie_special_feature_special_feature1`
    FOREIGN KEY (`special_feature_id`)
    REFERENCES `film`.`special_feature` (`special_feature_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_special_feature_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie_genre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie_genre` ;

CREATE TABLE IF NOT EXISTS `film`.`movie_genre` (
  `movie_genre_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `genre_id` INT UNSIGNED NOT NULL,
  `movie_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_genre_id`),
  INDEX `fk_movie_genre_genre1_idx` (`genre_id` ASC) VISIBLE,
  INDEX `fk_movie_genre_movie1_idx` (`movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_movie_genre_genre1`
    FOREIGN KEY (`genre_id`)
    REFERENCES `film`.`genre` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_genre_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie_price_media`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie_price_media` ;

CREATE TABLE IF NOT EXISTS `film`.`movie_price_media` (
  `movie_price_media_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT UNSIGNED NOT NULL,
  `price_id` INT UNSIGNED NULL,
  `media_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_price_media_id`),
  INDEX `fk_movie_price_media_movie1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `fk_movie_price_media_price1_idx` (`price_id` ASC) VISIBLE,
  INDEX `fk_movie_price_media_media1_idx` (`media_id` ASC) VISIBLE,
  CONSTRAINT `fk_movie_price_media_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_price_media_price1`
    FOREIGN KEY (`price_id`)
    REFERENCES `film`.`price` (`price_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_price_media_media1`
    FOREIGN KEY (`media_id`)
    REFERENCES `film`.`media` (`media_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `film`.`movie_studio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `film`.`movie_studio` ;

CREATE TABLE IF NOT EXISTS `film`.`movie_studio` (
  `movie_studio_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT UNSIGNED NOT NULL,
  `studio_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`movie_studio_id`),
  INDEX `fk_movie_studio_movie1_idx` (`movie_id` ASC) VISIBLE,
  INDEX `fk_movie_studio_studio1_idx` (`studio_id` ASC) VISIBLE,
  CONSTRAINT `fk_movie_studio_movie1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `film`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_studio_studio1`
    FOREIGN KEY (`studio_id`)
    REFERENCES `film`.`studio` (`studio_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


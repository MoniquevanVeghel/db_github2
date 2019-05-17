-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema movies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movies` ;
USE `movies` ;

-- -----------------------------------------------------
-- Table `movies`.`directors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`directors` (
  `iddirectors` INT NOT NULL,
  `director` VARCHAR(45) NULL,
  PRIMARY KEY (`iddirectors`),
  UNIQUE INDEX `iddirectors_UNIQUE` (`iddirectors` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`.`movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`movies` (
  `idmovies` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `genre` ENUM('action', 'comedy', 'drama', 'horror', 'science fiction') NULL,
  `date` DATE NULL,
  `score` INT(2) NULL,
  `comments` VARCHAR(100) NULL,
  `director_id` INT NOT NULL,
  PRIMARY KEY (`idmovies`),
  UNIQUE INDEX `idmovies_UNIQUE` (`idmovies` ASC) VISIBLE,
  INDEX `fk_director_idx` (`director_id` ASC) VISIBLE,
  CONSTRAINT `fk_director`
    FOREIGN KEY (`director_id`)
    REFERENCES `movies`.`directors` (`iddirectors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`actors` (
  `idactors` INT NOT NULL,
  `actors` VARCHAR(45) NULL,
  PRIMARY KEY (`idactors`),
  UNIQUE INDEX `idactors_UNIQUE` (`idactors` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movies`.`movies_actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies`.`movies_actors` (
  `idmovies_actors` INT NOT NULL,
  `movies_id` INT NOT NULL,
  `actors_id` INT NOT NULL,
  PRIMARY KEY (`idmovies_actors`),
  INDEX `fk_movies_idx` (`movies_id` ASC) VISIBLE,
  INDEX `fk_actors_idx` (`actors_id` ASC) VISIBLE,
  CONSTRAINT `fk_movies`
    FOREIGN KEY (`movies_id`)
    REFERENCES `movies`.`movies` (`idmovies`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actors`
    FOREIGN KEY (`actors_id`)
    REFERENCES `movies`.`actors` (`idactors`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

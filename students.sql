-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Students
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Students
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Students` ;
USE `Students` ;

-- -----------------------------------------------------
-- Table `Students`.`Trajectories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Students`.`Trajectories` (
  `idTrajectories` INT NOT NULL,
  `Trajectory` VARCHAR(45) NULL,
  PRIMARY KEY (`idTrajectories`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Students`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Students`.`Student` (
  `Student_number` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Last_name` VARCHAR(45) NOT NULL,
  `Birthdate` DATE NULL,
  `Sex` ENUM('M', 'F') NULL,
  `Trajectory_ID` INT NULL,
  PRIMARY KEY (`Student_number`),
  INDEX `fk_Trajectory_idx` (`Trajectory_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Trajectory`
    FOREIGN KEY (`Trajectory_ID`)
    REFERENCES `Students`.`Trajectories` (`idTrajectories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Students`.`Courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Students`.`Courses` (
  `ID_courses` INT NOT NULL,
  `Course` VARCHAR(45) NULL,
  `Credits` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_courses`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Students`.`Courses_of_Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Students`.`Courses_of_Student` (
  `ID` INT NOT NULL,
  `Student_ID` INT NOT NULL,
  `Course_ID` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Course_idx` (`Course_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Student`
    FOREIGN KEY (`Course_ID`)
    REFERENCES `Students`.`Student` (`Student_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Course`
    FOREIGN KEY (`Course_ID`)
    REFERENCES `Students`.`Courses` (`ID_courses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

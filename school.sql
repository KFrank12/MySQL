SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `school` ;

-- -----------------------------------------------------
-- Schema school
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `school` DEFAULT CHARACTER SET utf8 ;
USE `school` ;

-- -----------------------------------------------------
-- Table `school`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`address` ;

CREATE TABLE IF NOT EXISTS `school`.`address` (
  `ad_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `ad_street` VARCHAR(45) NOT NULL,
  `ad_number` VARCHAR(45) NOT NULL,
  `ad_city` VARCHAR(45) NOT NULL,
  `ad_postcode` INT(11) NOT NULL,
  PRIMARY KEY (`ad_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `school`.`pupil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`pupil` ;

CREATE TABLE IF NOT EXISTS `school`.`pupil` (
  `pu_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `pu_christianname` VARCHAR(45) NOT NULL,
  `pu_name` VARCHAR(45) NOT NULL,
  `pu_address_ID` INT(11) NOT NULL,
  PRIMARY KEY (`pu_ID`, `pu_address_ID`),
  INDEX `fk_pupil_address1_idx` (`pu_address_ID` ASC),
  CONSTRAINT `fk_pupil_address1`
    FOREIGN KEY (`pu_address_ID`)
    REFERENCES `school`.`address` (`ad_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `school`.`teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school`.`teacher` ;

CREATE TABLE IF NOT EXISTS `school`.`teacher` (
  `te_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `te_christianname` VARCHAR(45) NOT NULL,
  `te_name` VARCHAR(45) NOT NULL,
  `te_address_ID` INT(11) NOT NULL,
  PRIMARY KEY (`te_ID`, `te_address_ID`),
  INDEX `fk_teacher_address1_idx` (`te_address_ID` ASC),
  CONSTRAINT `fk_teacher_address1`
    FOREIGN KEY (`te_address_ID`)
    REFERENCES `school`.`address` (`ad_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

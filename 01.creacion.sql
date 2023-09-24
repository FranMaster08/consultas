-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema zara
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zara
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zara` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `zara` ;

-- -----------------------------------------------------
-- Table `zara`.`BRANDS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zara`.`BRANDS` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `NAME` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `zara`.`PRODUCTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zara`.`PRODUCTS` (
  `ID` VARCHAR(255) NOT NULL,
  `NAME` VARCHAR(255) NOT NULL,
  `DESCRIPTION` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `zara`.`PRIORITY`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zara`.`PRIORITY` (
  `ID` VARCHAR(255) NOT NULL,
  `NAME` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `zara`.`PRICES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zara`.`PRICES` (
  `BRAND_ID` INT NULL DEFAULT NULL,
  `PRODUCT_ID` VARCHAR(255) NULL DEFAULT NULL,
  `START_DATE` TIMESTAMP NULL DEFAULT NULL,
  `END_DATE` TIMESTAMP NULL DEFAULT NULL,
  `PRIORITY_ID` VARCHAR(255) NULL DEFAULT NULL,
  `PRICE_LIST_ID` INT NOT NULL AUTO_INCREMENT,
  `PRICE` FLOAT NULL DEFAULT NULL,
  `CURR` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PRICE_LIST_ID`),
  INDEX `BRAND_ID` (`BRAND_ID` ASC) VISIBLE,
  INDEX `PRODUCT_ID` (`PRODUCT_ID` ASC) VISIBLE,
  INDEX `PRIORITY_ID` (`PRIORITY_ID` ASC) VISIBLE,
  CONSTRAINT `PRICES_ibfk_1`
    FOREIGN KEY (`BRAND_ID`)
    REFERENCES `zara`.`BRANDS` (`ID`),
  CONSTRAINT `PRICES_ibfk_2`
    FOREIGN KEY (`PRODUCT_ID`)
    REFERENCES `zara`.`PRODUCTS` (`ID`),
  CONSTRAINT `PRICES_ibfk_3`
    FOREIGN KEY (`PRIORITY_ID`)
    REFERENCES `zara`.`PRIORITY` (`ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

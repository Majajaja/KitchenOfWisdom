-- MySQL Script generated by MySQL Workbench
-- Tue Dec 14 11:27:16 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tTypeIngredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tTypeIngredient` (
  `IdTypeIngredient` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdTypeIngredient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tIngredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tIngredient` (
  `IdIngredient` INT NOT NULL,
  `Nom` VARCHAR(50) NOT NULL,
  `Description` VARCHAR(150) NULL,
  `tTypeIngredient_IdTypeIngredient` INT NOT NULL,
  PRIMARY KEY (`IdIngredient`, `tTypeIngredient_IdTypeIngredient`),
  INDEX `fk_tIngredient_tTypeIngredient1_idx` (`tTypeIngredient_IdTypeIngredient` ASC),
  CONSTRAINT `fk_tIngredient_tTypeIngredient1`
    FOREIGN KEY (`tTypeIngredient_IdTypeIngredient`)
    REFERENCES `mydb`.`tTypeIngredient` (`IdTypeIngredient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tTypeRecette`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tTypeRecette` (
  `IdtTypeRecette` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdtTypeRecette`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tSource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tSource` (
  `IdtSource` INT NOT NULL,
  `ImageRecette` VARCHAR(45) NULL,
  PRIMARY KEY (`IdtSource`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tRecette`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tRecette` (
  `idRecette` INT NOT NULL,
  `Nom` VARCHAR(150) NOT NULL,
  `Description` VARCHAR(500) NULL,
  `TempsPreparation` VARCHAR(45) NULL,
  `TempsCuisson` VARCHAR(45) NULL,
  `NombrePersonne` VARCHAR(45) NULL,
  `tTypeRecette_IdtTypeRecette` INT NOT NULL,
  `tSource_IdtSource` INT NULL,
  PRIMARY KEY (`idRecette`, `tTypeRecette_IdtTypeRecette`, `tSource_IdtSource`),
  INDEX `fk_tRecette_tTypeRecette1_idx` (`tTypeRecette_IdtTypeRecette` ASC),
  INDEX `fk_tRecette_tSource1_idx` (`tSource_IdtSource` ASC),
  CONSTRAINT `fk_tRecette_tTypeRecette1`
    FOREIGN KEY (`tTypeRecette_IdtTypeRecette`)
    REFERENCES `mydb`.`tTypeRecette` (`IdtTypeRecette`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tRecette_tSource1`
    FOREIGN KEY (`tSource_IdtSource`)
    REFERENCES `mydb`.`tSource` (`IdtSource`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tRecette_has_tIngredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tRecette_has_tIngredient` (
  `tRecette_idRecette` INT NOT NULL,
  `tIngredient_IdIngredient` INT NOT NULL,
  PRIMARY KEY (`tRecette_idRecette`, `tIngredient_IdIngredient`),
  INDEX `fk_tRecette_has_tIngredient_tIngredient1_idx` (`tIngredient_IdIngredient` ASC),
  INDEX `fk_tRecette_has_tIngredient_tRecette_idx` (`tRecette_idRecette` ASC),
  CONSTRAINT `fk_tRecette_has_tIngredient_tRecette`
    FOREIGN KEY (`tRecette_idRecette`)
    REFERENCES `mydb`.`tRecette` (`idRecette`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tRecette_has_tIngredient_tIngredient1`
    FOREIGN KEY (`tIngredient_IdIngredient`)
    REFERENCES `mydb`.`tIngredient` (`IdIngredient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tLivre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tLivre` (
  `tSource_IdtSource` INT NOT NULL,
  `Nom` VARCHAR(100) NOT NULL,
  `Edition` VARCHAR(50) NULL,
  `ImageLivre` VARCHAR(45) NULL,
  INDEX `fk_tLivre_tSource1_idx` (`tSource_IdtSource` ASC),
  PRIMARY KEY (`tSource_IdtSource`),
  CONSTRAINT `fk_tLivre_tSource1`
    FOREIGN KEY (`tSource_IdtSource`)
    REFERENCES `mydb`.`tSource` (`IdtSource`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tAutre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tAutre` (
  `tSource_IdtSource` INT NOT NULL,
  `Nom` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`tSource_IdtSource`),
  INDEX `fk_tAutre_tSource1_idx` (`tSource_IdtSource` ASC),
  CONSTRAINT `fk_tAutre_tSource1`
    FOREIGN KEY (`tSource_IdtSource`)
    REFERENCES `mydb`.`tSource` (`IdtSource`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tSiteWeb`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tSiteWeb` (
  `tSource_IdtSource` INT NOT NULL,
  `Nom` INT NOT NULL,
  `LienURL` VARCHAR(500) NULL,
  PRIMARY KEY (`tSource_IdtSource`),
  INDEX `fk_tSiteWeb_tSource1_idx` (`tSource_IdtSource` ASC),
  CONSTRAINT `fk_tSiteWeb_tSource1`
    FOREIGN KEY (`tSource_IdtSource`)
    REFERENCES `mydb`.`tSource` (`IdtSource`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

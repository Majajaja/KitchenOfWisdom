-- MySQL Script generated by MySQL Workbench
-- Wed Dec 15 13:15:52 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema KitchenOfWisdom
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema KitchenOfWisdom
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `KitchenOfWisdom` DEFAULT CHARACTER SET utf8 ;
USE `KitchenOfWisdom` ;

-- -----------------------------------------------------
-- Table `KitchenOfWisdom`.`tTypeIngredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KitchenOfWisdom`.`tTypeIngredient` (
  `TYPI_Id` INT NOT NULL AUTO_INCREMENT,
  `TYPI_Nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TYPI_Id`),
  UNIQUE INDEX `IdTypeIngredient_UNIQUE` (`TYPI_Id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KitchenOfWisdom`.`tIngredient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KitchenOfWisdom`.`tIngredient` (
  `ING_Id` INT NOT NULL AUTO_INCREMENT,
  `ING_Nom` VARCHAR(50) NOT NULL,
  `ING_Description` VARCHAR(150) NULL,
  `tTypeIngredient_TYPI_Id` INT NOT NULL,
  PRIMARY KEY (`ING_Id`, `tTypeIngredient_TYPI_Id`),
  UNIQUE INDEX `IdIngredient_UNIQUE` (`ING_Id` ASC),
  INDEX `fk_tIngredient_tTypeIngredient1_idx` (`tTypeIngredient_TYPI_Id` ASC),
  CONSTRAINT `fk_tIngredient_tTypeIngredient1`
    FOREIGN KEY (`tTypeIngredient_TYPI_Id`)
    REFERENCES `KitchenOfWisdom`.`tTypeIngredient` (`TYPI_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KitchenOfWisdom`.`tSource`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KitchenOfWisdom`.`tSource` (
  `SOU_Id` INT NOT NULL AUTO_INCREMENT,
  `SOU_ImageRecette` VARCHAR(45) NULL,
  PRIMARY KEY (`SOU_Id`),
  UNIQUE INDEX `IdtSource_UNIQUE` (`SOU_Id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KitchenOfWisdom`.`tTypeRecette`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KitchenOfWisdom`.`tTypeRecette` (
  `TYPR_Id` INT NOT NULL AUTO_INCREMENT,
  `TYPR_Nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TYPR_Id`),
  UNIQUE INDEX `IdtTypeRecette_UNIQUE` (`TYPR_Id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KitchenOfWisdom`.`tRecette`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KitchenOfWisdom`.`tRecette` (
  `REC_Id` INT NOT NULL AUTO_INCREMENT,
  `REC_Nom` VARCHAR(150) NOT NULL,
  `REC_Description` VARCHAR(2500) NULL,
  `REC_TempsPreparation` VARCHAR(45) NULL,
  `REC_TempsCuisson` VARCHAR(45) NULL,
  `REC_NombrePersonne` VARCHAR(45) NULL,
  `tSource_IdtSource` INT NULL,
  `tTypeRecette_TYPR_Id` INT NOT NULL,
  PRIMARY KEY (`REC_Id`, `tTypeRecette_TYPR_Id`),
  INDEX `fk_tRecette_tSource1_idx` (`tSource_IdtSource` ASC),
  UNIQUE INDEX `idRecette_UNIQUE` (`REC_Id` ASC),
  INDEX `fk_tRecette_tTypeRecette1_idx` (`tTypeRecette_TYPR_Id` ASC),
  CONSTRAINT `fk_tRecette_tSource1`
    FOREIGN KEY (`tSource_IdtSource`)
    REFERENCES `KitchenOfWisdom`.`tSource` (`SOU_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tRecette_tTypeRecette1`
    FOREIGN KEY (`tTypeRecette_TYPR_Id`)
    REFERENCES `KitchenOfWisdom`.`tTypeRecette` (`TYPR_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KitchenOfWisdom`.`tLivre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KitchenOfWisdom`.`tLivre` (
  `tSource_SOU_Id` INT NOT NULL,
  `LIV_Nom` VARCHAR(100) NOT NULL,
  `LIV_Edition` VARCHAR(50) NULL,
  `LIV_ImageLivre` VARCHAR(45) NULL,
  PRIMARY KEY (`tSource_SOU_Id`),
  CONSTRAINT `fk_tLivre_tSource1`
    FOREIGN KEY (`tSource_SOU_Id`)
    REFERENCES `KitchenOfWisdom`.`tSource` (`SOU_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KitchenOfWisdom`.`tAutre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KitchenOfWisdom`.`tAutre` (
  `tSource_SOU_Id` INT NOT NULL,
  `AUT_Nom` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`tSource_SOU_Id`),
  CONSTRAINT `fk_tAutre_tSource1`
    FOREIGN KEY (`tSource_SOU_Id`)
    REFERENCES `KitchenOfWisdom`.`tSource` (`SOU_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KitchenOfWisdom`.`tSiteWeb`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KitchenOfWisdom`.`tSiteWeb` (
  `tSource_SOU_Id` INT NOT NULL,
  `SIT_Nom` INT NOT NULL,
  `SIT_LienURL` VARCHAR(500) NULL,
  PRIMARY KEY (`tSource_SOU_Id`),
  CONSTRAINT `fk_tSiteWeb_tSource1`
    FOREIGN KEY (`tSource_SOU_Id`)
    REFERENCES `KitchenOfWisdom`.`tSource` (`SOU_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KitchenOfWisdom`.`tUnite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KitchenOfWisdom`.`tUnite` (
  `UNI_Id` INT NOT NULL,
  `UNI_Nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`UNI_Id`),
  UNIQUE INDEX `UNI_Nom_UNIQUE` (`UNI_Nom` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `KitchenOfWisdom`.`tComposant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `KitchenOfWisdom`.`tComposant` (
  `tRecette_REC_Id` INT NOT NULL,
  `tIngredient_ING_Id` INT NOT NULL,
  `tUnite_UNI_Id` INT NOT NULL,
  `COM_Quantity` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`tRecette_REC_Id`, `tIngredient_ING_Id`, `tUnite_UNI_Id`),
  INDEX `fk_tRecette_has_tIngredient_tIngredient1_idx` (`tIngredient_ING_Id` ASC),
  INDEX `fk_tRecette_has_tIngredient_tRecette1_idx` (`tRecette_REC_Id` ASC),
  INDEX `fk_tComposant_tUnite1_idx` (`tUnite_UNI_Id` ASC),
  CONSTRAINT `fk_tRecette_has_tIngredient_tRecette1`
    FOREIGN KEY (`tRecette_REC_Id`)
    REFERENCES `KitchenOfWisdom`.`tRecette` (`REC_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tRecette_has_tIngredient_tIngredient1`
    FOREIGN KEY (`tIngredient_ING_Id`)
    REFERENCES `KitchenOfWisdom`.`tIngredient` (`ING_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tComposant_tUnite1`
    FOREIGN KEY (`tUnite_UNI_Id`)
    REFERENCES `KitchenOfWisdom`.`tUnite` (`UNI_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lakers_etl
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lakers_etl
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lakers_etl` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lakers_etl` ;

-- -----------------------------------------------------
-- Table `lakers_etl`.`gamestats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lakers_etl`.`gamestats` (
  `GameID` INT NOT NULL AUTO_INCREMENT,
  `GameDate` DATE NULL DEFAULT NULL,
  `Opponent` VARCHAR(100) NULL DEFAULT NULL,
  `LakersScore` INT NULL DEFAULT NULL,
  `OpponentScore` INT NULL DEFAULT NULL,
  `PointDifferential` INT NULL DEFAULT NULL,
  `WinLoss` ENUM('Win', 'Loss') NULL DEFAULT NULL,
  `Game_Month` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`GameID`))
ENGINE = InnoDB
AUTO_INCREMENT = 47
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lakers_etl`.`playerstats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lakers_etl`.`playerstats` (
  `PlayerID` INT NOT NULL,
  `JerseyNumber` INT NULL DEFAULT NULL,
  `FirstName` VARCHAR(50) NULL DEFAULT NULL,
  `LastName` VARCHAR(50) NULL DEFAULT NULL,
  `Position` VARCHAR(50) NULL DEFAULT NULL,
  `YearsPro` INT NULL DEFAULT NULL,
  `Age` INT NULL DEFAULT NULL,
  `PointsPerGame` FLOAT NULL DEFAULT NULL,
  `AssistsPerGame` FLOAT NULL DEFAULT NULL,
  `ReboundsPerGame` FLOAT NULL DEFAULT NULL,
  `StealsPerGame` FLOAT NULL DEFAULT NULL,
  `BlocksPerGame` FLOAT NULL DEFAULT NULL,
  `TurnoversPerGame` FLOAT NULL DEFAULT NULL,
  `ThreePointPercentage` FLOAT NULL DEFAULT NULL,
  `FreeThrowPercentage` FLOAT NULL DEFAULT NULL,
  `MinutesPerGame` FLOAT NULL DEFAULT NULL,
  `GamesPlayed` INT NULL DEFAULT NULL,
  `PointsTotal` INT NULL DEFAULT NULL,
  `ReboundsTotal` INT NULL DEFAULT NULL,
  `AssistsTotal` INT NULL DEFAULT NULL,
  `StealsTotal` INT NULL DEFAULT NULL,
  `BlocksTotal` INT NULL DEFAULT NULL,
  `TurnoversTotal` INT NULL DEFAULT NULL,
  `ThreePointsTotal` INT NULL DEFAULT NULL,
  `FreeThrowTotal` INT NULL DEFAULT NULL,
  `MinutesTotal` INT NULL DEFAULT NULL,
  `Image_Render` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`PlayerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lakers_etl`.`monthlyplayerstats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lakers_etl`.`monthlyplayerstats` (
  `PlayerID` INT NOT NULL,
  `Month` VARCHAR(20) NOT NULL,
  `PPG` FLOAT NULL DEFAULT NULL,
  `RPG` FLOAT NULL DEFAULT NULL,
  `APG` FLOAT NULL DEFAULT NULL,
  `SPG` FLOAT NULL DEFAULT NULL,
  `BPG` FLOAT NULL DEFAULT NULL,
  `TPG` FLOAT NULL DEFAULT NULL,
  `MPG` FLOAT NULL DEFAULT NULL,
  `ThreePPercent` FLOAT NULL DEFAULT NULL,
  `FTPercent` FLOAT NULL DEFAULT NULL,
  `GamesPlayed` INT NULL DEFAULT NULL,
  PRIMARY KEY (`PlayerID`, `Month`),
  CONSTRAINT `fk_PlayerID`
    FOREIGN KEY (`PlayerID`)
    REFERENCES `lakers_etl`.`playerstats` (`PlayerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

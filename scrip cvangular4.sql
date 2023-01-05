-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cvangular4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cvangular4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cvangular4` DEFAULT CHARACTER SET utf8 ;
USE `cvangular4` ;

-- -----------------------------------------------------
-- Table `cvangular4`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cvangular4`.`Persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefono` INT ZEROFILL NULL,
  `img Perfil` VARCHAR(250) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cvangular4`.`Habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cvangular4`.`Habilidades` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `porcentaje` VARCHAR(45) NULL,
  `img` LONGTEXT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_Habilidades_Persona_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Habilidades_Persona`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `cvangular4`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cvangular4`.`Proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cvangular4`.`Proyectos` (
  `id` INT NOT NULL,
  `proyectos` VARCHAR(45) NOT NULL,
  `descripcion` LONGTEXT NOT NULL,
  `img` LONGTEXT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_Proyectos_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Proyectos_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `cvangular4`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cvangular4`.`Educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cvangular4`.`Educacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `institucion` VARCHAR(45) NULL,
  `nivel` VARCHAR(45) NULL,
  `titulo` VARCHAR(45) NULL,
  `periodo` DATE NULL,
  `descripcion` LONGTEXT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_Educacion_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Educacion_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `cvangular4`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cvangular4`.`Experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cvangular4`.`Experiencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(45) NOT NULL,
  `periodo` DATE NULL,
  `descripcion` LONGTEXT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_Experiencia_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Experiencia_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `cvangular4`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

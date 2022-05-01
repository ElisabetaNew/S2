-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Optica_Cul_Ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Optica_Cul_Ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Optica_Cul_Ampolla` DEFAULT CHARACTER SET utf8 ;
USE `Optica_Cul_Ampolla` ;

-- -----------------------------------------------------
-- Table `Optica_Cul_Ampolla`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica_Cul_Ampolla`.`Direccion` (
  `Direccion_id` INT NOT NULL AUTO_INCREMENT,
  `Direccion_calle` VARCHAR(45) NOT NULL,
  `Direccion_numero` INT(3) NOT NULL,
  `Direccion_piso` INT(2) NOT NULL,
  `Direccion_puerta` INT(2) NOT NULL,
  `Direccion_ciudad` VARCHAR(45) NOT NULL,
  `Direccion_CP` VARCHAR(5) NOT NULL COMMENT 'Codigo Postal',
  `Direccion_pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Direccion_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica_Cul_Ampolla`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica_Cul_Ampolla`.`Cliente` (
  `Clientes_id` INT NOT NULL AUTO_INCREMENT,
  `Cliente_Nombre` VARCHAR(45) NOT NULL,
  `Cliente_direccion` INT NOT NULL,
  `Cliente_telefono` VARCHAR(45) NOT NULL,
  `Cliente_email` VARCHAR(45) NULL DEFAULT NULL,
  `Cliente_fecha_alta` DATETIME NOT NULL,
  `Cliente_recomendado_por` INT NULL DEFAULT NULL COMMENT 'Codigo del cliente que le ha recomendado',
  PRIMARY KEY (`Clientes_id`),
  INDEX `Direccion_id_idx` (`Cliente_direccion` ASC) VISIBLE,
  CONSTRAINT `Direccion_id`
    FOREIGN KEY (`Cliente_direccion`)
    REFERENCES `Optica_Cul_Ampolla`.`Direccion` (`Direccion_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica_Cul_Ampolla`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica_Cul_Ampolla`.`Proveedor` (
  `Proveedor_id` INT NOT NULL AUTO_INCREMENT,
  `Proveedor_nombre` VARCHAR(45) NOT NULL,
  `Proveedor_direccion` INT NOT NULL,
  `Proveedor_fax` VARCHAR(45) NULL,
  `Proveedor_NIF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Proveedor_id`),
  INDEX `Direccion_id2_idx` (`Proveedor_direccion` ASC) VISIBLE,
  CONSTRAINT `Direccion_id2`
    FOREIGN KEY (`Proveedor_direccion`)
    REFERENCES `Optica_Cul_Ampolla`.`Direccion` (`Direccion_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica_Cul_Ampolla`.`Tipo_montura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica_Cul_Ampolla`.`Tipo_montura` (
  `Tipo_montura_id` INT NOT NULL AUTO_INCREMENT,
  `Tipo_montura_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Tipo_montura_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica_Cul_Ampolla`.`Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica_Cul_Ampolla`.`Marca` (
  `Marca_id` INT NOT NULL AUTO_INCREMENT,
  `Marca_nombre` VARCHAR(45) NOT NULL,
  `Marca_proveedor` INT NOT NULL,
  PRIMARY KEY (`Marca_id`),
  INDEX `Proveedor_id_idx` (`Marca_proveedor` ASC) VISIBLE,
  CONSTRAINT `Proveedor_id`
    FOREIGN KEY (`Marca_proveedor`)
    REFERENCES `Optica_Cul_Ampolla`.`Proveedor` (`Proveedor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica_Cul_Ampolla`.`Gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica_Cul_Ampolla`.`Gafas` (
  `Gafas_id` INT NOT NULL AUTO_INCREMENT,
  `Gafas_proveedor` INT NOT NULL,
  `Gafas_marca` INT NOT NULL,
  `Gafas_graduacion_IZ` DECIMAL(3) NOT NULL,
  `Gafas_graduacio_DCH` DECIMAL(3) NOT NULL,
  `Gafas_tipo_montura` INT NOT NULL,
  `Gafas_color montura` VARCHAR(45) NOT NULL,
  `Gafas_color_vidrio_IZ` VARCHAR(45) NOT NULL,
  `Gafas_color_vidrio_DCH` VARCHAR(45) NOT NULL,
  `Gafas_precio` DECIMAL(6) NOT NULL,
  PRIMARY KEY (`Gafas_id`),
  INDEX `Tipo_montura_id_idx` (`Gafas_tipo_montura` ASC) VISIBLE,
  INDEX `Marca_id_idx` (`Gafas_marca` ASC) VISIBLE,
  INDEX `Proveedor_id_2_idx` (`Gafas_proveedor` ASC) VISIBLE,
  CONSTRAINT `Tipo_montura_id`
    FOREIGN KEY (`Gafas_tipo_montura`)
    REFERENCES `Optica_Cul_Ampolla`.`Tipo_montura` (`Tipo_montura_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Marca_id`
    FOREIGN KEY (`Gafas_marca`)
    REFERENCES `Optica_Cul_Ampolla`.`Marca` (`Marca_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Proveedor_id_2`
    FOREIGN KEY (`Gafas_proveedor`)
    REFERENCES `Optica_Cul_Ampolla`.`Proveedor` (`Proveedor_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica_Cul_Ampolla`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica_Cul_Ampolla`.`Empleado` (
  `Empleado_id` INT NOT NULL AUTO_INCREMENT,
  `Empleado_nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`Empleado_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica_Cul_Ampolla`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Optica_Cul_Ampolla`.`Venta` (
  `Venta_id` INT NOT NULL AUTO_INCREMENT,
  `Venta_Cliente` INT NOT NULL,
  `Venta_Empleado` INT NOT NULL COMMENT 'Empleado que ha hecho la venta',
  `Venta_Gafas` INT NOT NULL,
  `Venta_fecha` DATE NOT NULL,
  PRIMARY KEY (`Venta_id`),
  INDEX `Empleado_id_idx` (`Venta_Empleado` ASC) VISIBLE,
  INDEX `Cliente_id_idx` (`Venta_Cliente` ASC) VISIBLE,
  INDEX `Gafas_id_idx` (`Venta_Gafas` ASC) VISIBLE,
  CONSTRAINT `Empleado_id`
    FOREIGN KEY (`Venta_Empleado`)
    REFERENCES `Optica_Cul_Ampolla`.`Empleado` (`Empleado_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Cliente_id`
    FOREIGN KEY (`Venta_Cliente`)
    REFERENCES `Optica_Cul_Ampolla`.`Cliente` (`Clientes_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Gafas_id`
    FOREIGN KEY (`Venta_Gafas`)
    REFERENCES `Optica_Cul_Ampolla`.`Gafas` (`Gafas_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

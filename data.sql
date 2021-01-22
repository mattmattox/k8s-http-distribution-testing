CREATE DATABASE `Data` ;
CREATE TABLE `Data`.`Connections` (
  `id` INT NOT NULL,
  `timestamp` DATETIME NULL DEFAULT NOW(),
  `nodename` VARCHAR(45) NULL,
  `podname` VARCHAR(45) NULL,
  `podip` VARCHAR(45) NULL,
  PRIMARY KEY (`id`));

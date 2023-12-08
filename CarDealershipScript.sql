# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          CarDealership                                   #
# ---------------------------------------------------------------------- #
DROP DATABASE IF EXISTS CarDealership;

CREATE DATABASE IF NOT EXISTS CarDealership;

USE CarDealership;

# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Table 1: "dealerships"                                                 #
# ---------------------------------------------------------------------- #
CREATE TABLE `dealerships` (
    `dealership_id` INTEGER AUTO_INCREMENT,
    `name` VARCHAR(50),
    `address` VARCHAR(50),
    `phone` VARCHAR(12),
    CONSTRAINT `PK_DEALERSHIPS` PRIMARY KEY (`dealership_id`)
);

CREATE INDEX `name` ON `dealerships` (`name`);


# ---------------------------------------------------------------------- #
# Table 2: "Vehicles"                                                    #
# ---------------------------------------------------------------------- #
CREATE TABLE `Vehicles` (
    `vin` INTEGER NOT NULL,
    `year` VARCHAR(4) NOT NULL,
    `make` VARCHAR(10),
    `model` VARCHAR(10),
    `type` VARCHAR(10),
    `color` VARCHAR(10),
    `odometer` VARCHAR(20),
    `price` VARCHAR(20),
    CONSTRAINT `PK_VIN` PRIMARY KEY (`vin`)
);
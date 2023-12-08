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
# Table 2: "vehicles"                                                    #
# ---------------------------------------------------------------------- #
CREATE TABLE `vehicles` (
    `vin` INTEGER NOT NULL,
    `year` INTEGER NOT NULL,
    `make` VARCHAR(10) NOT NULL,
    `model` VARCHAR(10) NOT NULL,
    `type` VARCHAR(10) NOT NULL,
    `color` VARCHAR(10),
    `odometer` VARCHAR(20),
    `price` VARCHAR(20),
    
    CONSTRAINT `PK_VIN` PRIMARY KEY (`vin`)
);


# ---------------------------------------------------------------------- #
# Table 3: "inventory"                                                    #
# ---------------------------------------------------------------------- #
CREATE TABLE `inventory` (
    `dealership_id` INTEGER NOT NULL,
    `vin` INTEGER NOT NULL,
    
    CONSTRAINT `PK_VIN` PRIMARY KEY (`vin`),
    FOREIGN KEY (`dealership_id`) REFERENCES `dealerships`(`dealership_id`),
    FOREIGN KEY (`vin`) REFERENCES `vehicles`(`vin`)
);


# ---------------------------------------------------------------------- #
# Table 3: "sales_contract"                                              #
# ---------------------------------------------------------------------- #
CREATE TABLE `sales_contract` (
    `date` DATE NOT NULL,
    `name` VARCHAR(50),
    `email` VARCHAR(50),
    `vin` INTEGER NOT NULL,
    `finance` BOOLEAN,    
    `price` INTEGER,
    `monthly_payment` INTEGER,
    `sales_tax` INTEGER,
    `recording_fee` INTEGER,
    `processing_fee` INTEGER,

    CONSTRAINT `PK_VIN` PRIMARY KEY (`vin`),
    FOREIGN KEY (`vin`) REFERENCES `vehicles`(`vin`)
);

# ---------------------------------------------------------------------- #
# Table 4: "sales_contract"                                              #
# ---------------------------------------------------------------------- #
CREATE TABLE `sales_contract` (
    `date` DATE NOT NULL,
    `name` VARCHAR(50),
    `email` VARCHAR(50),
    `vin` INTEGER NOT NULL,
    `price` INTEGER,
    `monthly_payment` INTEGER,
    CONSTRAINT `PK_VIN` PRIMARY KEY (`vin`),
    FOREIGN KEY (`vin`) REFERENCES `vehicles`(`vin`)
);
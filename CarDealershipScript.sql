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
     PRIMARY KEY (`dealership_id`)
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
    
    PRIMARY KEY (`vin`)
);


# ---------------------------------------------------------------------- #
# Table 3: "inventory"                                                    #
# ---------------------------------------------------------------------- #
CREATE TABLE `inventory` (
    `dealership_id` INTEGER NOT NULL,
    `vin` INTEGER NOT NULL,
    
    FOREIGN KEY (`dealership_id`) REFERENCES `dealerships`(`dealership_id`),
    FOREIGN KEY (`vin`) REFERENCES `vehicles`(`vin`)
);


# ---------------------------------------------------------------------- #
# Table 4: "sales_contract"                                              #
# ---------------------------------------------------------------------- #
CREATE TABLE `sales_contract` (
	`sales_contract_id` INTEGER AUTO_INCREMENT,
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

    PRIMARY KEY (`sales_contract_id`),
    FOREIGN KEY (`vin`) REFERENCES `vehicles`(`vin`)
);


# ---------------------------------------------------------------------- #
# Table 5: "lease_contract"                                              #
# ---------------------------------------------------------------------- #
CREATE TABLE `lease_contract` (
	`lease_contract_id` INTEGER AUTO_INCREMENT,
    `date` DATE NOT NULL,
    `name` VARCHAR(50),
    `email` VARCHAR(50),
    `vin` INTEGER NOT NULL,
    `finance` BOOLEAN,    
    `price` INTEGER,
    `expected_ending_value` INTEGER,
    `lease_fee` INTEGER,

    PRIMARY KEY (`lease_contract_id`),
    FOREIGN KEY (`vin`) REFERENCES `vehicles`(`vin`)
);

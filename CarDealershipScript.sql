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
    `phone` VARCHAR(20),
     PRIMARY KEY (`dealership_id`)
);

CREATE INDEX `name` ON `dealerships` (`name`);


# ---------------------------------------------------------------------- #
# Table 2: "vehicles"                                                    #
# ---------------------------------------------------------------------- #
CREATE TABLE `vehicles` (
    `vin` INTEGER(10) NOT NULL,
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
# Table 3: "inventory"                                                   #
# ---------------------------------------------------------------------- #
CREATE TABLE `inventory` (
    `dealership_id` INTEGER NOT NULL,
    `vin` INTEGER(10) NOT NULL,
    
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
    `vin` INTEGER(10) NOT NULL,
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
    `vin` INTEGER(10) NOT NULL,
    `finance` BOOLEAN,    
    `price` INTEGER,
    `expected_ending_value` INTEGER,
    `lease_fee` INTEGER,

    PRIMARY KEY (`lease_contract_id`),
    FOREIGN KEY (`vin`) REFERENCES `vehicles`(`vin`)
);


# ---------------------------------------------------------------------- #
# Add info into "dealerships"                                            #
# ---------------------------------------------------------------------- #
INSERT INTO dealerships (`name`, address, phone)
VALUES
('Sunset Motors', '123 Main St, Anytown, USA', '555-1234-5678'),
('City Cars Inc.', '456 Oak Ave, Anothercity, USA', '555-9876-5432'),
('Highway Autos', '789 Pine Rd, Smalltown, USA', '555-5678-1234'),
('Elite Motors', '101 Maple Blvd, Bigcity, USA', '555-4321-8765'),
('Golden Wheels Dealership', '202 Cedar Lane, Countryside, USA', '555-8765-4321');


# ---------------------------------------------------------------------- #
# Add info into "vehicles"                                               #
# ---------------------------------------------------------------------- #
INSERT INTO vehicles (vin, `year`, make, model, `type`, color, odometer, price)
VALUES
(12345, 2022, 'Toyota', 'Camry', 'Sedan', 'Blue', '10,000 miles', '$25,000.00'),
(98765, 2021, 'Ford', 'Focus', 'Hatchback', 'Red', '15,500 miles', '$20,500.00'),
(34567, 2023, 'Chevrolet', 'Malibu', 'Sedan', 'Silver', '8,200 miles', '$27,500.00'),
(78901, 2020, 'Honda', 'Civic', 'Coupe', 'Black', '18,700 miles', '$22,000.00'),
(56789, 2022, 'Nissan', 'Altima', 'Sedan', 'White', '12,300 miles', '$24,000.00'),
(43567, 2021, 'BMW', '3 Series', 'Sedan', 'Gray', '14,800 miles', '$30,000.00'),
(72345, 2020, 'Ford', 'Escape', 'SUV', 'Green', '20,500 miles', '$18,000.00'),
(88765, 2023, 'Toyota', 'RAV4', 'SUV', 'Blue', '9,800 miles', '$28,500.00'),
(64567, 2022, 'Chevrolet', 'Equinox', 'SUV', 'Red', '13,200 miles', '$26,000.00'),
(28901, 2021, 'Honda', 'Pilot', 'SUV', 'Silver', '16,700 miles', '$32,000.00'),
(11111, 2023, 'Ford', 'Explorer', 'SUV', 'Black', '15,000 miles', '$35,000.00'),
(22222, 2022, 'Chevrolet', 'Camaro', 'Coupe', 'Red', '8,500 miles', '$28,000.00'),
(33333, 2023, 'Toyota', 'Corolla', 'Sedan', 'White', '12,000 miles', '$22,500.00'),
(44444, 2022, 'Honda', 'Accord', 'Sedan', 'Silver', '10,200 miles', '$26,000.00'),
(55555, 2023, 'Nissan', 'Rogue', 'SUV', 'Blue', '14,800 miles', '$30,500.00'),
(66666, 2022, 'BMW', 'X5', 'SUV', 'Gray', '9,500 miles', '$42,000.00'),
(77777, 2023, 'Mercedes', 'CLA', 'Sedan', 'Black', '11,500 miles', '$38,000.00'),
(88888, 2022, 'Audi', 'Q5', 'SUV', 'Silver', '13,700 miles', '$34,500.00'),
(99999, 2023, 'Hyundai', 'Tucson', 'SUV', 'Green', '16,200 miles', '$27,500.00');


# ---------------------------------------------------------------------- #
# Add info into "inventory"                                              #
# ---------------------------------------------------------------------- #
INSERT INTO inventory (dealership_id, vin)
VALUES
(1, 12345),
(2, 98765),
(3, 34567),
(4, 78901), 
(5, 56789), 
(5, 43567),   
(2, 72345),  
(4, 88765),  
(1, 64567),
(3, 28901),
(1, 11111),
(2, 22222), 
(3, 33333),
(4, 44444), 
(5, 55555), 
(1, 66666), 
(2, 77777), 
(3, 88888),
(4, 99999); 


# ---------------------------------------------------------------------- #
# Add info into "sales_contract"                                         #
# ---------------------------------------------------------------------- #
INSERT INTO sales_contract (`date`, `name`, email, vin, finance, price, monthly_payment, sales_tax, recording_fee, processing_fee)
VALUES
('2023-01-01', 'Sophia Miller', 'sophia.miller@example.com', 12345, 1, 25000, 500, 1500, 200, 100),
('2023-02-15', 'Liam Johnson', 'liam.johnson@example.com', 98765, 0, 20500, 450, 1300, 180, 90),
('2023-03-20', 'Ava Davis', 'ava.davis@example.com', 34567, 1, 27500, 550, 1600, 220, 110),
('2023-04-10', 'Noah Taylor', 'noah.taylor@example.com', 78901, 0, 22000, 500, 1400, 200, 100),
('2023-05-05', 'Isabella Brown', 'isabella.brown@example.com', 56789, 1, 24000, 520, 1500, 210, 105);


# ---------------------------------------------------------------------- #
# Add info into "lease_contract"                                         #
# ---------------------------------------------------------------------- #
INSERT INTO lease_contract (`date`, `name`, email, vin, finance, price, expected_ending_value, lease_fee)
VALUES
('2023-06-12', 'Eva Black', 'eva.black@example.com', 43567, 0, 30000, NULL, 3500),
('2023-07-18', 'David Green', 'david.green@example.com', 72345, 1, 18000, 12000, NULL),
('2023-08-25', 'Sophie Blue', 'sophie.blue@example.com', 88765, 0, 28500, NULL, 3200),
('2023-09-30', 'Gary Red', 'gary.red@example.com', 64567, 1, 26000, 22000, NULL),
('2023-10-15', 'Olivia Silver', 'olivia.silver@example.com', 28901, 0, 32000, NULL, 3800);





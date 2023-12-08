# ---------------------------------------------------------------------- #
#            FIND THE DEALERSHIP WHERE NISSAN ROGUE IS, BY VIN           #
# ---------------------------------------------------------------------- #
USE CarDealership;

SELECT d.dealership_id, d.`name`, d.address, d.phone
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE vin = (SELECT vin
			FROM vehicles
            WHERE make LIKE "Nissan" AND model LIKE "Rogue");
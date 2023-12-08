# ---------------------------------------------------------------------- #
#                 FIND ALL DEALERSHIPS THAT HAVE HONDAS                  #
# ---------------------------------------------------------------------- #
USE CarDealership;

SELECT d.dealership_id, d.`name`, d.address, d.phone 
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.vin = v.vin
WHERE make LIKE "Honda";
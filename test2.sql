# ---------------------------------------------------------------------- #
#                   FIND ALL VEHICLES FROM ELITE MOTORS                  #
# ---------------------------------------------------------------------- #
USE CarDealership;

SELECT * FROM vehicles
WHERE vin IN (SELECT vin
			FROM inventory
            WHERE dealership_id = 4);
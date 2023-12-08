# ----------------------------------------------------------------------- #
#   SALES INFO FOR 'HIGHWAY AUTOS' (DATE RANGE: 01-01-2023 - 04-01-2023)  #
# ----------------------------------------------------------------------- #
USE CarDealership;

SELECT s.sales_contract_id, s.`date`, s.`name`, s.email, s.vin, s.finance,
	   s.price, s.monthly_payment, s.sales_tax, s.recording_fee, s.processing_fee
FROM sales_contract s
JOIN inventory i ON s.vin = i.vin
LEFT JOIN dealerships d ON i.dealership_id = d.dealership_id
WHERE d.`name` LIKE "Highway Autos" AND (s.`date` BETWEEN '2023-01-01' AND '2023-04-01');


CREATE INDEX idx_id_search
ON example_2.transactions (id);

-- OPTION 1
WITH CTE_productsDetails  (id, product_id, transaction_type,unit_of_measure,ship_month)
AS
(
	SELECT id, product_id, transaction_type,unit_of_measure,EXTRACT('Month' FROM ship_date)
	FROM example_2.transactions 
)
	
SELECT
	id, 
	 product_id, 
	 transaction_type,
	 unit_of_measure
	FROM
	   CTE_productsDetails
	WHERE 
		product_id = 50
	AND
	    ship_month = 6;
		
-- OPTION 2
SELECT id, product_id, transaction_type,unit_of_measure 
FROM example_2.transactions WHERE product_id = 50
GROUP BY EXTRACT('Month' FROM ship_date),
id, product_id, transaction_type,unit_of_measure 
HAVING EXTRACT('Month' FROM ship_date) = 6;
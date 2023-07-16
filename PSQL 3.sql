-- View: example_3.vw_validproductslist

-- DROP VIEW example_3.vw_validproductslist;

CREATE OR REPLACE VIEW example_3.vw_validproductslist
 AS
 WITH cte_valid_products(product_id, product_name, product_prices, published_date, unitofmeasureproductprice, unitofmeasureproducts) AS (
         SELECT pr.id, 
	        pr.name,
            pp.product_price,
            pp.published_date,
            pp.unit_of_measure::character varying(2) AS unit_of_measure,
            pr.unit_of_measure::character varying(2) AS unit_of_measure
           FROM example_3.products pr
             JOIN example_3.product_prices pp ON pr.id = pp.product_id
        )
 SELECT cte_valid_products.product_id,
 	cte_valid_products.product_name,
    cte_valid_products.product_prices,
    cte_valid_products.published_date,
    cte_valid_products.unitofmeasureproductprice AS unit_of_measure
   FROM cte_valid_products
  WHERE cte_valid_products.unitofmeasureproductprice::text = cte_valid_products.unitofmeasureproducts::text;

ALTER TABLE example_3.vw_validproductslist
    OWNER TO postgres;
	
SELECT * FROM example_3.vw_validproductslist


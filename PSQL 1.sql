WITH cte_product_prices (ProductId,ProductName, ProductPrice, PublishedDate)
AS 
(
	SELECT pr.id,pr.name, pp.product_price, pp.published_date
	FROM example_1.products AS pr
	INNER JOIN example_1.product_prices AS pp
	ON pr.id = pp.product_id
)
SELECT 
	ProductName, 
	ProductPrice, 
	PublishedDate
FROM 
	cte_product_prices
WHERE 
ProductId IN (100,200,300, 400) 
AND PublishedDate <= '2022-06-10'
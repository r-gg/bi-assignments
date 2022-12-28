SELECT 
topCategory 'Product Top Category',  
subCategory AS 'Product Sub Category',
model AS 'Product Model',
qty AS 'Quantity Sold'
FROM (
SELECT 
		prod.ProductTopCategoryName AS 'topCategory', 
		prod.ProductSubCategoryName AS 'subCategory', 
		prod.ProductModelName AS 'model', 
		SUM(facts.OrderQty) AS 'qty',
        row_number() over (
			PARTITION BY prod.ProductTopCategoryName 
			ORDER BY SUM(facts.OrderQty) DESC) AS 'rankInCategory'
		FROM bi_bikesdw_40.fact_internetsales facts
		JOIN bi_bikesdw_40.dim_product prod ON facts.ProductKey = prod.ProductKey
		GROUP BY prod.ProductModelName
		ORDER BY prod.ProductTopCategoryName, SUM(facts.OrderQty) DESC
) AS MostQuantitiesPerProductCategory 
WHERE rankInCategory <= 3;
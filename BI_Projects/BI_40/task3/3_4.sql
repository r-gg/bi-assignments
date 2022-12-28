SELECT 
	loc.Region, 
	cust.FullName AS 'Customer Name', 
	SUM(facts.OrderQty) AS 'Quantity Sold',
	row_number() OVER (ORDER BY SUM(facts.OrderQty) DESC) AS 'Rank'
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_customer cust ON facts.CustomerKey = cust.CustomerKey
JOIN bi_bikesdw_40.dim_location loc ON facts.ShipToLocationKey = loc.LocationKey
WHERE loc.Region = "Europe"
GROUP BY (cust.FullName)
ORDER BY SUM(facts.OrderQty) DESC
LIMIT 0,5;
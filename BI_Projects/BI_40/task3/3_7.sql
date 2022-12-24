SELECT loc.Country, ROUND(SUM(facts.OrderLineProfit), 2) AS 'Profit'
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_location loc ON facts.ShipToLocationKey = loc.LocationKey
WHERE 1000 < facts.UnitPrice < 2000
GROUP BY (loc.Country)
ORDER BY SUM(facts.OrderLineProfit) DESC
LIMIT 0,3;
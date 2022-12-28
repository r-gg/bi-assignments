SELECT loc.Country, SUM(facts.OrderLineTotal) AS 'Revenue'
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_location loc ON facts.ShipToLocationKey = loc.LocationKey
JOIN bi_bikesdw_40.dim_date d ON d.DateKey = facts.OrderDateKey
WHERE d.CalendarYear = "2019"
GROUP BY (loc.Country)
ORDER BY Revenue DESC;
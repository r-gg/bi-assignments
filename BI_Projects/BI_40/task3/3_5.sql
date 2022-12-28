SELECT 
	loc.Country, d.CalendarYear AS 'Year', 
	MONTHNAME(facts.OrderDate) AS 'Month', 
	SUM(facts.OrderLineShippingCost) AS 'Shipping costs'
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_customer cust ON facts.CustomerKey = cust.CustomerKey
JOIN bi_bikesdw_40.dim_location loc ON facts.ShipToLocationKey = loc.LocationKey
JOIN bi_bikesdw_40.dim_date d ON d.DateKey = facts.OrderDateKey
WHERE facts.ShipMethod = "Cargo International" AND loc.Country = "United Kingdom" AND d.MonthNumberOfYear <= 6 and d.CalendarYear = "2020"
GROUP BY loc.Country, d.CalendarYear, d.MonthNumberOfYear
ORDER BY loc.Country, d.CalendarYear;
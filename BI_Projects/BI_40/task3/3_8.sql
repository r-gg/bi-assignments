SELECT d.CalendarYear AS 'Calendar Year', MONTHNAME(facts.OrderDate) AS 'Month', loc.Country, SUM(facts.OrderLineTaxAmt) AS 'Tax Amount'
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_location loc ON facts.ShipToLocationKey = loc.LocationKey
JOIN bi_bikesdw_40.dim_date d ON d.DateKey = facts.OrderDateKey
WHERE loc.Country IN ("France", "Germany") AND d.MonthNumberOfYear <= 6 AND d.CalendarYear = "2021"
GROUP BY d.MonthNumberOfYear, loc.Country
ORDER BY d.MonthNumberOfYear, loc.Country
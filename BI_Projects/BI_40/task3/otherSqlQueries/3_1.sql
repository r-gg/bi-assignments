SELECT prod.ProductTopCategoryName AS 'Product Top Category', ROUND(SUM(facts.OrderLineProfit), 2) AS 'Profit'
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_date d ON d.DateKey = facts.OrderDateKey
JOIN bi_bikesdw_40.dim_product prod ON prod.ProductKey = facts.ProductKey
WHERE d.CalendarYear = "2021"
GROUP BY (prod.ProductTopCategoryName)
ORDER BY Profit DESC
LIMIT 0,5;
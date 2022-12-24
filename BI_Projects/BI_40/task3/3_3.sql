SELECT cust.FullName AS "Customer Name", SUM(facts.OrderLineProfit) AS Profit
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_date d ON d.DateKey = facts.OrderDateKey
JOIN bi_bikesdw_40.dim_customer cust ON cust.CustomerKey = facts.CustomerKey
WHERE d.CalendarYear = "2021" AND d.MonthNumberOfYear <= 6
GROUP BY("Customer Name")
ORDER BY Profit DESC
LIMIT 0,10;
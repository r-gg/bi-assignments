SELECT 
	Rank() OVER (ORDER BY SUM(facts.OrderLineProfit) DESC) AS 'Customer Rank', 
	cust.FullName AS CustomerName, 
	SUM(facts.OrderLineProfit) AS Profit
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_date d ON d.DateKey = facts.OrderDateKey
JOIN bi_bikesdw_40.dim_customer cust ON cust.CustomerKey = facts.CustomerKey
WHERE d.CalendarYear = "2021" AND d.MonthNumberOfYear <= 6
GROUP BY(CustomerName)
ORDER BY 'Customer Rank'
LIMIT 0,10;
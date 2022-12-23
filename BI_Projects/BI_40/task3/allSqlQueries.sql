/* 3.1 */
SELECT prod.ProductTopCategoryName AS 'Product Top Category', ROUND(SUM(facts.OrderLineProfit), 2) AS 'Profit'
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_date d ON d.DateKey = facts.OrderDateKey
JOIN bi_bikesdw_40.dim_product prod ON prod.ProductKey = facts.ProductKey
WHERE d.CalendarYear = "2021"
GROUP BY (prod.ProductTopCategoryName)
ORDER BY Profit DESC
LIMIT 0,5;

/* 3.2 */
SELECT loc.Country, SUM(facts.OrderLineTotal) AS 'Revenue'
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_location loc ON facts.ShipToLocationKey = loc.LocationKey
JOIN bi_bikesdw_40.dim_date d ON d.DateKey = facts.OrderDateKey
WHERE d.CalendarYear = "2019"
GROUP BY (loc.Country)
ORDER BY Revenue DESC;

/* 3.3 */
SELECT cust.FullName AS CustomerName, Sum(facts.OrderLineProfit) AS Profit
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_date d ON d.DateKey = facts.OrderDateKey
JOIN bi_bikesdw_40.dim_customer cust ON cust.CustomerKey = facts.CustomerKey
WHERE d.CalendarYear = "2021" and d.MonthNumberOfYear <= 6
GROUP BY(CustomerName)
ORDER BY Profit DESC
LIMIT 0,10;

/* 3.4 */
SELECT cust.FullName AS 'Customer Name', SUM(facts.OrderQty) AS 'Quantity Sold', ROW_NUMBER() OVER(PARTITION BY cust.FullName ORDER BY 'Quantity Sold' DESC) AS 'Rank'
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_customer cust ON facts.CustomerKey = cust.CustomerKey
JOIN bi_bikesdw_40.dim_location loc ON facts.ShipToLocationKey = loc.LocationKey
WHERE loc.Region = "Europe"
GROUP BY (cust.FullName)
ORDER BY SUM(facts.OrderQty) DESC
LIMIT 0,5;

/* 3.5 */
SELECT loc.Country, d.CalendarYear AS 'Year', MONTHNAME(facts.OrderDate) AS 'Month', SUM(facts.OrderLineShippingCost) AS 'Shipping costs'
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_customer cust ON facts.CustomerKey = cust.CustomerKey
JOIN bi_bikesdw_40.dim_location loc ON facts.ShipToLocationKey = loc.LocationKey
JOIN bi_bikesdw_40.dim_date d ON d.DateKey = facts.OrderDateKey
WHERE facts.ShipMethod = "Cargo International" AND d.MonthNumberOfYear <= 6 and d.CalendarYear = "2020"
GROUP BY loc.Country, d.CalendarYear, d.MonthNumberOfYear
ORDER BY loc.Country, d.CalendarYear;

/* 3.6 */
/* -> MDX query only */

/* 3.7 */
SELECT loc.Country, ROUND(SUM(facts.OrderLineProfit), 2) AS 'Profit'
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_location loc ON facts.ShipToLocationKey = loc.LocationKey
WHERE 1000 < facts.UnitPrice < 2000
GROUP BY (loc.Country)
ORDER BY SUM(facts.OrderLineProfit) DESC
LIMIT 0,3;

/* 3.8 */
SELECT d.CalendarYear AS 'Calendar Year', MONTHNAME(facts.OrderDate) AS 'Month', loc.Country, SUM(facts.OrderLineTaxAmt) AS 'Tax Amount'
FROM bi_bikesdw_40.fact_internetsales facts
JOIN bi_bikesdw_40.dim_location loc ON facts.ShipToLocationKey = loc.LocationKey
JOIN bi_bikesdw_40.dim_date d ON d.DateKey = facts.OrderDateKey
WHERE loc.Country IN ("France", "Germany") AND d.MonthNumberOfYear <= 6 and d.CalendarYear = "2021"
GROUP BY d.MonthNumberOfYear, loc.Country
ORDER BY d.MonthNumberOfYear, loc.Country
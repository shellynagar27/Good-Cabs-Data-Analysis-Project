/*
Business Request-5 Identify Month with Highest Revenue for each city
Generate a report that identifies the month with the highest revenue for each city. For each
city, display the month_name, the revenue amount for that month, and the percentage
contribution of that month's revenue to the city's total revenue.

Fields

· city_name
. highest_revenue_month
. revenue
· percentage_contribution (%)

*/

select
	city_name, 
    month_name as highest_revenue_month, 
    revenue,
    percentage_contribution
from
(select 
	city_name, 
    month_name, 
    revenue, 
    -- sum(revenue) over(partition by city_name) as total_revenue,
    round(revenue*100/sum(revenue) over(partition by city_name),2) as percentage_contribution,
    DENSE_RANK() over(PARTITION BY city_name order by revenue desc) as dr
from
(select 
	city_name,
    date_format(date, "%M") as month_name,
    sum(fare_amount) as revenue
from dim_city as c
join fact_trips as ft
	on c.city_id = ft.city_id
group by 1,2) as table1) as table2
where dr=1;
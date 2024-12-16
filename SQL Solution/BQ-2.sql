/*
Business Report-2 Monthly City-Level Trips Target Performance Report
Generate a report that evaluates the target performance for trips at the monthly and city
level. For each city and month, compare the actual total trips with the target trips and
categorise the performance as follows:

. If actual trips are greater than target trips, mark it as "Above Target".
. If actual trips are less than or equal to target trips, mark it as "Below Target".

Additionally, calculate the % difference between actual and target trips to quantify the
performance gap.

Fields:

· City_name
. month_name
· actual_trips
· target_trips
· performance_status
· %_difference

*/
-- Method-1 using temporary table
create TEMPORARY TABLE city_actual_performance
select 
	c.city_id, 
	c.city_name, 
    date_format(ft.date,"%M") as month_name, 
    count(trip_id) as actual_trips
from dim_city as c
join fact_trips as ft
	on c.city_id = ft.city_id
group by 1,2,3;

select city_name, month_name, actual_trips, total_target_trips as target_trips,
case
	when actual_trips>total_target_trips then "Above Target"
    else "Below Target"
end as performance_status,
round((actual_trips-total_target_trips)*100/total_target_trips,2) as pct_difference
from city_actual_performance as cap
join targets_db.monthly_target_trips as mtt
on cap.city_id = mtt.city_id and cap.month_name = date_format(mtt.month, "%M");

-- Method-2
SELECT 
    c.city_name,
    DATE_FORMAT(ft.date, '%M') AS month_name,
    COUNT(ft.trip_id) AS actual_trips,
    mtt.total_target_trips AS target_trips,
    CASE
        WHEN COUNT(ft.trip_id) > mtt.total_target_trips THEN "Above Target"
        ELSE "Below Target"
    END AS performance_status,
    ROUND((COUNT(ft.trip_id) - mtt.total_target_trips) * 100.0 / mtt.total_target_trips, 2) AS pct_difference
FROM 
    dim_city AS c
JOIN 
    fact_trips AS ft
ON 
    c.city_id = ft.city_id
JOIN 
    targets_db.monthly_target_trips AS mtt
ON 
    c.city_id = mtt.city_id 
    AND MONTH(ft.date) = MONTH(mtt.month)
GROUP BY 
    c.city_id, c.city_name, DATE_FORMAT(ft.date, '%M'), mtt.total_target_trips;

-- Method-3 Using Subquery
SELECT 
    cap.city_name,
    cap.month_name,
    cap.total_trips AS actual_trips,
    mtt.total_target_trips AS target_trips,
    CASE
        WHEN cap.total_trips > mtt.total_target_trips THEN "Above Target"
        ELSE "Below Target"
    END AS performance_status,
    ROUND((cap.total_trips - mtt.total_target_trips) * 100.0 / mtt.total_target_trips, 2) AS pct_difference
FROM (
    SELECT 
        c.city_id,
        c.city_name,
        DATE_FORMAT(ft.date, '%M') AS month_name,
        COUNT(ft.trip_id) AS total_trips
    FROM 
        dim_city AS c
    JOIN 
        fact_trips AS ft
    ON 
        c.city_id = ft.city_id
    GROUP BY 
        c.city_id, c.city_name, DATE_FORMAT(ft.date, '%M')
) AS cap
JOIN 
    targets_db.monthly_target_trips AS mtt
ON 
    cap.city_id = mtt.city_id 
    AND cap.month_name = date_format(mtt.month, "%M");
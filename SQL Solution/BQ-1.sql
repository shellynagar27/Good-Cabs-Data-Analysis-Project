/*
Business Request-1 City Level Fare and Trip Summary Report
Generate a report that displays the total trips, average fare per km, average fare per trip, and
the percentage contribution of each city's trips to the overall trips. This report will help in
assessing trip volume, pricing efficiency, and each city's contribution to the overall trip count.

Fields:

· city_name
· total_trips
· avg_fare_per_km
· avg_fare_per_trip
· %_contribution_to_total_trips

*/
-- Method-1
with cte1 as
(Select 
	city_name, 
    count(trip_id) as total_trips, 
    Sum(distance_travelled_km) as total_distance_travelled_km,
	sum(fare_amount) as total_fare_amount
from trips_db.dim_city as c
join trips_db.fact_trips as ft
	on c.city_id = ft.city_id
group by city_name)
select 
	city_name, 
    total_trips, 
    round(total_fare_amount/total_distance_travelled_km, 2) as avg_fare_per_km,
	round(total_fare_amount/total_trips) as avg_fare_per_trip, 
    round(total_trips*100/sum(total_trips) over(),2) as pct_contribution_to_total_trips
from cte1;

-- Method- 2
select city_name, 
	count(trip_id) as total_trips,
    round(sum(fare_amount)/sum(distance_travelled_km),2) as avg_fare_per_km,
    round(sum(fare_amount)/count(trip_id),2) as avg_fare_per_trip,
    round(count(trip_id)*100/(select count(*) from trips_db.fact_trips),2) as pct_contribution_to_total_trips
from trips_db.dim_city as c
join trips_db.fact_trips as ft
	on c.city_id = ft.city_id
group by city_name;
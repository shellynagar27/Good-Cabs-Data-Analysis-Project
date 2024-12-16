/*
Business Request-4 Indentify Cities with Highest and Lowest Total New Passengers
Generate a report that calculates the total new passengers for each city and ranks them
based on this value. Identify the top 3 cities with the highest number of new passengers as
well as the bottom 3 cities with the lowest number of new passengers, categorising them as
"Top 3" or "Bottom 3" accordingly.

Fields

· city_name
· total_new_passengers
. city_category ("Top 3" or "Bottom 3")

*/
-- Method-1 Using fact_passenger_summary table
WITH ranked_cities AS (
    SELECT 
        city_name,
        SUM(new_passengers) AS total_new_passengers,
        DENSE_RANK() OVER (ORDER BY SUM(new_passengers) DESC) AS drd,
        DENSE_RANK() OVER (ORDER BY SUM(new_passengers) ASC) AS dra
    FROM dim_city AS c
    JOIN fact_passenger_summary AS fps
        ON c.city_id = fps.city_id
    GROUP BY city_name
),
categorized_cities AS (
    SELECT 
        city_name,
        total_new_passengers,
        CASE
            WHEN drd <= 3 THEN "Top 3"
            WHEN dra <= 3 THEN "Bottom 3"
        END AS city_category
    FROM ranked_cities
)
SELECT 
    city_name,
    total_new_passengers,
    city_category
FROM categorized_cities
WHERE city_category IS NOT NULL
ORDER BY total_new_passengers DESC;

-- Method-2 Using fact_passenger_summary table
WITH ranked_cities AS (
    SELECT 
        city_name,
        SUM(new_passengers) AS total_new_passengers,
        DENSE_RANK() OVER (ORDER BY SUM(new_passengers) DESC) AS drd,
        DENSE_RANK() OVER (ORDER BY SUM(new_passengers) ASC) AS dra
    FROM dim_city AS c
    JOIN fact_passenger_summary AS fps
        ON c.city_id = fps.city_id
    GROUP BY city_name
)
    SELECT 
        city_name,
        total_new_passengers,
        CASE
            WHEN drd <= 3 THEN "Top 3"
            WHEN dra <= 3 THEN "Bottom 3"
        END AS city_category
    FROM ranked_cities
    where drd<=3 or dra<=3
    order by total_new_passengers desc;

-- Method-3 Using fact_trips table
with ranked_cities as
(SELECT
	city_name, 
    count(trip_id) as total_new_passengers,
    DENSE_RANK() OVER (ORDER BY count(trip_id) DESC) AS drd,
	DENSE_RANK() OVER (ORDER BY count(trip_id) ASC) AS dra 
from dim_city as c
join fact_trips as ft
	on c.city_id = ft.city_id
where passenger_type = "new"
group by city_name)
SELECT 
        city_name,
        total_new_passengers,
        CASE
            WHEN drd <= 3 THEN "Top 3"
            WHEN dra <= 3 THEN "Bottom 3"
        END AS city_category
    FROM ranked_cities
WHERE drd<=3 or dra<=3
ORDER BY total_new_passengers DESC;

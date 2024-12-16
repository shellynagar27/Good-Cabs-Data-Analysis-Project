/*
Business Request-3 City-Level Repeat Passanger Trip Frequency Report
Generate a report that shows the percentage distribution of repeat passengers by the
number of trips they have taken in each city. Calculate the percentage of repeat passengers
who took 2 trips, 3 trips, and so on, up to 10 trips.

Each column should represent a trip count category, displaying the percentage of repeat
passengers who fall into that category out of the total repeat passengers for that city.

This report will help identify cities with high repeat trip frequency, which can indicate strong
customer loyalty or frequent usage patterns.

· Fields: city_name, 2-Trips, 3-Trips, 4-Trips, 5-Trips, 6-Trips, 7-Trips, 8-Trips, 9-Trips,
10-Trips

*/

SELECT 
    city_name,
    SUM(CASE WHEN trip_count = "2-Trips" THEN pct_of_repeat_passenger ELSE 0 END) AS Trips_2,
    SUM(CASE WHEN trip_count = "3-Trips" THEN pct_of_repeat_passenger ELSE 0 END) AS Trips_3,
    SUM(CASE WHEN trip_count = "4-Trips" THEN pct_of_repeat_passenger ELSE 0 END) AS Trips_4,
    SUM(CASE WHEN trip_count = "5-Trips" THEN pct_of_repeat_passenger ELSE 0 END) AS Trips_5,
    SUM(CASE WHEN trip_count = "6-Trips" THEN pct_of_repeat_passenger ELSE 0 END) AS Trips_6,
    SUM(CASE WHEN trip_count = "7-Trips" THEN pct_of_repeat_passenger ELSE 0 END) AS Trips_7,
    SUM(CASE WHEN trip_count = "8-Trips" THEN pct_of_repeat_passenger ELSE 0 END) AS Trips_8,
    SUM(CASE WHEN trip_count = "9-Trips" THEN pct_of_repeat_passenger ELSE 0 END) AS Trips_9,
    SUM(CASE WHEN trip_count = "10-Trips" THEN pct_of_repeat_passenger ELSE 0 END) AS Trips_10
FROM (
    SELECT 
        city_name, 
        trip_count, 
        repeat_passenger_count,
        ROUND(repeat_passenger_count * 100 / SUM(repeat_passenger_count) OVER(PARTITION BY city_name), 2) AS pct_of_repeat_passenger
    FROM (
        SELECT 
            city_name, 
            trip_count, 
            SUM(repeat_passenger_count) AS repeat_passenger_count
        FROM 
            dim_city AS c
        JOIN 
            dim_repeat_trip_distribution AS rtd
        ON 
            c.city_id = rtd.city_id
        GROUP BY 
            city_name, trip_count
    ) AS counting_repeat_passengers
) AS table2
GROUP BY 
    city_name;
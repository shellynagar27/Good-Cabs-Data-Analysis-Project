/*
Business Request-6 Repeat Passenger Rate Analysi
Generate a report that calculates two metrics:

1. Monthly Repeat Passenger Rate: Calculate the repeat passenger rate for each city
and month by comparing the number of repeat passengers to the total passengers.
2. City-wide Repeat Passenger Rate: Calculate the overall repeat passenger rate for
each city, considering all passengers across months.

These metrics will provide insights into monthly repeat trends as well as the overall repeat
behaviour for each city.

Fields:

· city_name
month
total passengers
repeat_passengers
. monthly_repeat_passenger_rate (%): Repeat passenger rate at the city and
month level
· city_repeat_passenger_rate (%): Overall repeat passenger rate for each city,
aggregated across months
*/
select 
	city_name,
    date_format(month, "%M") as month,
    total_passengers,
    repeat_passengers,
    round(repeat_passengers*100/total_passengers,2) as monthly_repeat_passenger_rate,
    -- round(repeat_passengers*100/sum(repeat_passengers) over(partition by city_name),2) as pct_share_in_overall_repeat_passengers,
    -- round(repeat_passengers*100/sum(total_passengers) over(partition by city_name),2) as pct_share_of_monthly_repeat_passengers_wrt_overall_passengers_throughout,
    round(sum(repeat_passengers) over(partition by city_name)*100/sum(total_passengers) over(partition by city_name),2) as city_repeat_passenger_rate
from dim_city as c
join fact_passenger_summary as fps
	on c.city_id = fps.city_id;
    
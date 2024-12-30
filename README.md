# 🚕 Good-Cabs-Data-Analysis-Project
   - [Live Dashboard](https://app.powerbi.com/view?r=eyJrIjoiZmU3NWE4ZTEtZDVmNC00ZjViLThiODctZjJhN2FmM2VhNTU0IiwidCI6ImM2ZTU0OWIzLTVmNDUtNDAzMi1hYWU5LWQ0MjQ0ZGM1YjJjNCJ9&embedImagePlaceholder=true&pageName=a7151d08406ea33b5130)
   - [Video Presentation]()
   - [Linkedin Post Link]()
   - [Details about complete challenge](https://codebasics.io/challenge/codebasics-resume-project-challenge)
---
## 📋 Overview
This project focuses on analyzing the operations and performance of **GoodCabs**, a cab service company, through data-driven insights. The goal is to understand key business metrics, identify growth opportunities, and optimize services based on data analysis.

---
## 😵 Business Problem
GoodCabs is facing challenges in key areas like **revenue growth**, **repeat passenger rate**, and **operational efficiency**. The business requires actionable insights to improve performance, enhance customer experience, and adapt to emerging trends.

---
## 🔑 Key Objectives
- Identify patterns in revenue, trips, passengers, and ratings.
- Analyze city-specific performance to find growth opportunities.
- Establish correlations between customer behavior, trip distance, and fare.
- Enhance the decision-making process with interactive dashboards.

---
## 🪜 Data Analysis Methodology

1. **Business Problem Understanding**:  
   - Gathered insights from stakeholders to understand key objectives and requirements.

2. **Exploratory Data Analysis (EDA)**:  
   - Conducted a thorough EDA using **Power Query** and **SQL** to explore the data, identify patterns, and summarize key findings.

3. **Ad-Hoc Analysis**:  
   - Performed ad-hoc data analysis using **SQL** queries to answer specific business questions.
   - Visualized results using **Excel** for easy interpretation.

4. **Data Cleaning & Transformation**:  
   - Cleaned and transformed raw data to ensure **data integrity** and **consistency**.
   - Applied **Star** and **Snowflake schemas** to establish relationships between different datasets.

5. **Dashboard Creation**:  
   - Created an interactive **Power BI** dashboard to visualize key performance indicators (KPIs) such as revenue, trip types, passenger ratings, etc.

6. **Results Presentation**:  
   - Compiled key findings and insights into a [**PowerPoint presentation**](https://github.com/shellynagar27/Good-Cabs-Data-Analysis-Project/blob/main/Final%20PPT.pdf) for stakeholders.
---
## 📃 Ad-Hoc Requests
  - [Results](https://github.com/shellynagar27/Good-Cabs-Data-Analysis-Project/tree/main/SQL%20Solution)
---
## 🔍 Data Set Overview

This project utilizes data from two primary databases: `trips_db` and `targets_db`. These databases contain detailed and aggregated data on Goodcabs' operations, including trip information, passenger behavior, city-specific performance, and monthly targets for growth. 

### trips_db
This database stores detailed and aggregated data on trips, passenger types, and repeat trip behavior across Goodcabs’ operations in tier-2 cities. The data is organized by city, month, and day type (weekday or weekend) for comprehensive analysis of travel patterns, demographics, and repeat usage trends.

1. **dim_city**
   - Purpose: Provides city-specific details for location-based analysis of trips and passenger behavior.
   - Key Columns: 
     - `city_id`: Unique city identifier (e.g., RJ01 for Jaipur).
     - `city_name`: City name (e.g., Jaipur, Lucknow).

2. **dim_date**
   - Purpose: Provides date-specific details for time-based grouping and analysis of trip patterns across days, months, and weekends vs weekdays.
   - Key Columns: 
     - `date`: The specific date of the entry (YYYY-MM-DD).
     - `start_of_month`: The first day of the respective month.
     - `month_name`: Name of the month.
     - `day_type`: Weekday or weekend indicator.

3. **fact_passenger_summary (Aggregated Data)**
   - Purpose: Provides aggregated passenger counts (new and repeat) for each city by month.
   - Key Columns:
     - `month`: Start date of the month.
     - `city_id`: City identifier.
     - `total_passengers`: Total count of all passengers.
     - `new_passengers`: Count of new passengers.
     - `repeat_passengers`: Count of repeat passengers.

4. **dim_repeat_trip_distribution (Aggregated Data)**
   - Purpose: Provides a breakdown of repeat trip behavior, categorized by trip frequency (up to 10 trips per month) for each city.
   - Key Columns:
     - `month`: Start date of the month.
     - `city_id`: City identifier.
     - `trip_count`: Number of trips taken by repeat passengers.
     - `repeat_passenger_count`: Count of repeat passengers for each trip frequency.

5. **fact_trips**
   - Purpose: Provides detailed trip-level data, including distance, fare, and ratings for each trip.
   - Key Columns:
     - `trip_id`: Unique trip identifier.
     - `date`: Date of the trip.
     - `city_id`: City identifier.
     - `passenger_type`: New or repeat passenger.
     - `distance_travelled (km)`: Distance of the trip in kilometers.
     - `fare_amount`: Fare amount paid.
     - `passenger_rating`: Passenger rating (1-10).
     - `driver_rating`: Driver rating (1-10).

### targets_db
This database contains monthly targets for each city, including trip counts, new passenger acquisition, and average passenger ratings. It helps in evaluating Goodcabs' performance against the company's established goals.

1. **city_target_passenger_rating**
   - Purpose: Stores target average passenger ratings for each city.
   - Key Columns:
     - `city_id`: Unique city identifier.
     - `target_avg_passenger_rating`: Target average passenger rating.

2. **monthly_target_new_passengers**
   - Purpose: Stores the target number of new passengers to acquire for each city in a given month.
   - Key Columns:
     - `month`: Start date of the target month (YYYY-MM-DD).
     - `city_id`: City identifier.
     - `target_new_passengers`: Target new passenger count.

3. **monthly_target_trips**
   - Purpose: Stores the target number of total trips to achieve for each city and month.
   - Key Columns:
     - `month`: Start date of the target month (YYYY-MM-DD).
     - `city_id`: City identifier.
     - `total_target_trips`: Target total trips count.
---
## 🗄️Data Model
![Screenshot 2024-12-15 154118](https://github.com/user-attachments/assets/0a3599a8-2bdf-4fa7-a422-33a3c3f634d7)

---

## 🚀 **Recommendations**  
1. **Optimize Fare Strategy:**  
   - Introduce dynamic pricing models to attract passengers during off-peak hours.  
   - Maintain competitive pricing to retain repeat customers.  

2. **Boost Passenger Satisfaction:**  
   - Address key pain points: **driver behavior**, and **repeat passenger rate**.  
   - Introduce driver training programs and incentivize quality service.  

3. **Targeted Marketing:**  
   - Promote services during **tourism seasons** and **local events** to boost demand.  
   - Run campaigns to attract **new passengers** while offering loyalty programs to retain repeat users.  

4. **Partnership Opportunities:**  
   - Collaborate with local businesses (hotels, malls, events) to drive demand in high-footfall areas.  

5. **Data Collection & Analysis:**  
   - Implement feedback mechanisms to gather more insights on passenger preferences.  
   - Analyze socio-economic patterns to tailor operations city-wise.  

---

## 🎯 **Outcome**  
The project provided actionable insights to optimize Goodcabs' operations, improve customer satisfaction, and increase repeat passenger rates. The recommendations aim to drive **sustainable growth** and enhance **operational efficiency** across cities through data-driven decisions.

---
## 🛠️ Tools & Technologies
- **SQL**: For data extraction and ad-hoc analysis.
- **Power Query**: For data cleaning and transformation.
- **Excel**: For visualizing analysis results.
- **Power BI**: For interactive dashboard creation.
- **Canva**: For presenting insights to stakeholders.
- [**Flaticon**](https://www.flaticon.com/): For icons
- [**Adobe Color**](https://color.adobe.com/create/color-wheel) & [**Coolors**](https://coolors.co/): For generating color palette
- [**Adobe Stock**](https://stock.adobe.com/in/) & [**shutterctock**](https://www.shutterstock.com/): For images
---

### **👨‍💻 Skills Demonstrated:**  
- Data Analysis  
- Visualization  
- Critical Thinking  
- Business Strategy  
- Communication  




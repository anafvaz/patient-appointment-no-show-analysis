# Patient Appointment No-Show Analysis

End-to-end data analysis of medical appointment no-shows using SQL and Tableau, with a focus on wait times, scheduling patterns, and attendance behavior.

## Business Problem
Missed medical appointments lead to wasted clinical capacity, delayed patient care, and operational inefficiencies.  
This project analyzes appointment data to identify key factors associated with no-shows and provide insights that can support better scheduling and reminder strategies.

## Business Question

What factors increase the likelihood of patient no-shows, and how can scheduling practices be improved to reduce missed appointments?

## Stakeholders
- Clinic Operations Managers  
- Scheduling Teams  

## Key Questions
- What is the overall appointment no-show rate?
- How does appointment wait time affect attendance?
- Are certain weekdays associated with higher no-show rates?
- Which age groups are most at risk of missing appointments?
- Do SMS reminders reduce no-shows?

## Data Source

The dataset contains anonymized medical appointment records, including appointment dates, patient demographics, attendance status, SMS reminder indicators, and selected health conditions.  
The data was processed and analyzed using SQL before being visualized in Tableau.

## Data Preparation & Transformation (SQL)
Key steps performed in SQL:
- Renamed columns into consistent `snake_case`
- Removed invalid records (e.g., negative ages)
- Standardized appointment status into `show` and `no_show`
- Excluded inconsistent scheduling records where 'wait_time_days' was negative
- Created engineered features:
  - **wait_time_days** = days between scheduling and appointment date
  - **wait_time_groups** (0–7, 8–30, 30+ days)
  - **age_groups**
  - **weekday**
  - **is_no_show** (binary data used for rate calculations)

## KPIs
- **No-Show Rate (%)**
- **Total Appointments**
- **Average Wait Time (days)**

## Tableau Dashboard
The Tableau dashboard was built using a single SQL view (`no_show_dashboard_base`) containing appointment-level data and transformation features. Tableau computes rates dynamically using `AVG(is_no_show)`.

- Screenshot: <img width="1470" height="851" alt="Screenshot 2026-01-24 at 2 27 23 PM" src="https://github.com/user-attachments/assets/97a8154f-e536-4b2b-b45c-e70a0333e832" />

- Tableau Public link: see `https://public.tableau.com/views/Appointment_Analysis_17691842829090/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link`

## Key Insights (summary)
- Longer scheduling wait times are associated with higher no-show rates, especially 30+ days in advance.
- No-show rates vary by weekday, suggesting some days carry higher scheduling risk.
- Younger age groups show higher no-show rates compared to older groups.
- After data cleaning and validation, SMS reminders are associated with a modest reduction in no-show rates.

## Recommendations

Based on the analysis, the following actions could help reduce missed appointments and improve clinic efficiency:

1. **Prioritize short scheduling windows (0–7 days)**

   Appointments scheduled within 0–7 days show significantly lower no-show rates compared to longer wait times. Clinics should prioritize keeping appointment wait times as short as possible when feasible, especially for patients with higher no-show risk.

3. **Apply targeted reminder strategies to high-risk appointments**

   Longer wait times and younger age groups are associated with higher no-show rates. These appointments should receive stronger reminder workflows, such as additional SMS reminders or same-day confirmations, to reinforce attendance.

5. **Use strategic scheduling to balance risk**

   When possible, clinics could prioritize scheduling more reliable patient groups (such as older age groups or short wait-time appointments) on days with historically higher no-show rates. Conversely, higher-risk appointments could be concentrated on lower-risk weekdays to reduce overall missed appointments.

7. **Expand SMS reminders for long-wait appointments**

   After cleaning and validating the data, SMS reminders are associated with a modest reduction in no-show rates. Expanding SMS reminders specifically for appointments scheduled far in advance may help mitigate the increased risk associated with long wait times.

## Repository Contents
- `sql/` – SQL scripts for cleaning, feature engineering, KPI analysis, and dashboard views
- `dashboard/` – Tableau link and dashboard screenshot

## Tools
- SQL – cleaning, feature engineering, KPI queries
- DBeaver – database management
- Tableau Public – visualization and dashboard

select 
	wait_time_groups,
	count(*) as total, 
	sum(case when appointment_status='no_show' then 1 else 0 end) as no_shows,
	sum(case when appointment_status='show' then 1 else 0 end) as shows,
	round((sum(case when appointment_status='no_show' then 1 else 0 end)::numeric / count(*)::numeric) * 100, 2) as no_show_rate
from appointments_clean
group by wait_time_groups
order by wait_time_groups;

select 
	gender,
	COUNT(*) AS total,
  	SUM(CASE WHEN appointment_status='no_show' THEN 1 ELSE 0 END) AS no_shows,
	round((sum(case when appointment_status='no_show' then 1 else 0 end)::numeric / count(*)::numeric) * 100, 2) as no_show_rate
from appointments_clean
group by gender;

select 
	age_groups, 
	COUNT(*) AS total,
  	SUM(CASE WHEN appointment_status='no_show' THEN 1 ELSE 0 END) AS no_shows,
	round((sum(case when appointment_status='no_show' then 1 else 0 end)::numeric / count(*)::numeric) * 100, 2) as no_show_rate
from appointments_clean
group by age_groups
order by age_groups;

select 
	sms_received, 
	COUNT(*) AS total,
  	SUM(CASE WHEN appointment_status='no_show' THEN 1 ELSE 0 END) AS no_shows,
	round((sum(case when appointment_status='no_show' then 1 else 0 end)::numeric / count(*)::numeric) * 100, 2) as no_show_rate
from appointments_clean
group by sms_received
order by sms_received;

select 
	weekday, 
	COUNT(*) AS total,
  	SUM(CASE WHEN appointment_status='no_show' THEN 1 ELSE 0 END) AS no_shows,
	round((sum(case when appointment_status='no_show' then 1 else 0 end)::numeric / count(*)::numeric) * 100, 2) as no_show_rate
from appointments_clean
group by weekday
order by no_show_rate desc;

select 
	alcoholism, 
	COUNT(*) AS total,
  	SUM(CASE WHEN appointment_status='no_show' THEN 1 ELSE 0 END) AS no_shows,
	round((sum(case when appointment_status='no_show' then 1 else 0 end)::numeric / count(*)::numeric) * 100, 2) as no_show_rate
from appointments_clean
group by alcoholism
order by alcoholism;

select 
	hipertension , 
	COUNT(*) AS total,
  	SUM(CASE WHEN appointment_status='no_show' THEN 1 ELSE 0 END) AS no_shows,
	round((sum(case when appointment_status='no_show' then 1 else 0 end)::numeric / count(*)::numeric) * 100, 2) as no_show_rate
from appointments_clean
group by hipertension
order by hipertension;

select 
	diabetes  , 
	COUNT(*) AS total,
  	SUM(CASE WHEN appointment_status='no_show' THEN 1 ELSE 0 END) AS no_shows,
	round((sum(case when appointment_status='no_show' then 1 else 0 end)::numeric / count(*)::numeric) * 100, 2) as no_show_rate
from appointments_clean
group by diabetes
order by diabetes ;

select round(avg(wait_time_days),2)
from appointments_clean;


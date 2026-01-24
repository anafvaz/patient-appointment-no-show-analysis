alter table appointments 
add column wait_time_days int;

update appointments
set wait_time_days = date(appointment_day) - date(scheduled_day);

select min(wait_time_days), max (wait_time_days)
from appointments;

select count(*) AS negative_wait_rows
from appointments
where wait_time_days < 0;

SELECT
  appointment_id,
  patient_id,
  scheduled_day,
  appointment_day,
  wait_time_days
FROM appointments
WHERE wait_time_days < 0
ORDER BY wait_time_days;

create or replace view appointments_clean as
select *
from appointments
where wait_time_days >= 0;

alter table appointments
add column weekday text;

update appointments
set weekday = trim(to_char(appointment_day::date, 'Day'));

alter table appointments 
add column wait_time_groups text;

update appointments
set wait_time_groups = case 
	when wait_time_days >=0 and wait_time_days <= 7 then '0-7 days'
	when wait_time_days > 7 and wait_time_days <= 30 then '8-30 days'
	else '30+ days'
end 

alter table appointments
add column age_groups text;

update appointments
set age_groups = case
	when age between 0 and 9 then '0-9 yr'
	when age between 10 and 19 then '10-19 yr'
	when age between 20 and 29 then '20-29 yr'
	when age between 30 and 39 then '30-39 yr'
	when age between 40 and 49 then '40-49 yr'
	when age between 50 and 59 then '50-59 yr'
	when age between 60 and 69 then '60-69 yr'
	when age between 70 and 79 then '70-79 yr'
	else '80+ yr'
end
	
create or replace view appointments_clean as
select *
from appointments
where appointment_day >= scheduled_day;

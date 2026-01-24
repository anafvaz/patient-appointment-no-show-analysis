create or replace view no_show_dashboard_base as
select
  appointment_id,
  patient_id,
  appointment_status,
  case when appointment_status = 'no_show' then 1 else 0 end as is_no_show,
  age,
  age_groups,
  wait_time_days,
  wait_time_groups,
  weekday,
  sms_received,
  hipertension, 
  "Diabetes",
  alcoholism
from appointments_clean;

select *
from no_show_dashboard_base;


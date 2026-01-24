select *
from appointments  
limit 10;

alter table appointments 
rename column "PatientId" to "patient_id";

alter table appointments 
rename column "AppointmentID" to "appointment_id";

alter table appointments 
rename column "ScheduledDay" to "scheduled_day";

alter table appointments 
rename column "AppointmentDay" to "appointment_day";

alter table appointments 
rename column "smsreceived" to "sms_received";

alter table appointments 
rename column "noshow" to "no_show";

alter table appointments 
rename column "Age" to "age";

alter table appointments 
rename column "Gender" to "gender";

alter table appointments 
rename column "Neighbourhood" to "neighbourhood";

alter table appointments 
rename column "Scholarship" to "scholarship";

alter table appointments 
rename column "Hipertension" to "hipertension";

alter table appointments 
rename column "Alcoholism" to "alcoholism";

alter table appointments 
rename column "Handcap" to "handcap";

alter table appointments 
rename column "no_show" to "appointment_status";

alter table appointments 
rename column "Diabetes" to "diabetes";

select min(age),  max(age)
from appointments;

delete 
from appointments 
where age <0 or age is null;

update appointments
set appointment_status = 'no_show'
where appointment_status = 'Yes';

update appointments
set appointment_status = 'show'
where appointment_status = 'No';

select distinct  appointment_status
from appointments;


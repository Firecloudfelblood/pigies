--Gyovanny Cavazos Marquez

--Cargamos el archivo
appo = load '/home/ubuntu/environment/appointments.csv'
using PigStorage(',')
as (PatientId:long,AppointmentID:long,Gender:chararray,Age:long,Neighbourhood:chararray,
Scholarship:long,illness:chararray,SMS_received:long,scheduled_year:long,
scheduled_month:chararray,scheduled_day:long,scheduled_hour:long,
scheduled_minute:long,appointment_year:long,appointment_month:chararray,
appointment_day:chararray,appointmen_dow:chararray,No_show:chararray );

--Filtramos los que se presentaron
presentes = FILTER appo BY No_show == '"Yes"';

--Agrupamos por enfermedad
enfermedad = GROUP presentes BY illness;

--Sumamos
suma = FOREACH enfermedad GENERATE(group, COUNT(presentes));

--imprimimos
DUMP suma;
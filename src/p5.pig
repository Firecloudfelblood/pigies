--Gyovanny Cavazos Marquez

--Cargamos el archivo
appo = load '/home/ubuntu/environment/appointments.csv'
using PigStorage(',')
as (PatientId:long,AppointmentID:long,Gender:chararray,Age:long,Neighbourhood:chararray,
Scholarship:long,illness:chararray,SMS_received:long,scheduled_year:long,
scheduled_month:chararray,scheduled_day:long,scheduled_hour:long,
scheduled_minute:long,appointment_year:long,appointment_month:chararray,
appointment_day:chararray,appointmen_dow:chararray,No_show:chararray );

ranked = rank appo;

--Quitamos cabecera
sincabecera = FILTER ranked BY (rank_appo > 1);

--Filtramos los que se presentaron y por enfermedad
presentes = GROUP sincabecera BY No_show;

--Sumamos
suma = FOREACH presentes GENERATE (group, AVG(sincabecera.Age));

--Imprimimos
DUMP suma;
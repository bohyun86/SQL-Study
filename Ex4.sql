alter table Patients add Address varchar(100);

alter table Doctors modify column HireDate datetime;

alter table Appointments add AppointmentTime time;

alter table Appointments drop column Status;

alter table Doctors add PhoneNumber varchar(255) unique;
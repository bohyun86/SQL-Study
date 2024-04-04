create database HealthcareManagement;

use HealthcareManagement;

create table Patients (
	PatientID int primary key auto_increment,
    Name varchar(20),
    DOB date check (year(DOB) >= 1900),
    Gender ENUM('Male', 'Female'), 
    Phone varchar(30) unique
);

create table Doctors (
	DoctorID int primary key auto_increment,
    Name varchar(20) NOT NULL,
    Email varchar(40) unique,
    Specialization varchar(30) NOT NULL,
    HireDate date default (current_date)
);

create table Appointments (
	AppointmentID int primary key auto_increment,
    PatientID int,
    DoctorID int,
    AppointmentDate date CHECK (YEAR(AppointmentDate) >= 2000),
    Status enum('Scheduled', 'Completed', 'Cancelled'),
    foreign key (PatientID) references Patients(PatientID),
    foreign key (DoctorID) references Doctors(DoctorID)
);


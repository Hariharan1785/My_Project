#============================================Hospital Management System MySQL Database=====================================================================
# Database name : hospital_management;
# DML command used: select /insert / update 
# DDL Command used : create/ alter 
# Constraints used : Primary Key / Foreign Key 
# Hospital  Management Modules Contains:
# 1. hospital_details
# 2. employee
# 3. patient
# 4. doctor
# 5. nurse 
# 6. receptionist
# 7. physician_details
# 8. ward_allocation details
# 9. medicine details

#Database Created hospital_management
create database hospital_management;

#hospital_management database used
use hospital_management;

# Hospital Details Table 1 Created
# Table Creation
create table hospital_details(hospital_id varchar(20),hospital_name varchar(20),address varchar(20),location varchar(20),phone int,email_addr varchar(20))

# hospital_details table structure Viewed:
desc hospital_details;

# hospital_details Records Fetched
select * from hospital_details;

#Hospital Details Records Loaded using Insert query:
insert into hospital_details values('hos1001','Himalyan','Tambaram','Chennai',23456,'himalayan@gmail.com');
#-------------------------------------------------------------------------------------------------------------------
# Employee Table2 Created
create table employee(EID varchar(20),ENAME varchar(20),EADDRESS varchar(20),ECON int, EJOB varchar(20),ESAL int,
PRIMARY KEY(EID));

# Table Structured Viewed
desc employee;

# Employee Table Records Fetched
select * from employee;

# Employee Loaded using  Insert Query ##
insert into employee values('E003','Sounik','MDH',34512,'RP',4000);

insert into employee values('E004','Abir','KOL',45123,'NS',2000);

insert into employee values('E005','Souvik','KOL',45123,'NS',3000);

insert into employee values('E006','Nandini','DBG',51234,'DC',7000);

insert into employee values('E007','Debina','KOL',12345,'NS',2000);
#-------------------------------------------------------------------------------------------------------------
# Patient Table3 Created

create table patient(PatientID varchar(20),EID varchar(20), PatientName varchar(20),PatientAddress varchar(20),
ConNo int,D_O_AD varchar(20),D_O_DIS varchar(20),PRIMARY KEY(PatientID),FOREIGN KEY (EID) REFERENCES EMPLOYEE(EID));

# Patient Table Structure Viewed
desc patient;

# Patient Table Records Fetched
select * from patient;

# Patient Record Loaded using Insert Query
insert into patient values('P002','E002','Suresh','Madurai',777,'06/03/2023','07/08/2023');
insert into patient values('P003','E003','Saravesh','Tirupati',888,'17/09/2023','11/12/2023');
insert into patient values('P004','E004','Kali','Delhi',555,'17/12/2023','01/31/2024');
insert into patient values('P005','E005','Nayak','Mumbai',444,'18/06/2023','08/31/2023');

#-----------------------------------------------------------------------------------------------------------

#Doctor Table4 Created

create table doctor(EID varchar(20),PatientID varchar(20),DocName varchar(20),Doc_spec varchar(20),FOREIGN KEY(EID) REFERENCES EMPLOYEE(EID),FOREIGN KEY(PatientID) REFERENCES PATIENT(PatientID));

# Doctor Table Structure Viewed
desc doctor;

# Doctor Table Records Fetched
select * from doctor;

# Doctor Records Loaded using Insert Query
insert into doctor values('E001','P001','Apartim','MBBS');
insert into doctor values('E001','P002','Apartim','MBBS');
insert into doctor values('E006','P003','Nadini','MD');
insert into doctor values('E006','P005','Nadini','MD');
insert into doctor values('E006','P005','Nadini','MD');

----------------------------------------------------------------------------------------------------------------------
# Nurse Table5 created
create table nurse(EID varchar(20),PatientID varchar(20),NurName varchar(20),FOREIGN KEY(EID) REFERENCES EMPLOYEE(EID),FOREIGN KEY(PatientID) REFERENCES PATIENT(PatientID))

# Nurse Table Strurcture Viewed
desc nurse;

# Nurse Table Records Fetched
select * from nurse;

# Nurse Records Loaded using Insert Query:
insert into nurse values('E003','P001','Soumik');
insert into nurse values('E005','P002','Souvik');
insert into nurse values('E003','P002','Soumik');
insert into nurse values('E007','P003','Debina');
insert into nurse values('E003','P004','Soumik');
insert into nurse values('E005','P005','Souvik');
----------------------------------------------------------------------------------------------------------------
# Receptionist Table6 Created
create table receptionist(EID varchar(20),Rep_name varchar(20),FOREIGN KEY(EID) REFERENCES EMPLOYEE(EID))

# Receptionist Records Structure Viewed
desc receptionist;

# Receptionist Records Fetched
select * from receptionist;

# Receptionist Records Loaded using Insert Query

insert into receptionist values('E001','Sagar Paul');
insert into receptionist values('E004','Abir Saha');

------------------------------------------------------------------------------------------------------------------
#Physician_Details Table7 Created
create table  physician_details(RNo varchar(20),EID varchar(20),PatientID varchar(20),Emp_Type varchar(20),Rec_Det varchar(20),FOREIGN KEY(EID) REFERENCES EMPLOYEE(EID),FOREIGN KEY(PatientID) REFERENCES PATIENT(PatientID),
PRIMARY KEY(RNo));

# physician_details structure Viewed
desc physician_details;

# physician_details Records Fetched:
select * from physician_details;

# physician_details Records Loaded using Insert Query:

insert into physician_details values('R001','E001','P001','Doctor','Medication');

insert into physician_details values('R002','E001','P003','Nurse','Care');

insert into physician_details values('R003','E001','P005','Nurse','Care');

insert into physician_details values('R004','E002','P004','Doctor','Operation');

insert into physician_details values('R005','E002','P003','Nurse','Care');

insert into physician_details values('R006','E007','P005','Doctor','Ortho'
---------------------------------------------------------------------------------------------------------------------
# Ward Allocation Table8 Created 

create table ward_allocation(ReID varchar(20),RoNo varchar(20),Rotype varchar(20),EID varchar(20),PatientID varchar(20),FOREIGN KEY(EID) REFERENCES EMPLOYEE(EID),FOREIGN KEY(PatientID) REFERENCES PATIENT(PatientID),PRIMARY KEY(ReID),EType varchar(20));

# ward_allocation Structure Viewed:
desc ward_allocation;

# ward_allocation Records Fetched
select * from ward_allocation;

# ward allocation Records Loaded using Insert Query:

insert into ward_allocation values('Re002',100,'ICU','E001','P001','Doctor');
insert into ward_allocation values('Re003',101,'ICU','E002','P002','Nurse');
insert into ward_allocation values('Re004',102,'General','E006','P001','Doctor');
insert into ward_allocation values('Re005',103,'ICU','E003','P001','Nurse');
insert into ward_allocation values('Re006',104,'General','E004','P002','Doctor');
---------------------------------------------------------------------------------------------------------------------
# Medicine Table9 Created

create table medicine(MedicineID varchar(20),PatientID varchar(20),FOREIGN KEY(PatientID) REFERENCES PATIENT(PatientID),quantity int,med_name varchar(20));

# Medicine Table Structure Viewed
desc medicine;

# Medicine Records Fetched
select * from medicine;

# Medicine Records Loaded using Insert Query:
insert into medicine values('M1','P001',3,'Metacine');
insert into medicine values('M2','P001',4,'Dolo65');
insert into medicine values('M3','P003',2,'Citrizen');
insert into medicine values('M4','P005',7,'Entrozyme');
insert into medicine values('M5','P003',5,'Calpol');
#=================================================================================================================
# Employee Table Altered using Alter Query
alter table employee add(Email varchar(20));
#------------------------------------------------------------------------------------------------------------------
#Employee Email column has been updated with Mail Id using updated Query:
update employee set Email='Abir@gmail.com' where ename ='Abir';
update employee set Email='Sounik@gmail.com' where ename ='Sounik';
update employee set Email='Nandini@gmail.com' where ename ='Nandini';
update employee set Email='Debina@gmail.com' where ename ='Debina';
#--------------------------------------------------------------------------------------------------------------
#=================================================================================================================

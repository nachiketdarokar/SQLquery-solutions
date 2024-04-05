create database cp;
use cp;

CREATE TABLE patients(
   patient_id INTEGER  NOT NULL PRIMARY KEY 
  ,name       VARCHAR(6) NOT NULL
  ,age        INTEGER  NOT NULL
  ,gender     VARCHAR(6) NOT NULL
  ,address    VARCHAR(12) NOT NULL
  ,disease    VARCHAR(13) NOT NULL
  ,doctor_id  INTEGER  NOT NULL
);
INSERT INTO patients(patient_id,name,age,gender,address,disease,doctor_id) VALUES (1,'reema',23,'female','althan,Surat','fever',21);
INSERT INTO patients(patient_id,name,age,gender,address,disease,doctor_id) VALUES (2,'kusum',50,'female','vadodara','heart failure',22);
INSERT INTO patients(patient_id,name,age,gender,address,disease,doctor_id) VALUES (3,'carlin',43,'male','vapi','infection',23);
INSERT INTO patients(patient_id,name,age,gender,address,disease,doctor_id) VALUES (4,'rahul',26,'male','navsari','cancer',21);
INSERT INTO patients(patient_id,name,age,gender,address,disease,doctor_id) VALUES (6,'hansha',55,'female','vapi','diabetes',22);

CREATE TABLE doctor(
   doctor_id INTEGER  NOT NULL PRIMARY KEY 
  ,name      VARCHAR(7) NOT NULL
  ,age       INTEGER  NOT NULL
  ,gender    VARCHAR(6) NOT NULL
  ,address   VARCHAR(7) NOT NULL
);
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (21,'asif',55,'male','baruch');
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (22,'dhawal',40,'male','Surat');
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (23,'krishna',39,'female','Surat');
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (24,'lissa',35,'female','Navsari');
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (25,'leeba',34,'female','baruch');
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (26,'vini',33,'female','Surat');
INSERT INTO doctor(doctor_id,name,age,gender,address) VALUES (27,'Dhiren',32,'male','Navsari');

CREATE TABLE bills(
   bill_no     INTEGER  NOT NULL PRIMARY KEY 
  ,patient_id  INTEGER  NOT NULL
  ,doctor_id   INTEGER  NOT NULL
  ,room_charge INTEGER 
  ,no_of_days  INTEGER  NOT NULL
);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5005,1,340,500,4);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5006,2,600,480,8);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5008,3,800,340,3);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5009,4,780,890,6);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5010,3,400,NULL,1);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5011,1,200,300,1);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5012,2,600,110,2);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5013,3,330,210,1);
INSERT INTO bills(bill_no,patient_id,doctor_id,room_charge,no_of_days) VALUES (5014,1,230,340,2);

CREATE TABLE laboratory(
   lan_no     INTEGER  NOT NULL PRIMARY KEY 
  ,patient_id INTEGER  NOT NULL
  ,doctor_id  INTEGER  NOT NULL
  ,date       DATE  NOT NULL
  ,amount     INTEGER  NOT NULL
);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (10,1,21,'2000/2/2',4000);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (20,2,21,'2001/9/9',300);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (30,3,22,'2001/3/3',600);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (40,1,23,'2002/6/2',800);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (50,4,21,'2003/7/5',900);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (60,2,25,'2004/4/10',550);
INSERT INTO laboratory(lan_no,patient_id,doctor_id,date,amount) VALUES (70,4,22,'2005/4/3',900);
select * from laboratory;

#Query & Solutions
#Lets create a stored procedure to extract the patient names that are females.
delimiter &&
create procedure patientname()
begin
select name,gender from patients
where gender='female';
end &&
delimiter ;
call patientname();


#Let’s create a stored procedure to extract the top ‘n’ doctor details in descending order of age and ascending order of doctor name. 
#‘n’ is a user input.
delimiter &&
create procedure docname(in n int)
begin
select * from doctor
order by age desc,name;
end &&
delimiter ;
call docname(5);


#Let’s create a stored procedure to insert a record in the patients table.
delimiter &&
create procedure insrow2   
(in patientid1 int,
in name1 varchar(20),
in age1 int,
in gender1 varchar(20),
in address1 varchar(50),
in disease1 varchar(20),
in doctorid1 int)
begin
insert into patients values(patientid1,name1,age1,gender1,address1,disease1,doctorid1);
end &&
delimiter ;
call insrow2(12,"achu",56,'male','nagpur','cold',23);


#Let’s create a stored procedure to extract and display the maximum room charge taken.
delimiter &&
create procedure maxcharge(out x int)
begin 
select max(room_charge) from bills;
end &&
delimiter ;
call maxcharge(@m);


#Let’s create a stored procedure to extract the amount of laboratory bill in ‘var1’ and 
#display the amount given by patient of patient id ‘var1’.
delimiter &&
create procedure billpay3(inout var1 int)
begin 
select amount into var1 from laboratory
where lan_no=var1;
end &&
delimiter ;
set @m=10;
call billpay3(10);
select @m;


#DROP the stored procedure
drop procedure maxcharge;
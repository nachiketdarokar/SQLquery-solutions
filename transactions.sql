create database transactions_s;
use transactions_s;
create table property(property_ID int,property_name varchar(30),no_of_floors int,no_of_flats int,sqft_area float);
insert into property values(1,"Shantiniketan",4,80,600.67);
insert into property values(2,"Neel Sidhi",7,120,1000.25);
insert into property values(3,"Adhiraj",3,60,650.67);
insert into property values(4,"Shelter Complex",10,115,1200.67);
insert into property values(5,"Bhoomi Heights",18,200,1500.34);
insert into property values(6,"Goodwill",7,110,800);
select * from property;


#Q1. Insert a row in the table and commit it.
insert into property values(7,'Harihar',8,120,500);
commit;


#Q2. Update the Property table, change the value of flats to 65 for “Adhiraj” property 
#and commit this.
update property set no_of_flats=65 where property_name='Adhiraj';
commit;

#Q3. Insert some rows in the table and rollback them.
insert into property values(8,'shyam developers',12,10,900);
rollback;

#Q4. Delete a row in the table and rollback it.
delete from property where no_of_flats>100;
rollback;
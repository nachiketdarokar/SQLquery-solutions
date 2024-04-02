create database cw;
use cw;

create table employee(id int,name varchar(20),age int,gender enum('F','M'),salary int,state varchar(20));
insert into employee values(1,'simran',20,'F',20000,'maharashtra');
insert into employee values(2,'harsh',22,'M',30000,'gujarat');
insert into employee values(3,'rahul',25,'M',40000,'delhi');
insert into employee values(4,'akash',30,'M',70000,'west bengal');
insert into employee values(5,'sajal',21,'F',15000,'maharashtra');
insert into employee values(6,'mukesh',24,'M',25000,'delhi');
insert into employee values(7,'shantanu',19,'M',12000,'gujarat');
insert into employee values(8,'preeti',26,'F',32000,'west bengal');
insert into employee values(9,'kalpita',28,'F',35000,'kerala');
insert into employee values(10,'anurag',29,'M',40000,'west bengal');
select * from employee;

#Q1. Segregate the employee into different designations based on salary.
select * , case
when salary <= 20000 then 'Jr.Engineer'
when salary <=40000 then 'Sr.Engineer'
else 'Manager'
end as 'Designation'
from employee;

#Q2. Retrieve the results such that
#a.	For Female employee, employee salaries should come in descending order
#b.	For Male employee, we should get employee salaries in ascending order
select * from employee
order by 
case gender when 'F' then salary end desc,
case gender when 'M' then salary end;

#Q3. Group employees based on their salary and calculate the minimum and maximum salary for a particular 
#range of employees.
select case
when salary <= 20000 then 'Jr.Engineer'
when salary <=40000 then 'Sr.Engineer'
else 'Manager'
end as 'Designation',
min(salary) AS 'MINIMUM SALARY',max(salary) as 'MAXIMUM SALARY'
from employee 
group by case
when salary <= 20000 then 'Jr.Engineer'
when salary <=40000 then 'Sr.Engineer'
else 'Manager'
end; 

#Q4. Update the employee table such that
#a.	If employee state is maharashtra, then update to MH
#b.	If employee state is west bengal, then update to WB
#c.	For all other states update value to Other
update employee set state= case state 
when 'maharashtra' then 'MH'
when 'west bengal' then 'WB'
else 'others'
end
where id>=1; 
select * from employee;

#Q5. Set the values like id, name, age, state, salary to some new values and gender to 0 for male and 1 for female.
# Using case when, insert these values in the table but ‘M’ and ‘F’ instead of 0 and 1.
set @id=11;
set @name='Nachiket';
set @age=24;
set @state='maharashtra';
set @salary=100000;
set @gender=0;

insert into employee
values (@id,@name,@age,@state,@salary
case @gender
when 0 then 'M'
when 1 then 'F'
end);
select * from employee;

	



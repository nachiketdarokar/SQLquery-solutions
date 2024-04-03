create database cw;
use cw;

select * from employee;


#Q1. Write a query to create a CTE that stores name and age of employees and retrieve it from the CTE.
with nameage as
(select name,age from employee)
select * from nameage; 

#Q2. Write a query to create a CTE that stores name and salary of employees displaying ‘greater than equal to 35000’ 
#and ‘less than equal to 35000’ as per the salary for maharashtra state employees and retrieve it from the CTE.
with namesal as 
(select name,case
when salary < 35000 then 'less than 35000'
when salary >=35000 then 'greater than equal to 35000'
end as salary,
state
from employee
where state='maharashtra')
select * from namesal;  

#Q3. Write a query to print a series of first 5 odd numbers using recursive CTE. (serial no., odd no.)
with recursive odd(serial_num,odd_num) as
(select 1,1
union all
select
serial_num +1,odd_num +2
from odd 
where serial_num<5)
select * from odd;
create database date_time;
use date_time;

create table orders(id int,name varchar(20),product varchar(20),order_date date,delivery_date date);
insert into orders values(1,'simran','mobile phone','2022-01-01','2022-01-07');
insert into orders values(2,'harsh','laptop','2022-01-03','2022-01-08');
insert into orders values(3,'tanuja','dress','2022-02-03','2022-02-09');
insert into orders values(4,'vedant','earphones','2022-02-04','2022-02-09');
insert into orders values(5,'abhishek','microwave oven','2022-03-09','2022-03-15');
insert into orders values(6,'sanika','makeup','2022-03-14','2022-03-20');
insert into orders values(7,'sami','tablet','2022-04-05','2022-04-07');

create table birthday(name varchar(20),birth_date_time timestamp);

insert into birthday values('simran','2002-04-14 23:45:00');
insert into birthday values('harsh','2000-12-14 05:30:20');
insert into birthday values('tanuja','2001-12-12 09:10:10');
insert into birthday values('vedant','2001-08-18 13:25:00');
insert into birthday values('abhishek','2001-05-17 03:35:45');
insert into birthday values('srujan','2008-11-15 05:30:00');
insert into birthday values('sharvani','2004-03-21 19:05:15');


#Q1.  Retrieve the current timestamp.
select now();

#Q2.  Retrieve the current date and current time.
select curdate(),curtime();

#Q3. Add 30 days to the order date from order table.
select *,date_add(order_date,interval 30 day) as payment_date
from orders;

#Q4. Add 1 year to the order date from order table.
select *,date_add(order_date,interval 1 year) from orders;

#Q5. Subtract 7 days from the order date from order table.
select order_date,date_sub(order_date,interval 7 day) from orders;

#Q6. Extract the year, month and day from delivery date.
select delivery_date,extract(year from delivery_date) as year,
extract(month from delivery_date) as month,
extract(day from delivery_date) as day from orders;

#Q7. Extract the week from delivery date.
select delivery_date,extract(week from delivery_date) from orders;

#Q8. Display the difference between delivery date and order date.
select datediff(delivery_date,order_date) as diff_btw_delivery_order
from orders;

#Q9. Add one day and one hour to the birth date from birthday table.
select birth_date_time,addtime(birth_date_time,'25:00:00') from birthday;

#Q10. Find out the hour, minute and second from birth date.
select birth_date_time,hour(birth_date_time) as hours,
minute(birth_date_time) as minutes,
second(birth_date_time) as seconds from birthday;

#Q11. Find out the difference in months between birth date and '2004-03-21 19:05:15'.
select birth_date_time,timestamp('2004-03-21 19:05:15'),timestampdiff(month,birth_date_time,'2004-03-21 19:05:15') as diff
from birthday;


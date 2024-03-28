create database practice_set;
use practice_set;
create table employeee(
    emp_id int,
    emp_name varchar(20),
    dept_id int,
    salary int,
    manager_id int,
    emp_age int
);



insert into employeee values(1,'Raj',500,10000,4,39);
insert into employeee values(2,'Mohit',500,15000,5,48);
insert into employeee values(3,'Vikas',500,10000,4,37);
insert into employeee values(4,'Rohit',500,5000,2,16);
insert into employeee values(5,'Arpit',600,12000,6,55);
insert into employeee values(6,'Sugam',600,12000,2,14);
insert into employeee values(7,'Sanjay',600,9000,2,13);
insert into employeee values(8,'Mithun',600,8000,2,12);
insert into employeee values(9,'Deb',300,6000,6,51);
insert into employeee values(10,'Rakesh',700,7000,6,50);

create database sr;
use sr;

create table msg(id int, fname varchar(20),lname varchar(20),age int,state varchar(20),payment int,message varchar(50));
insert into msg values(1,'Simran','Surve',20,'maharashtra',20000,'I love my planet Earth');
insert into msg values(2,'John','Dsouza',27,'california',25000,'Happy birthday Mom!');
insert into msg values(3,'Suzane','Peter',34,'eastern cape',30000,'Save our Earth');
insert into msg values(4,'Sherlin','Fernandes',30,'Texas',23000,'Happy Birthday David');
insert into msg values(5,'Harsh','Shah',22,'Gujarat',21000,'stop the destruction of mother nature');
insert into msg values(6,'Celine','Sebastian',45,'Alaska',35000,'How you doin!');
insert into msg values(7,'Kieron','Pollard',35,'West Indies',32000,'Happy Birthday Jenna');
insert into msg values(8,'Quinton','Decock',30,'northern cape',23000,'I love cricket');
insert into msg values(9,'Tanuja','Patil',24,'West bengal',21000,'Happy Birthday Vedant');
insert into msg values(10,'Justin','Beiber',33,'Texas',40000,'Music is the peace on Earth');
select * from msg;

#STRING FUNCTION : 

#Q1. Select the ASCII value of the fname column.
select ASCII(fname) from msg;

#Q2. Display the length of the messages sent by the customers.
select char_length(msg.message) from msg;

#Q3. Concatenate the first name and last name of the customers.
select concat(fname,lname) as name from msg;

#Q4.Concatenate the first name and last name of the customers with a suitable separator.
select concat_ws(' ',fname,lname) as name from msg;

#Q5. Find the age column from id,lname,age,payment.
select elt(3,id,lname,age,payment) from msg;

#Q6. Find the position of age in id,lname,age,payment.
select field(age,id,lname,age,payment) from msg;

#Q7.Replace the words in state column with fname from the 4th position for 3 characters.
select insert(state,4,3,fname) from msg;

#Q8. Return the 6 left characters of the messages.
select left(message,6) from msg;

#Q9. Return the 4 right characters of the state.
select right(state,4) from msg;

#Q10. Convert the messages to lowercase.
select lower(message) from msg;

#Q11. Convert the messages to uppercase.
select upper(message) from msg;

#Q12. Create a string of 15 spaces.
select space(15);

#Q13. Remove the spaces from “    CloudyML”.
select ltrim('    CloudyML');

#Q14. Remove the spaces from “CloudyML        ”.
select rtrim('CloudyML        ');

#Q15. Repeat the first name 4 times.
select repeat(fname,4) from msg;

#Q16. Reverse the messages.
select reverse(message) from msg;

#REGULAR EXPRESSION FUNCTION :

#Q1. Use Regex to display customer names of Texas state.
Select fname,lname from msg where state regexp 'Texas';

#Q2. Use Regex to display messages beginning with ‘Happy’.
select message from msg where message regexp '^happy';

#Q3. Use Regex to display first names matching with ‘[A-Z]’.
select fname from msg where fname regexp '[A-Z]';

#Q4. Use Regex to display first names beginning with ‘[a-z]’.
select fname from msg where fname regexp '[^a-z]';

#Q5. Use Regex to display the details of customers for which payment matching with ‘[0-9]’.
select * from msg where payment regexp '[0-9]';

#Q6. Use Regex to display the name and age of customers having age 20 or 30.
select fname,lname,age from msg where age regexp '20|30';

#Q7. Use Regex to display the name and message for customers whose message end with ‘Earth’.
select fname,lname,message from msg where message regexp 'earth$';

#Q8. Use Regex to display the first name and last name for which last name have ‘Se’ or “Su’ at the beginning.
select fname,lname from msg where  lname regexp 'se.|su.'; 

#Q9. Use Regex to display the name and payment of customers beginning with 3 and having 5 digits.
select fname,payment from msg where payment regexp '3.{4}';

#Q10. Use Regex to display customer names not beginning with ‘S’.
select fname from msg where fname regexp '^[^s]'; 
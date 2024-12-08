# creates database
create database Qadbt;

# This points database
use Qadbt;

#create tables
create table employeeInfo(name varchar(20), id int, location varchar(20), age int);

#describe the table
describe employeeInfo;

#inserting data into tables
insert into employeeInfo values('uttam', 1,'India', 26);
insert into employeeInfo values('Mani', 2, 'india', 25);
insert into employeeInfo values('Rani', 3, 'USA', 30);
insert into employeeInfo values('Nithin',4,'USA', 28);

#seelct and from shows the output in the form of table
select name, id, location, age from employeeInfo;
select name id, name from employeeInfo;

#Retrieve all columns from table
select * from employeeInfo;

select * from employeeInfo where id=1; 

#adds column to a table
alter table employeeInfo add gender varchar(20);

#update the varchar value
alter table employeeInfo modify name varchar(15);

#delete a column from table
alter table employeeinfo drop gender;

#adds column to a table
alter table employeeInfo add gender varchar(20);

#adds/updates data inside the column gender
update employeeInfo set gender='female' where id= 2;
update employeeInfo set gender='male' where id= 1;
update employeeInfo set gender='female' where id= 3;
update employeeInfo set gender='male' where id= 4;

#delets a row from the table
delete from employeeInfo where id=4;

#creates database
create database dummy;

#drops database
drop database dummy;


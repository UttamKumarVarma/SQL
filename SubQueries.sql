use business;

#create tables
create table employeeData(name varchar(20), salary int, age int);
create table employeeLocation(name varchar(20), location varchar(20));

insert into employeeData values('uttam', 100, 26);
insert into employeeData values('mani', 200, 25);
insert into employeeData values('nithin', 300, 28);


insert into employeeLocation values('uttam', 'USA');
insert into employeeLocation values('mani', 'IL');
insert into employeeLocation values('nithin', 'NY');

select * from employeeData;
select * from employeeLocation;


#Receives employee age and name who are present in IL
select name, age from employeeData where name= (select name from employeeLocation where location ='IL');

#Returns salary of people located in USA
select name, salary from employeeData where name=(select name from employeeLocation where location ='USA');

#we use in if we get multiple values from subquery
select name,salary from employeeData where name in (select name from employeeLocation where location in('USA','IL'));





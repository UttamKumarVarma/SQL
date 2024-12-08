use business;

#inorder to get values in idNumber we use not null constraint
create table constraints(flightName varchar(20), idNumber integer not null);

insert into constraints values("indigo",1);

insert into constraints values("indigo1",null);

#Default- Gives value to a cell by default
create table useDefault1(id int,name varchar(10) default 'Uttam');

insert into useDefault1 values(1,'hjd');
insert into useDefault1(id) values(4);

select * from useDefault1;

#primary key
create table uttam(empId int, name varchar(20), age int,primary key(empId));
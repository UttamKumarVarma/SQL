create database business;

use business;

create table transactions(month varchar(50), day int(50),amount int(50),branch varchar(50));
select * from transactions;

insert into transactions values('feb',13, 6000,'banglore');

insert into transactions values('feb',14, 7000,'Mumbai');
insert into transactions values('mar',14, 7000,'Canada');

insert into transactions values('mar',15, 8000,'Mumbai');
insert into transactions values('apr',14, 7000,'chicago');
insert into transactions values('apr',24, 5000,'NewYork');

#Adds totral amount in the table.
select sum(amount) from transactions;

select month from transactions group by month;

#total sum of amount generated for each month
select sum(amount),month from transactions group by month;

#return max amount for each month
select month,max(amount) from transactions group by month;

#return min amount for each month
select month,min(amount) from transactions group by month;

#return max amount from each branch
select branch, min(amount) from transactions group by branch;


#return avg amount fro each month 
select month,avg(amount) from transactions group by month;


#return record count of each month
select month,count(*) from transactions group by month;


#whenevr we use group by we use "having"  instead of "where"
select branch,count(*) from transactions group by branch having count(*)<2;

#use where and group by together
select sum(amount),branch from transactions where branch='banglore' or branch = 'Chicago' group by branch;

#checks amount>10000 for all branches in feb month
select sum(amount),branch from transactions where month ='feb' group by branch having sum(amount)<10000;



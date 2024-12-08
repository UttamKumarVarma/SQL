use Qadbt;
select * from employeeInfo;
insert into employeeInfo values('uttam',4,'USA', 27,'male');

#to get distinct values
select distinct name from employeeInfo;

#check employees whose location is USA
select name from employeeInfo where location='USA';

#check employee names whose age is less than 26
select name from employeeInfo where age<26;

#check employee names whose age is less than 26 and their location is India
select name from employeeInfo where age<26 and location = 'india' or location ='India';

#retrieve people whose location is from either india or usa
select name from employeeInfo where location = 'usa' or location = 'India';

#select name of people whose age is less than 30 and their location is India or select employees who are females
select name from employeeInfo where (location= 'India' and age<30) or gender= 'female';


#in operator (helps to satisfy condition for set of values and reduces the code)
select name from employeeInfo where location in('india', 'usa');


#not in
select name from employeeInfo where location not in('india', 'yuganda');


#between operator - to find set of range of data(Ex- return names of employees having age between 25 and 30)
select name from employeeInfo where age between 25 and 30;

#to filter names of employees whose ages are not between 27 and 30.
select name from employeeInfo where age not between 27 and 30;
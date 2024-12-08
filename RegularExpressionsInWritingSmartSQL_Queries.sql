use Qadbt;

select * from employeeInfo;

#return all names starts with m
select name from employeeInfo where name like 'm%';


#return names when second letetr is a
select name from employeeInfo where name like '_a%';

#checks for matching of two chars
select name from employeeInfo where name like '___i';
update employeeInfo set name ='Ravi' where id=3;


#sorts and retrieved the data
select * from employeeInfo order by name;

# revers sorts the retrieved data
select * from employeeInfo order by name desc;
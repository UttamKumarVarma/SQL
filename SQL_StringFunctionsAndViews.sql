use business;

select * from company;


#creates a small table(View) from company table
create view googleInfo as
select * from company where name='Google';

select * from googleInfo;

#concat function:
select concat(name, branch) as NameAndBranch from company;


#substring - returns a part of string based on index as input
select substr(name,8) from company where name='QAClickAcademy';
 # also we can start and ending indexes
 select substr(name,7,3) from company where name='QAClickAcademy';
 
 
 #replace
 select replace(name, 'QA','') from company;
 
 
 #length
 select name,length(name) from company;
 
 
  #limit
 select * from company limit 3;

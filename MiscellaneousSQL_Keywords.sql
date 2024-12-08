create database miscellaneous;
 use miscellaneous;
 
 
 CREATE TABLE CollegeFirtsAndSec (
    id INT,
    name VARCHAR(50)
);

INSERT INTO CollegeFirtsAndSec (id, name) VALUES
(1, '53'),
(2, 'tim'),
(3, '643'),
(4, 'ben'),
(5, '223'),
(6, 'tam'),
(7, '574'),
(8, 'sam'),
(9, '422'),
(20, 'ram'),
(21, '983'),
(22, 'Joe');


CREATE TABLE CollegeSecAndThirdStudents (
    id INT,
    name VARCHAR(50)
);

INSERT INTO CollegeSecAndThirdStudents (id, name) VALUES
(1, '53'),
(2, 'tim'),
(3, '643'),
(4, 'ben'),
(15, 'k223'),
(16, 'ktam'),
(17, 'k574');

select * from CollegeFirtsAndSec;
select * from CollegeSecAndThirdStudents;


#Union
select * from CollegeFirtsAndSec union (select * from CollegeSecAndThirdStudents);


#Union All
select * from CollegeFirtsAndSec union all (select * from CollegeSecAndThirdStudents);

#intersect - return common records/rows from table (oracle have intersect keyword by in MySQL we should write logic)
select * from CollegeFirtsAndSec where id in(select id from CollegeSecAndThirdStudents);



 




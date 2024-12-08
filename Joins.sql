use business;
CREATE TABLE company (
    Name VARCHAR(100),
    Branch VARCHAR(100),
    employees INT
);
INSERT INTO company (Name, Branch, employees) VALUES ('QAClickAcademy', 'US', 20);
INSERT INTO company (Name, Branch, employees) VALUES ('Google', 'US', 500);
INSERT INTO company (Name, Branch, employees) VALUES ('Yahoo', 'Canada', 250);
INSERT INTO company (Name, Branch, employees) VALUES ('Google', 'India', 400);
INSERT INTO company (Name, Branch, employees) VALUES ('QAClickAcademy', 'India', 75);
INSERT INTO company (Name, Branch, employees) VALUES ('QAClickAcademy', 'UK', 10);
INSERT INTO company (Name, Branch, employees) VALUES ('QAClickAcademy', 'Canada', 30);
INSERT INTO company (Name, Branch, employees) VALUES ('Yahoo', 'US', 200);
INSERT INTO company (Name, Branch, employees) VALUES ('Yahoo', 'India', 150);
INSERT INTO company (Name, Branch, employees) VALUES ('Facebook', 'US', 50);



CREATE TABLE established (
    Name VARCHAR(100),
    year INT
);

INSERT INTO established (Name, year) VALUES ('qaclickacademy', 2010);
INSERT INTO established (Name, year) VALUES ('google', 1990);
INSERT INTO established (Name, year) VALUES ('yahoo', 1992);
INSERT INTO established (Name, year) VALUES ('facebook', 1992);


#subquery
select name,sum(employees) from company group by name having name=(select name from established where year=1990);

#checks employee count of count where company established in 1990
select c.name,sum(c.employees),e.year from company as c join established as e on c.name=e.name where e.year =1990 group by c.name;


#checks min employee count of count where company established after 1990
select min(c.employees),c.branch from company as c join established as e on c.name=e.name where e.year> 1990 group by c.branch;


-- Create the table
CREATE TABLE StudentDetails (
    Name VARCHAR(50),
    id INT PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    Location VARCHAR(50)
);

-- Insert values into the table
INSERT INTO StudentDetails (Name, id, Age, Gender, Location) VALUES
('sai', 1, 12, 'female', 'spain'),
('Baba', 2, 15, 'Male', 'Newyork'),
('ram', 3, 15, 'Male', 'spain'),
('raghu', 4, 15, 'female', 'Newyork'),
('ajay', 5, 12, 'Male', 'Nijeria'),
('matrhru', 6, 12, 'male', 'spain');

-- Create the Grades table
CREATE TABLE Grades (
    id INT,
    Grade VARCHAR(2)
);

-- Insert grades for the first 4 ids
INSERT INTO Grades (id, Grade) VALUES
(1, 'A'),
(2, 'B'),
(3, 'A+'),
(4, 'B+');

Select * from StudentDetails;
Select * from grades;

select s.name,s.id,g.grade from StudentDetails as s inner join Grades as g on s.id=g.id;

select s.name,s.id,g.grade from StudentDetails as s left join Grades as g on s.id=g.id;


select s.name,s.id,g.grade from StudentDetails as s right join Grades as g on s.id=g.id;

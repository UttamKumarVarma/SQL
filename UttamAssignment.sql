DROP DATABASE IF EXISTS LAB;
CREATE DATABASE LAB;

USE LAB;

-- Dorms table to hold dorm names
CREATE TABLE Dorms (
    Dorm_ID INT PRIMARY KEY AUTO_INCREMENT,
    Dorm_Name VARCHAR(10) NOT NULL
);

-- Rooms table to allow multiple rooms in a dorm
CREATE TABLE Rooms (
    Room_ID INT PRIMARY KEY AUTO_INCREMENT,
    Dorm_ID INT NOT NULL,
    Room_Number INT NOT NULL,
    FOREIGN KEY (Dorm_ID) REFERENCES Dorms(Dorm_ID),
    UNIQUE (Dorm_ID, Room_Number) -- Ensure no duplicate room numbers within the same dorm
);

-- Students table with room number
CREATE TABLE Students(
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20) NOT NULL,
    Major VARCHAR(20) NOT NULL,
    Room_ID INT,
    FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)
);

-- Classes table
CREATE TABLE Classes (
    Class_ID INT PRIMARY KEY,
    Class_Name VARCHAR(10) NOT NULL,
    Location INT,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL
);

-- Enrollments table
CREATE TABLE Enrollments (
    Enrollment_ID INT PRIMARY KEY,
    Student_ID INT NOT NULL,
    Class_ID INT NOT NULL,
    Grade VARCHAR(1),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID),
    FOREIGN KEY (Class_ID) REFERENCES Classes(Class_ID)
);

SELECT * FROM Dorms;
SELECT * FROM Rooms;
SELECT * FROM Students;
SELECT * FROM Classes;
SELECT * FROM Enrollments;

-- Insert into Dorms table (3 dorms)
INSERT INTO Dorms (Dorm_Name) VALUES ('Dorm A'), ('Dorm B'), ('Dorm C');

-- Insert into Rooms table (multiple rooms in each dorm)
-- Dorm A has 2 rooms: Room 101, Room 102
-- Dorm B has 2 rooms: Room 201, Room 202
-- Dorm C has 2 rooms: Room 301, Room 302
INSERT INTO Rooms (Dorm_ID, Room_Number) VALUES 
(1, 101), (1, 102),
(2, 201), (2, 202),
(3, 301), (3, 302);

-- Insert into Students table (at least 2 students per room)
-- Dorm A, Room 101 has 2 students
-- Dorm A, Room 102 has 2 students
-- Dorm B, Room 201 has 2 students
-- Dorm B, Room 202 has 2 students
-- Dorm C, Room 301 has 2 students
-- Dorm C, Room 302 has 2 students
INSERT INTO Students (Student_ID, First_Name, Last_Name, Major, Room_ID) VALUES 
(1, 'John', 'Doe', 'Computer Science', 1), -- Dorm A, Room 101
(2, 'Jane', 'Smith', 'Mathematics', 1), -- Dorm A, Room 101
(3, 'Alice', 'Johnson', 'Physics', 2), -- Dorm A, Room 102
(4, 'Bob', 'Brown', 'Chemistry', 2), -- Dorm A, Room 102

(5, 'Charlie', 'Green', 'History', 3), -- Dorm B, Room 201
(6, 'David', 'White', 'Biology', 3), -- Dorm B, Room 201
(7, 'Eve', 'Black', 'Engineering', 4), -- Dorm B, Room 202
(8, 'Frank', 'Red', 'Philosophy', 4), -- Dorm B, Room 202

(9, 'Grace', 'Blue', 'Art', 5), -- Dorm C, Room 301
(10, 'Heidi', 'Gray', 'Music', 5), -- Dorm C, Room 301
(11, 'Ivy', 'Gold', 'Literature', 6), -- Dorm C, Room 302
(12, 'Jack', 'Silver', 'Psychology', 6); -- Dorm C, Room 302

-- Insert into Classes table (3 sample classes)
INSERT INTO Classes (Class_ID, Class_Name, Location, Start_Date, End_Date) VALUES
(1, 'M 101', 101, '2024-09-01', '2024-12-15'),
(2, 'P 201', 202, '2024-09-01', '2024-12-15'),
(3, 'H 301', 303, '2024-09-01', '2024-12-15');

-- Insert into Enrollments table (students enrolled in classes)
-- Students from Dorm A
INSERT INTO Enrollments (Enrollment_ID, Student_ID, Class_ID, Grade) VALUES 
(1, 1, 1, 'A'), -- John Doe in Math 101
(2, 2, 1, 'B'), -- Jane Smith in Math 101
(3, 3, 2, 'A'), -- Alice Johnson in Physics 201
(4, 4, 2, 'B'), -- Bob Brown in Physics 201

-- Students from Dorm B
(5, 5, 3, 'C'), -- Charlie Green in History 301
(6, 6, 3, 'A'), -- David White in History 301
(7, 7, 1, 'A'), -- Eve Black in Math 101
(8, 8, 2, 'B'), -- Frank Red in Physics 201

-- Students from Dorm C
(9, 9, 3, 'A'), -- Grace Blue in History 301
(10, 10, 1, 'C'), -- Heidi Gray in Math 101
(11, 11, 2, 'B'), -- Ivy Gold in Physics 201
(12, 12, 3, 'B'); -- Jack Silver in History 301


CREATE VIEW List_Of_Students AS
SELECT 
    s.Student_ID,
    s.First_Name,
    s.Last_Name,
    s.Major,
    r.Room_Number,
    d.Dorm_Name
FROM 
    Students s
JOIN 
    Rooms r ON s.Room_ID = r.Room_ID
JOIN 
    Dorms d ON r.Dorm_ID = d.Dorm_ID;

CREATE VIEW Classes_For_Two_Students AS
SELECT 
    e.Student_ID,
    s.First_Name,
    s.Last_Name,
    c.Class_Name,
    c.Location,
    c.Start_Date,
    c.End_Date,
    e.Grade
FROM 
    Enrollments e
JOIN 
    Students s ON e.Student_ID = s.Student_ID
JOIN 
    Classes c ON e.Class_ID = c.Class_ID
WHERE 
    e.Student_ID IN (1, 2);

CREATE VIEW List_Of_Students_In_Three_Dorms AS
SELECT 
    s.Student_ID,
    s.First_Name,
    s.Last_Name,
    s.Major,
    r.Room_Number,
    d.Dorm_Name
FROM 
    Students s
JOIN 
    Rooms r ON s.Room_ID = r.Room_ID
JOIN 
    Dorms d ON r.Dorm_ID = d.Dorm_ID
WHERE 
    d.Dorm_Name IN ('Dorm A', 'Dorm B', 'Dorm C');


select * from List_Of_Students;
select * from Classes_For_Two_Students;
Select * from List_Of_Students_In_Three_Dorms;
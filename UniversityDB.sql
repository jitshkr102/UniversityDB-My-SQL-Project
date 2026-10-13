create database UniversityDB;
use universitydb;

create table Departments(
	DepartmentID int primary key,
    DepartmentName varchar(50));

create table students(
	StudentID int primary key,
    Name varchar(20),
    Age int,
    DepartmentId int, 
    Foreign key(DepartmentID) references departments(DepartmentID)
);

create table Courses(
	CourseID int ,
    CourseName varchar(50),
    StudentID int,
    foreign key (StudentID) references students(StudentID));
    
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(1001, 'Computer Science'),
(1002, 'Information Technology'),
(1003, 'Electronics Engineering'),
(1004, 'Mechanical Engineering'),
(1005, 'Civil Engineering'),
(1006, 'Electrical Engineering'),
(1007, 'Business Administration'),
(1008, 'Mathematics');

INSERT INTO Students (StudentID, Name, Age, DepartmentID)
VALUES
(10601, 'Alice Johnson', 20, 1001),
(10602, 'Bob Smith', 21, 1002),
(10603, 'Charlie Brown', 19, 1003),
(10604, 'Diana Miller', 22, 1004),
(10605, 'Ethan Wilson', 20, 1005),
(10606, 'Emma Davis', 23, 1006),
(10607, 'Liam Taylor', 21, 1007),
(10608, 'Olivia Thomas', 19, 1008),
(10609, 'Noah Martin', 22, 1001),
(10610, 'Sophia Anderson', 20, 1002),
(10611, 'James White', 24, 1003),
(10612, 'Isabella Harris', 21, 1004),
(10613, 'Benjamin Clark', 19, 1005),
(10614, 'Mia Lewis', 22, 1006),
(10615, 'Lucas Robinson', 20, 1007),
(10616, 'Charlotte Walker', 23, 1008),
(10617, 'Henry Hall', 21, 1001),
(10618, 'Amelia Allen', 19, 1002),
(10619, 'Alexander Young', 22, 1003),
(10620, 'Harper King', 20, 1004),
(10621, 'Daniel Wright', 24, 1005),
(10622, 'Evelyn Scott', 21, 1006),
(10623, 'Matthew Green', 19, 1007),
(10624, 'Abigail Baker', 22, 1008),
(10625, 'Joseph Adams', 20, 1001),
(10626, 'Emily Nelson', 23, 1002),
(10627, 'Samuel Hill', 21, 1003),
(10628, 'Ella Campbell', 19, 1004),
(10629, 'David Mitchell', 22, 1005),
(10630, 'Avery Roberts', 20, 1006),
(10631, 'Carter Turner', 24, 1007),
(10632, 'Scarlett Phillips', 21, 1008),
(10633, 'Owen Parker', 19, 1001),
(10634, 'Grace Evans', 22, 1002),
(10635, 'Wyatt Edwards', 20, 1003),
(10636, 'Chloe Collins', 23, 1004),
(10637, 'John Stewart', 21, 1005),
(10638, 'Lily Sanchez', 19, 1006),
(10639, 'Jack Morris', 22, 1007),
(10640, 'Zoe Rogers', 20, 1008),
(10641, 'Luke Reed', 24, 1001),
(10642, 'Nora Cook', 21, 1002),
(10643, 'Gabriel Morgan', 19, 1003),
(10644, 'Hannah Bell', 22, 1004),
(10645, 'Isaac Murphy', 20, 1005),
(10646, 'Aria Bailey', 23, 1006),
(10647, 'Anthony Rivera', 21, 1007),
(10648, 'Layla Cooper', 19, 1008),
(10649, 'Dylan Richardson', 22, 1001),
(10650, 'Victoria Cox', 20, 1002);


INSERT INTO Courses (CourseID, CourseName, StudentID)
VALUES
(1, 'Artificial Intelligence', 10601),
(2, 'Data Structures', 10601),
(3, 'Data Science', 10601),
(4, 'Database Management Systems', 10602),
(5, 'Web Development', 10602),
(6, 'Computer Networks', 10602),
(7, 'Embedded Systems', 10603),
(8, 'CAD Design', 10603),
(9, 'Artificial Intelligence', 10603),
(10, 'Business Analytics', 10604),
(11, 'Applied Mathematics', 10604),
(12, 'Data Structures', 10604),
(13, 'Data Science', 10605),
(14, 'Database Management Systems', 10605),
(15, 'Web Development', 10605),
(16, 'Artificial Intelligence', 10606),
(17, 'Data Structures', 10607),
(18, 'Database Management Systems', 10608),
(19, 'Data Science', 10609),
(20, 'Web Development', 10610),
(21, 'Computer Networks', 10611),
(22, 'Embedded Systems', 10612),
(23, 'CAD Design', 10613),
(24, 'Business Analytics', 10614),
(25, 'Applied Mathematics', 10615),
(26, 'Artificial Intelligence', 10616),
(27, 'Data Structures', 10617),
(28, 'Database Management Systems', 10618),
(29, 'Data Science', 10619),
(30, 'Web Development', 10620),
(31, 'Computer Networks', 10621),
(32, 'Embedded Systems', 10622),
(33, 'CAD Design', 10623),
(34, 'Business Analytics', 10624),
(35, 'Applied Mathematics', 10625),
(36, 'Artificial Intelligence', 10626),
(37, 'Data Structures', 10627),
(38, 'Database Management Systems', 10628),
(39, 'Data Science', 10629),
(40, 'Web Development', 10630),
(41, 'Computer Networks', 10631),
(42, 'Embedded Systems', 10632),
(43, 'CAD Design', 10633),
(44, 'Business Analytics', 10634),
(45, 'Applied Mathematics', 10635),
(46, 'Artificial Intelligence', 10636),
(47, 'Data Structures', 10637),
(48, 'Database Management Systems', 10638),
(49, 'Data Science', 10639),
(50, 'Web Development', 10640);

-- a. Retrieve all student details along with their department names.
select StudentID, Name, Age, DepartmentName 
from students Inner join departments 
on students.DepartmentID = departments.DepartmentID ;

-- b. Find the names of all students who are enrolled in 'Artificial Intelligence'.
SELECT distinct Name, CourseName
FROM Students, Courses
WHERE Courses.CourseName = 'Artificial Intelligence';

-- c. Count how many students are in each department.
select departments.DepartmentName, count(*) as Total_students
from students
inner join departments on 
students.DepartmentId = departments.DepartmentID
group by departments.DepartmentID;


-- d. List the courses taken by 'Alice Johnson'. (assuming Alice Johnson is a student)
select CourseName from 
students inner join courses
on students.StudentID = courses.StudentID 
where students.Name = "Alice Johnson";

-- e. Find students who are enrolled in more than one course.
select Name 
from students
inner join courses
on students.StudentID = courses.StudentID
group by students.StudentID
having count(courses.CourseID) > 1;

-- f. Get the average age of students in each department.
select departments.DepartmentName,  avg(Age) as Average_Age
from students
inner join departments on 
students.DepartmentId = departments.DepartmentID
group by departments.DepartmentName;

-- g. Find the department with the most students.
select departments.DepartmentName, count(*) as Total_students
from students
inner join departments on 
students.DepartmentId = departments.DepartmentID
group by departments.DepartmentID 
order by Total_students desc
limit 1;

-- h. List all students who are NOT enrolled in any course.
select count(*) as Total_students
from students
left join courses
on students.StudentID = courses.StudentID 
group by courses.CourseID 
having courses.CourseID is NULL;

-- i. Retrieve students along with the total number of courses they are enrolled in.
select students.StudentID, students.Name, 
count(courses.CourseID) as "Total Courses" 
from students
left join courses
on students.StudentID = courses.StudentID
group by students.StudentID
union
select students.StudentID, students.Name, 
count(courses.CourseID) as "Total Courses" 
from students
right join courses
on students.StudentID = courses.StudentID
group by students.StudentID;


-- j. Find students who belong to 'Computer Science' and are taking a course with 'Data' in its name.
select students.Name, departments.DepartmentName , courses.CourseName from 
students inner join departments 
on students.DepartmentID = departments.DepartmentID 
inner join courses on
students.StudentID = courses.StudentID
where departments.DepartmentName = "Computer Science"
and courses.CourseName like "%Data%";



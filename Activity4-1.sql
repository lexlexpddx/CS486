create schema if not exists course_management_system;

drop table if exists students cascade;
create table if not exists Students(
	student_id int primary key,
	name varchar(50),
	email varchar(50),
	major varchar(50),
	enrollment_year int
);

drop table if exists instructors cascade;
create table if not exists Instructors(
	instructor_id int primary key,
	name varchar(50),
	email varchar(50),
	department varchar(50)
);

drop table if exists courses cascade;
create table if not exists Courses(
	course_id int primary key,
	course_name varchar(50),
	credits int,
	department varchar(50)
);

drop table if exists enrollments cascade;
create table if not exists Enrollments(
	enrollment_id int primary key,
	student_id int references Students (student_id),
	course_id int references Courses (course_id),
	semester varchar(50),
	grade varchar(10) default NULL
);

drop table if exists teaches cascade;
create table if not exists Teaches(
	instructor_id int references Instructors (instructor_id),
	course_id int references Courses (course_id),
	semester varchar(50)
);


insert into Students(student_id, name, email, major, enrollment_year) values
	(1, 'Alice Johnson', 'alice@psu.edu', 'Computer Science', 2022),
	(2, 'Bob Smith', 'bob@psu.edu', 'Mathematics', 2023),
	(3, 'Charlie Lee', 'charlie@psu.edu', 'Computer Science', 2021),
	(4, 'Dana Kapoor', 'dana@psu.edu', 'Physics', 2022)
;

insert into Instructors(instructor_id, name, email, department) values
	(101, 'Dr. Emily Clark', 'eclark.psu.edu', 'Computer Science'),
	(102, 'Dr. Tom Garcia', 'tgarcia@psu.edu', 'Mathematics'),
	(103, 'Dr. Nina Patel', 'npatel@psu.edu', 'Physics')
;

insert into Courses(course_id, course_name, credits, department) values
	(201, 'Database Systems', 4, 'Computer Science'),
	(202, 'Linear Algebra', 3, 'Mathematics'),
	(203, 'Data Structures', 4, 'Computer Science'),
	(204, 'Quantum Mechanics', 3, 'Physics')
;

insert into enrollments(enrollment_id, student_id, course_id, semester, grade) values
	(1, 1, 201, 'Fall 2024', 'A'),
	(2, 1, 202, 'Fall 2024', 'B'),
	(3, 2, 202, 'Fall 2024', 'A'),
	(4, 3, 201, 'Fall 2024', 'C'),
	(5, 3, 203, 'Fall 2024', 'NULL'),
	(6, 4, 204, 'Fall 2024', 'B')
;
	
insert into teaches (instructor_id, course_id, semester) values
	(101, 201, 'Fall 2024'),
	(101, 203, 'Fall 2024'),
	(102, 202, 'Fall 2024'),
	(103, 204, 'Fall 2024')
;
	
select *
from students s 
join enrollments e on e.student_id = s.student_id
join courses c on e.course_id = c.course_id
where c.course_name = 'Database Systems';

select *
from instructors i 
join teaches t on i.instructor_id = t.instructor_id
join courses c on t.course_id = c.course_id
where i.name = 'Dr. Emily Clark' and t.semester = 'Fall 2024';
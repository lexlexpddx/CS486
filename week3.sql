CREATE TABLE students(
	student_id INT,
	name VARCHAR(50),
	major VARCHAR(50)
);

INSERT INTO student VALUES
	(1, 'Alice', 'CS'),
	(2, 'Bob', 'Math'),
	(3, 'Carol', 'Physics'),
	(4, 'Dave', 'CS');

CREATE TABLE club_members(
	student_id INT,
	club_name VARCHAR(50)
);

INSERT INTO club_members VALUES
	(1, 'Robotics'),
	(2, 'Matheletes'),
	(3, 'Chess Club')
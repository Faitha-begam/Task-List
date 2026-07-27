CREATE DATABASE companyDB;
USE companyDB;
CREATE TABLE Employees(
emp_id INT PRIMARY KEY auto_increment,
emp_name varchar(50),
department varchar(100),
salary int,
city varchar(100), 
created_by varchar(200) default "user",
created_at date,
updated_by varchar(100),
updated_at date
);
SHOW DATABASES;

ALTER TABLE Employees ADD email varchar(100) unique;
ALTER TABLE Employees ADD phone int unique;
ALTER TABLE Employees ADD experience varchar(100) unique;
ALTER TABLE Employees MODIFY salary bigint;
ALTER TABLE Employees MODIFY phone bigint;
DESC Employees;

ALTER TABLE Employees RENAME COLUMN emp_name to employee_name;
ALTER TABLE Employees RENAME COLUMN city to location;
ALTER TABLE Employees DROP COLUMN experience;
ALTER TABLE Employees DROP COLUMN EmployeeDetails;

CREATE TABLE students(
student_id int PRIMARY KEY auto_increment,
student_name varchar(100),
course varchar(100),
age int,
city varchar(100)
);
DESC students;
ALTER TABLE students ADD mobile int;
TRUNCATE TABLE students;

DROP TABLE students;
DROP TABLE Employees;
DROP DATABASE companyDB;

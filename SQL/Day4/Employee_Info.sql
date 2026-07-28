CREATE DATABASE Employee_info;
USE Employee_info;
CREATE TABLE Emp_info(
   id INT,
   name VARCHAR(100),
   department VARCHAR(50),
   salary INT,
   city VARCHAR(50)
);
INSERT INTO Emp_info
VALUES
(101,'Sudhan','Developer',65000,'Chennai'),
(102,'Rahul','Tester',40000,'Madurai'),
(103,'Karthik','Developer',55000,'Chennai'),
(104,'Ajay','HR',35000,'Salem'),
(105,'Vijay','Manager',85000,'Coimbatore'),
(106,'Arun','Developer',60000,'Bangalore'),
(107,'Priya','Tester',45000,'Chennai'),
(108,'Divya','HR',30000,'Madurai'),
(109,'Surya','Developer',70000,'Salem'),
(110,'Anitha','Manager',90000,'Chennai');
SELECT * FROM Emp_info;
SELECT name,department,salary FROM Emp_info;
SELECT DISTINCT city FROM Emp_info;
SELECT * FROM Emp_info WHERE city = 'Chennai';
SELECT * FROM Emp_info WHERE salary>60000;
SELECT * FROM Emp_info WHERE salary<=45000;
SELECT * FROM Emp_info WHERE department = 'Developer' AND city = 'Chennai';
SELECT * FROM Emp_info WHERE city = 'Madurai' OR city = 'Chennai';
SELECT * FROM Emp_info WHERE name LIKE 'A%';
SELECT * FROM Emp_info WHERE name LIKE '%a';
SELECT * FROM Emp_info WHERE name LIKE '%ya%';
SELECT * FROM Emp_info WHERE city IN ('Madurai','Chennai');
SELECT * FROM Emp_info WHERE salary BETWEEN 45000 AND 70000;
SELECT * FROM Emp_info ORDER BY salary DESC;
SELECT * FROM Emp_info ORDER BY name ASC LIMIT 5;
SELECT * FROM Emp_info ORDER BY salary DESC LIMIT 3;
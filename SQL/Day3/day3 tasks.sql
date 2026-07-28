CREATE DATABASE employee_details;
use employee_details;
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50),
    emp_department VARCHAR(100),
    emp_salary INT,
    emp_city VARCHAR(100)
);
INSERT INTO Employees(emp_name,emp_department,emp_salary,emp_city) values ('vijay', 'IT', 50000,'banglore'),
('rahul','IT',40000,'chennai'),
('aadhi','IT',80000,'Kanada'),
('swathi','IT',90000,'Tirunelveli'),
('Faitha', 'Developer', 60000, 'Tirunelveli');
SHOW databases;

CREATE TABLE Students(
student_id INT PRIMARY KEY auto_increment,
student_name varchar(50),
course varchar(50),
age int, 
city varchar(100),
CREATED_BY varchar(200) default "Admin",
CREATED_AT date,
UPDATED_BY varchar(200),
UPDATED_AT date
);
INSERT INTO Students(student_name,course,age,city,CREATED_BY,CREATED_AT,UPDATED_BY,UPDATED_AT) VALUES
('Rahul', 'Computer Science', 20, 'Chennai', 'Admin', CURDATE(), 'Admin', CURDATE()),
('Priya', 'Information Technology', 21, 'Coimbatore', 'Admin', CURDATE(), 'Admin', CURDATE()),
('Arun', 'Electronics', 19, 'Madurai', 'Admin', CURDATE(), 'Admin', CURDATE()),
('Sneha', 'Mechanical', 22, 'Salem', 'Admin', CURDATE(), 'Admin', CURDATE()),
('Vijay', 'Civil', 20, 'Tirunelveli', 'Admin', CURDATE(), 'Admin', CURDATE()),
('Faitha', 'Computer Science', 21, 'Thoothukudi', 'Admin', CURDATE(), 'Admin', CURDATE()),
('Karthik', 'Artificial Intelligence', 22, 'Trichy', 'Admin', CURDATE(), 'Admin', CURDATE()),
('Ananya', 'Data Science', 20, 'Bengaluru', 'Admin', CURDATE(), 'Admin', CURDATE());
DESC Students;
SHOW DATABASES;

UPDATE Employees set emp_salary = 75000 where emp_id = 3;
UPDATE Employees set emp_department = 'Team Lead', emp_city = 'Bangalore' where emp_id = 2;
DESC Employees;
DELETE FROM Employees WHERE emp_id = 2;
update Employees set emp_salary = emp_salary + 10000 where emp_department = 'Developer';
update Students set city = 'Coimbatore' where city = 'Chennai';
delete from students where age<20;

CREATE TABLE Products(
	product_id INT PRIMARY KEY auto_increment,
    product_name varchar(100),
    price int,
    category varchar(200),
    CREATED_BY varchar(200) default "Admin",
	CREATED_AT date,
	UPDATED_BY varchar(200),
	UPDATED_AT date
);
INSERT INTO Products(product_name, price, category, CREATED_BY, CREATED_AT, UPDATED_BY, UPDATED_AT) VALUES 
('Laptop', 65000, 'Electronics', 'Admin', CURDATE(), 'Admin', CURDATE()),
('Wireless Mouse', 1200, 'Accessories', 'Admin', CURDATE(), 'Admin', CURDATE()),
('Office Chair', 7500, 'Furniture', 'Admin', CURDATE(), 'Admin', CURDATE()),
('Water Bottle', 500, 'Home & Kitchen', 'Admin', CURDATE(), 'Admin', CURDATE()),
('Smartphone', 28000, 'Electronics', 'Admin', CURDATE(), 'Admin', CURDATE());

UPDATE Products SET price = 1000 WHERE product_id = 4;
SHOW DATABASES;
DELETE FROM Products WHERE product_id = 3;

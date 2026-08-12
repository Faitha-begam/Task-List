CREATE DATABASE EmployeeSubquery;
USE EmployeeSubquery;

CREATE TABLE teaemp (
    empid INT PRIMARY KEY,
    empname VARCHAR(100),
    empdepart VARCHAR(50),
    empsalary DECIMAL(10,2),
    empcity VARCHAR(50)
);

INSERT INTO teaemp VALUES
(1, 'Rahul Singh', 'IT', 45000, 'Chennai'),
(2, 'Arun Kumar', 'IT', 55000, 'Bangalore'),
(3, 'Priya Sharma', 'HR', 35000, 'Chennai'),
(4, 'Karthik Raj', 'Finance', 60000, 'Madurai'),
(5, 'Divya Menon', 'HR', 42000, 'Coimbatore'),
(6, 'Vijay Kumar', 'IT', 38000, 'Chennai'),
(7, 'Sneha Reddy', 'Finance', 50000, 'Hyderabad'),
(8, 'Ajay Singh', 'Sales', 30000, 'Chennai'),
(9, 'Meena Devi', 'Sales', 45000, 'Madurai'),
(10, 'Ravi Kumar', 'IT', 70000, 'Bangalore');

SELECT * FROM teaemp WHERE empsalary > (SELECT AVG(empsalary) FROM teaemp);
SELECT * FROM teaemp WHERE empsalary = (SELECT MAX(empsalary) FROM teaemp);
SELECT * FROM teaemp WHERE empsalary = (SELECT MIN(empsalary) FROM teaemp);
SELECT * FROM teaemp WHERE empdepart = (SELECT empdepart FROM teaemp WHERE empname = 'Rahul Singh');
SELECT * FROM teaemp WHERE empdepart IN (SELECT empdepart FROM teaemp WHERE empsalary > 40000);
SELECT * FROM teaemp WHERE empsalary < (SELECT MAX(empsalary) FROM teaemp);
SELECT * FROM teaemp WHERE empsalary > (SELECT MIN(empsalary) FROM teaemp);

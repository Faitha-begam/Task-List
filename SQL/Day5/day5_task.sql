CREATE DATABASE CompanyEmployees;
USE CompanyEmployees;
CREATE TABLE EmployeeRecords (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    City VARCHAR(30)
);
INSERT INTO EmployeeRecords (EmpID, EmpName, Department, Salary, City)
VALUES
(101, 'Arun Kumar', 'HR', 35000.00, 'Chennai'),
(102, 'Priya Sharma', 'IT', 55000.00, 'Coimbatore'),
(103, 'Rahul Verma', 'Finance', 48000.00, 'Madurai'),
(104, 'Sneha Reddy', 'Marketing', 42000.00, 'Salem'),
(105, 'Karthik Raj', 'Sales', 39000.00, 'Trichy');

INSERT INTO EmployeeRecords (EmpID, EmpName, Department, Salary, City)
VALUES
(106, 'Meena Joshi', 'IT', 60000.00, 'Chennai'),
(107, 'Rohit Singh', 'HR', 37000.00, 'Madurai'),
(108, 'Anjali Nair', 'Finance', 51000.00, 'Coimbatore'),
(109, 'Vikram Patel', 'Sales', 41000.00, 'Salem'),
(110, 'Divya Menon', 'IT', 58000.00, 'Trichy');

SELECT Department, count(*) FROM EmployeeRecords GROUP BY Department;
SELECT City, count(*) FROM EmployeeRecords GROUP BY City;
SELECT Department, Sum(Salary) FROM EmployeeRecords GROUP BY Department;
SELECT City, Sum(Salary) FROM EmployeeRecords GROUP BY City;
SELECT Department, Avg(Salary) FROM EmployeeRecords GROUP BY Department;
SELECT Department, Max(Salary) FROM EmployeeRecords GROUP BY Department;
SELECT Department, min(Salary) FROM EmployeeRecords GROUP BY Department;
SELECT City, avg(Salary) FROM EmployeeRecords GROUP BY City;
SELECT Department, count(EmpName) ,Sum(Salary) FROM EmployeeRecords GROUP BY Department;
SELECT City, count(*) ,Max(Salary), Min(Salary)  FROM EmployeeRecords GROUP BY City;

SELECT count(*) FROM EmployeeRecords;
SELECT Sum(Salary) FROM EmployeeRecords;
SELECT avg(Salary) FROM EmployeeRecords;
SELECT Max(Salary) FROM EmployeeRecords;
SELECT Min(Salary) FROM EmployeeRecords;

SELECT City, count(*) FROM EmployeeRecords GROUP BY City;
SELECT City, max(Salary) FROM EmployeeRecords GROUP BY City;
SELECT City, min(Salary) FROM EmployeeRecords GROUP BY City;
SELECT City, avg(Salary) FROM EmployeeRecords GROUP BY City;

SELECT Department , min(Salary) FROM EmployeeRecords GROUP BY City;
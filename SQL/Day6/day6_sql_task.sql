-- =====================================================
-- TASK 1: CREATE DATABASE
-- =====================================================

DROP DATABASE IF EXISTS CompanyDB;

CREATE DATABASE CompanyDB;

USE CompanyDB;


-- =====================================================
-- TASK 2: CREATE TABLE
-- =====================================================

CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);


-- =====================================================
-- TASK 3: ALTER TABLE
-- =====================================================

-- Add email column
ALTER TABLE Employees
ADD email VARCHAR(100);

-- Modify salary datatype
ALTER TABLE Employees
MODIFY salary DECIMAL(12,2);

-- Rename city to location
ALTER TABLE Employees
RENAME COLUMN city TO location;

-- Add joining_date for Task 14
ALTER TABLE Employees
ADD joining_date DATE;


-- Check table structure
DESC Employees;


-- =====================================================
-- TASK 4: INSERT 10 RECORDS
-- =====================================================

INSERT INTO Employees
(id, name, department, salary, location, email, joining_date)
VALUES
(1, 'Arun', 'IT', 75000, 'Chennai', 'arun@gmail.com', '2022-01-10'),
(2, 'Priya', 'HR', 55000, 'Chennai', 'priya@gmail.com', '2021-05-15'),
(3, 'Rahul', 'Finance', 65000, 'Bangalore', 'rahul@gmail.com', '2020-07-20'),
(4, 'Divya', 'IT', 85000, 'Chennai', 'divya@gmail.com', '2019-03-12'),
(5, 'Karthik', 'Sales', 45000, 'Madurai', 'karthik@gmail.com', '2023-02-18'),
(6, 'Meena', 'HR', 60000, 'Chennai', 'meena@gmail.com', '2022-08-25'),
(7, 'Vijay', 'IT', 95000, 'Coimbatore', 'vijay@gmail.com', '2018-11-05'),
(8, 'Anitha', 'Finance', 70000, 'Chennai', 'anitha@gmail.com', '2021-09-10'),
(9, 'Suresh', 'Sales', 50000, 'Madurai', 'suresh@gmail.com', '2023-06-14'),
(10, 'Lakshmi', 'IT', 80000, 'Chennai', 'lakshmi@gmail.com', '2020-12-01');


-- =====================================================
-- TASK 5: UPDATE RECORDS
-- =====================================================

-- Update one employee's salary
UPDATE Employees
SET salary = 80000
WHERE id = 1;

-- Update employee's department
UPDATE Employees
SET department = 'Marketing'
WHERE id = 5;

-- Update multiple columns
UPDATE Employees
SET salary = 90000,
    location = 'Chennai'
WHERE id = 3;


-- =====================================================
-- TASK 6: DELETE RECORDS
-- =====================================================

-- Delete employee by ID
-- DELETE FROM Employees
-- WHERE id = 9;

-- Delete employees from a specific city
-- DELETE FROM Employees
-- WHERE location = 'Madurai';


-- =====================================================
-- TASK 7: BASIC SELECT
-- =====================================================

-- Display all employees
SELECT *
FROM Employees;

-- Display only name and salary
SELECT name, salary
FROM Employees;

-- Display distinct departments
SELECT DISTINCT department
FROM Employees;

-- Employees with salary greater than 40000
SELECT *
FROM Employees
WHERE salary > 40000;


-- =====================================================
-- TASK 8: WHERE CONDITIONS
-- =====================================================

-- AND
SELECT *
FROM Employees
WHERE department = 'IT'
AND salary > 70000;

-- OR
SELECT *
FROM Employees
WHERE department = 'IT'
OR department = 'HR';

-- IN
SELECT *
FROM Employees
WHERE department IN ('IT', 'HR', 'Finance');

-- NOT IN
SELECT *
FROM Employees
WHERE department NOT IN ('IT', 'HR');

-- BETWEEN
SELECT *
FROM Employees
WHERE salary BETWEEN 50000 AND 80000;

-- LIKE
SELECT *
FROM Employees
WHERE name LIKE 'A%';


-- =====================================================
-- TASK 9: ORDER BY & LIMIT
-- =====================================================

-- Highest salary
SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 1;

-- Lowest salary
SELECT *
FROM Employees
ORDER BY salary ASC
LIMIT 1;

-- Top 5 highest-paid employees
SELECT *
FROM Employees
ORDER BY salary DESC
LIMIT 5;

-- Last 3 inserted employees
SELECT *
FROM Employees
ORDER BY id DESC
LIMIT 3;


-- =====================================================
-- TASK 10: AGGREGATE FUNCTIONS
-- =====================================================

SELECT COUNT(*) AS employee_count
FROM Employees;

SELECT SUM(salary) AS total_salary
FROM Employees;

SELECT AVG(salary) AS average_salary
FROM Employees;

SELECT MAX(salary) AS highest_salary
FROM Employees;

SELECT MIN(salary) AS lowest_salary
FROM Employees;


-- =====================================================
-- TASK 11: GROUP BY
-- =====================================================

-- Department-wise employee count
SELECT department, COUNT(*) AS employee_count
FROM Employees
GROUP BY department;

-- Department-wise total salary
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department;

-- City-wise average salary
SELECT location, AVG(salary) AS average_salary
FROM Employees
GROUP BY location;

-- Department-wise highest salary
SELECT department, MAX(salary) AS highest_salary
FROM Employees
GROUP BY department;


-- =====================================================
-- TASK 12: HAVING
-- =====================================================

-- Departments having more than 2 employees
SELECT department, COUNT(*) AS employee_count
FROM Employees
GROUP BY department
HAVING COUNT(*) > 2;

-- Cities with average salary greater than 50000
SELECT location, AVG(salary) AS average_salary
FROM Employees
GROUP BY location
HAVING AVG(salary) > 50000;

-- Departments with total salary above 200000
SELECT department, SUM(salary) AS total_salary
FROM Employees
GROUP BY department
HAVING SUM(salary) > 200000;


-- =====================================================
-- TASK 13: STRING FUNCTIONS
-- =====================================================

-- UPPER
SELECT UPPER(name) AS uppercase_name
FROM Employees;

-- LOWER
SELECT LOWER(name) AS lowercase_name
FROM Employees;

-- LENGTH
SELECT name, LENGTH(name) AS name_length
FROM Employees;

-- CONCAT
SELECT CONCAT(name, ' - ', department) AS employee_details
FROM Employees;

-- SUBSTRING
SELECT name, SUBSTRING(name, 1, 3) AS short_name
FROM Employees;

-- REPLACE
SELECT name, REPLACE(name, 'a', 'A') AS replaced_name
FROM Employees;

-- LEFT
SELECT name, LEFT(name, 3) AS first_three
FROM Employees;

-- RIGHT
SELECT name, RIGHT(name, 3) AS last_three
FROM Employees;

-- REVERSE
SELECT name, REVERSE(name) AS reversed_name
FROM Employees;

-- TRIM
SELECT TRIM(name) AS trimmed_name
FROM Employees;


-- =====================================================
-- TASK 14: DATE FUNCTIONS
-- =====================================================

-- CURDATE
SELECT CURDATE() AS today;

-- NOW
SELECT NOW() AS current_datetime;

-- YEAR
SELECT name, YEAR(joining_date) AS joining_year
FROM Employees;

-- MONTH
SELECT name, MONTH(joining_date) AS joining_month
FROM Employees;

-- DAY
SELECT name, DAY(joining_date) AS joining_day
FROM Employees;

-- DATE_FORMAT
SELECT name,
       DATE_FORMAT(joining_date, '%d-%m-%Y') AS formatted_date
FROM Employees;

-- DATEDIFF
SELECT name,
       DATEDIFF(CURDATE(), joining_date) AS days_worked
FROM Employees;


-- =====================================================
-- TASK 15: EMPLOYEE DASHBOARD
-- =====================================================

SELECT
    department,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM Employees
GROUP BY department
ORDER BY total_salary DESC;


-- =====================================================
-- TASK 16: HR ANALYTICS REPORT
-- =====================================================

SELECT
    location,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM Employees
WHERE salary > 40000
GROUP BY location
HAVING COUNT(*) > 2;


-- =====================================================
-- TASK 17: SALES DASHBOARD
-- =====================================================

SELECT
    department,
    SUM(salary) AS total_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM Employees
GROUP BY department
HAVING AVG(salary) > 60000;


-- =====================================================
-- TASK 18: MULTI-COLUMN GROUP BY
-- =====================================================

SELECT
    department,
    location,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary
FROM Employees
GROUP BY department, location
ORDER BY employee_count DESC;


-- =====================================================
-- TASK 19: INTERVIEW CHALLENGE
-- =====================================================

SELECT
    department,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary
FROM Employees
WHERE salary > 35000
AND location = 'Chennai'
GROUP BY department
HAVING COUNT(*) > 2
AND AVG(salary) > 50000
ORDER BY total_salary DESC
LIMIT 3;
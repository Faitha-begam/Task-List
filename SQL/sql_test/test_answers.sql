-- DBMS
-- Database Management System
-- Stores and manages data.
-- Does not necessarily use tables with relationships.
-- Example: File-based systems, MongoDB.

-- RDBMS
-- Relational Database Management System
-- Stores data in tables (rows and columns).
-- Supports relationships between tables using Primary Key and Foreign Key.
-- Example: MySQL, PostgreSQL, Oracle.

-- DDL → Defines the structure
-- DML → Modifies the data
-- DQL → Retrieves the data
-- DCL → Controls permissions
-- TCL → Controls transactions

USE CompanyDB;

CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

DESC Employees;

-- DELETE is used to remove specific rows or all rows from a table. It can be used with a WHERE condition.
-- TRUNCATE removes all rows from a table but keeps the table structure.
-- DROP removes the entire table, including its structure and data.

-- CHAR is a fixed-length data type, meaning it always stores the specified number of characters, while 
-- VARCHAR is a variable-length data type, meaning it stores only the required number of characters. 
-- CHAR is best used for fixed-length values such as gender codes, country codes, or PINs, whereas VARCHAR is better for variable-length data such as names, email addresses, and city names.

INSERT INTO Employees (id, name, department, salary)
VALUES
(1, 'Arun', 'IT', 50000),
(2, 'Priya', 'HR', 45000),
(3, 'Kumar', 'Finance', 55000),
(4, 'Rahul', 'IT', 48000),
(5, 'Divya', 'HR', 52000);

UPDATE Employees SET salary = 60000 WHERE id = 3;

DELETE FROM Employees WHERE name = 'Rahul';

SELECT * FROM Employees WHERE salary = 50000;

SELECT * FROM Employees WHERE salary > 50000;

SELECT * FROM Employees WHERE salary < 50000;

SELECT * FROM Employees WHERE salary >= 50000;

SELECT * FROM Employees WHERE salary <= 50000;

SELECT * FROM Employees WHERE salary != 50000;

SELECT * FROM Employees WHERE department = 'IT' AND salary > 50000;

SELECT * FROM Employees WHERE department = 'IT' OR department = 'HR';

SELECT * FROM Employees WHERE department IN ('IT', 'HR');

SELECT * FROM Employees WHERE salary BETWEEN 40000 AND 60000;

SELECT * FROM Employees WHERE name LIKE 'A%';

SELECT * FROM Employees WHERE salary = (SELECT MAX(salary) FROM Employees);

SELECT * FROM Employees WHERE salary = (SELECT MIN(salary) FROM Employees);

SELECT * FROM Employees ORDER BY salary DESC LIMIT 5;

SELECT * FROM Employees ORDER BY name ASC;

-- WHERE is used to filter individual rows before grouping, while HAVING is used to filter groups after GROUP
-- BY. WHERE is commonly used with normal conditions, whereas HAVING is mainly used with aggregate
-- functions such as COUNT(), SUM(), and AVG().

SELECT COUNT(*) AS total_employees FROM Employees;
SELECT SUM(salary) AS total_salary FROM Employees;
SELECT AVG(salary) AS average_salary FROM Employees;
SELECT MAX(salary) AS highest_salary FROM Employees;
SELECT MIN(salary) AS lowest_salary FROM Employees;

SELECT department,COUNT(*) AS employee_count,SUM(salary) AS total_salary,AVG(salary) AS average_salary FROM Employees GROUP BY department;

SELECT department,COUNT(*) AS employee_count,AVG(salary) AS average_salary FROM Employees GROUP BY department HAVING COUNT(*) > 3 AND AVG(salary) > 50000;

SELECT UPPER(name) AS uppercase_name
FROM Employees;

SELECT LOWER(name) AS lowercase_name
FROM Employees;

SELECT LENGTH(name) AS name_length
FROM Employees;

SELECT CONCAT(name, ' - ', department) AS employee_details
FROM Employees;

SELECT SUBSTRING(name, 1, 3) AS name_substring
FROM Employees;

SELECT REPLACE(city, 'Chennai', 'Madurai') AS updated_city
FROM Employees;

SELECT LEFT(name, 3) AS first_three_characters
FROM Employees;

SELECT RIGHT(name, 3) AS last_three_characters
FROM Employees;

SELECT REVERSE(name) AS reversed_name
FROM Employees;

SELECT TRIM(name) AS trimmed_name
FROM Employees;

SELECT CURDATE();

SELECT NOW();

SELECT YEAR(CURDATE());

SELECT MONTH(CURDATE());

SELECT DAY(CURDATE());

SELECT DATE_FORMAT(CURDATE(), '%d-%m-%Y');

SELECT DATEDIFF('2026-12-31', '2026-08-13');

SELECT department, COUNT(*) AS employee_count, SUM(salary) AS total_salary, AVG(salary) AS average_salary, MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary FROM Employees WHERE salary > 30000 GROUP BY department HAVING COUNT(*) > 1 ORDER BY average_salary DESC LIMIT 5;
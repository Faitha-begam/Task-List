CREATE DATABASE company_db;

USE company_db;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    city VARCHAR(50),
    salary INT
);
INSERT INTO Employees
(employee_id, name, department, city, salary)
VALUES
(1, 'Arun', 'Developer', 'Chennai', 55000),
(2, 'Bala', 'Developer', 'Chennai', 70000),
(3, 'Charan', 'Developer', 'Bangalore', 60000),
(4, 'Dinesh', 'Developer', 'Bangalore', 65000),

(5, 'Ezhil', 'Testing', 'Chennai', 45000),
(6, 'Farhan', 'Testing', 'Chennai', 50000),
(7, 'Gokul', 'Testing', 'Bangalore', 55000),

(8, 'Hari', 'HR', 'Chennai', 40000),
(9, 'Irfan', 'HR', 'Bangalore', 45000),

(10, 'Jeeva', 'Manager', 'Chennai', 80000),
(11, 'Karthik', 'Manager', 'Bangalore', 85000);
SELECT * FROM Employees;
SELECT
    department AS Department,
    COUNT(*) AS Total_Employees,
    SUM(salary) AS Total_Salary,
    AVG(salary) AS Average_Salary,
    MAX(salary) AS Highest_Salary,
    MIN(salary) AS Lowest_Salary
FROM Employees
GROUP BY department;


SELECT
    city AS City,
    COUNT(*) AS Total_Employees,
    MAX(salary) AS Highest_Salary,
    MIN(salary) AS Lowest_Salary,
    AVG(salary) AS Average_Salary
FROM Employees
GROUP BY city
ORDER BY Highest_Salary DESC;

SELECT
    department AS Department,
    COUNT(*) AS Employee_Count,
    SUM(salary) AS Total_Salary
FROM Employees
GROUP BY department
ORDER BY Total_Salary DESC;

SELECT
    department AS Department,
    city AS City,
    COUNT(*) AS Employee_Count,
    AVG(salary) AS Average_Salary
FROM Employees
GROUP BY department, city;

SELECT
    department AS Department,
    COUNT(*) AS Total_Employees,
    SUM(salary) AS Total_Salary,
    AVG(salary) AS Average_Salary,
    MAX(salary) AS Highest_Salary,
    MIN(salary) AS Lowest_Salary
FROM Employees
GROUP BY department
ORDER BY Total_Salary DESC
LIMIT 3;	
ALTER TABLE Employee_C26
RENAME COLUMN employee_name TO full_name;
ALTER TABLE Employee_C26
DROP COLUMN email;
DESC Employee_C26;
RENAME TABLE Employee_C26 TO EmployeeDetails_C26;
SHOW TABLES;
TRUNCATE TABLE EmployeeDetails_C26;
SELECT * FROM EmployeeDetails_C26;
DROP TABLE EmployeeDetails_C26;
CREATE TABLE Employee_C26 (
    employee_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    salary DECIMAL(12,2),
    joining_date DATE,
    department_id INT,
    city_id INT,
    CONSTRAINT fk_employee_department_c26
        FOREIGN KEY (department_id)
        REFERENCES Department_C26(department_id),
    CONSTRAINT fk_employee_city_c26
        FOREIGN KEY (city_id)
        REFERENCES City_C26(city_id)
);
INSERT INTO Department_C26 VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing');
SELECT * FROM Department_C26;
INSERT INTO City_C26 VALUES
(1, 'Chennai'),
(2, 'Salem'),
(3, 'Madurai'),
(4, 'Coimbatore'),
(5, 'Tirunelveli');

INSERT INTO Employee_C26
(employee_id, full_name, salary, joining_date, department_id, city_id)
VALUES
(1, 'Arun', 45000, '2024-01-10', 1, 1),
(2, 'Kavin', 38000, '2024-02-15', 2, 2),
(3, 'Rahul', 52000, '2023-06-20', 1, 1),
(4, 'Priya', 48000, '2023-08-12', 3, 3),
(5, 'Vijay', 65000, '2022-05-18', 1, 4),
(6, 'Karthik', 30000, '2024-03-22', 4, 2),
(7, 'Anand', 55000, '2023-11-05', 1, 1),
(8, 'Divya', 42000, '2024-04-10', 2, 3),
(9, 'Sanjay', 58000, '2022-09-14', 3, 4),
(10, 'Varun', 25000, '2024-06-01', 4, 5),
(11, 'Meena', 47000, '2023-07-19', 2, 1),
(12, 'Harish', 62000, '2022-12-10', 3, 3),
(13, 'Aarthi', 18000, '2024-07-25', 4, 2),
(14, 'Mohan', 50000, '2023-10-30', 5, 1),
(15, 'Naveen', 36000, '2024-05-16', 5, 5);

SELECT * FROM Employee_C26;

UPDATE Employee_C26
SET salary = salary + 5000
WHERE department_id = (
    SELECT department_id
    FROM Department_C26
    WHERE department_name = 'IT'
);

SELECT *
FROM Employee_C26
WHERE department_id = (
    SELECT department_id
    FROM Department_C26
    WHERE department_name = 'IT'
);

UPDATE Employee_C26
SET city_id = (
    SELECT city_id
    FROM City_C26
    WHERE city_name = 'Chennai'
)
WHERE department_id = (
    SELECT department_id
    FROM Department_C26
    WHERE department_name = 'HR'
);
SELECT *
FROM Employee_C26
WHERE department_id = (
    SELECT department_id
    FROM Department_C26
    WHERE department_name = 'HR'
);
DELETE FROM Employee_C26
WHERE salary < 20000;
SELECT *
FROM Employee_C26
WHERE salary > 40000
  AND salary < 60000
  AND city_id = (
      SELECT city_id
      FROM City_C26
      WHERE city_name = 'Chennai'
  );
  SELECT *
FROM Employee_C26
WHERE salary > 40000
  AND salary < 60000
  AND city_id = (
      SELECT city_id
      FROM City_C26
      WHERE city_name = 'Chennai'
  );
  SELECT *
FROM Employee_C26
ORDER BY salary ASC
LIMIT 3;

SELECT *
FROM Employee_C26
WHERE full_name LIKE 'A%';

SELECT
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM Employee_C26;

SELECT
    department,
    COUNT(*) AS employee_count
FROM Employee_C26
GROUP BY department;

SELECT
    department,
    COUNT(*) AS employee_count
FROM Employee_C26
GROUP BY department
HAVING COUNT(*) > 2;
SELECT *
FROM Employee_C26
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee_C26
);
SELECT *
FROM Employee_C26
WHERE department = (
    SELECT department
    FROM Employee_C26
    WHERE full_name = 'Arun'
);
SELECT
    e.full_name,
    d.department_name
FROM Employee_C26 e
INNER JOIN Department d
    ON e.department_id = d.department_id;



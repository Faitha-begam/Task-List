CREATE DATABASE ElectionDB;
USE ElectionDB;

CREATE TABLE Voters (
    voter_id INT PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    gender VARCHAR(10),
    address VARCHAR(200),
    phone VARCHAR(15)
);

CREATE TABLE Candidates (
    candidate_id INT PRIMARY KEY,
    candidate_name VARCHAR(100),
    party VARCHAR(100),
    age INT,
    constituency VARCHAR(100)
);

CREATE TABLE Polling_Booths (
    booth_id INT PRIMARY KEY,
    booth_name VARCHAR(100),
    location VARCHAR(200),
    capacity INT
);

CREATE TABLE Votes (
    vote_id INT PRIMARY KEY,
    voter_id INT,
    candidate_id INT,
    booth_id INT,
    vote_date DATE,

    FOREIGN KEY (voter_id) REFERENCES Voters(voter_id),
    FOREIGN KEY (candidate_id) REFERENCES Candidates(candidate_id),
    FOREIGN KEY (booth_id) REFERENCES Polling_Booths(booth_id)
);
SELECT * FROM Voters;
SELECT
    v.vote_id,
    v.vote_date,
    c.candidate_name,
    c.party
FROM Votes v
INNER JOIN Candidates c
ON v.candidate_id = c.candidate_id;


CREATE DATABASE HospitalDB;
USE HospitalDB;

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    date_of_birth DATE,
    gender VARCHAR(10),
    phone VARCHAR(15),
    address VARCHAR(200)
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(30),

    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Treatments (
    treatment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    treatment_description VARCHAR(255),
    treatment_date DATE,

    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    treatment_id INT,
    amount DECIMAL(10,2),
    bill_date DATE,
    payment_status VARCHAR(30),

    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

SELECT
    a.appointment_id,
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.appointment_time,
    a.status
FROM Appointments a
JOIN Patients p
ON a.patient_id = p.patient_id
JOIN Doctors d
ON a.doctor_id = d.doctor_id;

SELECT *
FROM Billing
WHERE payment_status = 'Pending';

CREATE DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id)
);

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100),
    email VARCHAR(100),
    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credits INT,
    department_id INT,

    FOREIGN KEY (department_id)
    REFERENCES Departments(department_id)
);

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    attendance_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (student_id)
    REFERENCES Students(student_id),

    FOREIGN KEY (course_id)
    REFERENCES Courses(course_id)
);

CREATE TABLE Examinations (
    exam_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    exam_date DATE,
    marks INT,
    grade VARCHAR(5),

    FOREIGN KEY (student_id)
    REFERENCES Students(student_id),

    FOREIGN KEY (course_id)
    REFERENCES Courses(course_id)
);

SELECT
    s.student_id,
    s.student_name,
    d.department_name
FROM Students s
JOIN Departments d
ON s.department_id = d.department_id;

SELECT
    s.student_name,
    c.course_name,
    e.marks
FROM Examinations e
JOIN Students s
ON e.student_id = s.student_id
JOIN Courses c
ON e.course_id = c.course_id
WHERE e.marks > 75;

SELECT
    s.student_name,
    c.course_name,
    a.attendance_date,
    a.status
FROM Attendance a
JOIN Students s
ON a.student_id = s.student_id
JOIN Courses c
ON a.course_id = c.course_id;

CREATE DATABASE EcommerceDB;
USE EcommerceDB;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(100),
    price DECIMAL(10,2),
    stock_quantity INT
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(200)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    payment_status VARCHAR(30),

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id)
);

CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    delivery_address VARCHAR(200),
    delivery_date DATE,
    delivery_status VARCHAR(30),

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id)
);

SELECT
    o.order_id,
    c.customer_name,
    o.order_date,
    o.total_amount,
    o.order_status
FROM Orders o
JOIN Customers c
ON o.customer_id = c.customer_id;

SELECT
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.price
FROM Order_Items oi
JOIN Orders o
ON oi.order_id = o.order_id
JOIN Products p
ON oi.product_id = p.product_id;

CREATE DATABASE TeaShopDB;
USE TeaShopDB;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    role VARCHAR(50),
    phone VARCHAR(15),
    salary DECIMAL(10,2)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Stock (
    stock_id INT PRIMARY KEY,
    product_id INT,
    quantity INT,
    last_updated DATE,

    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);

CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    bill_date DATE,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id),

    FOREIGN KEY (employee_id)
    REFERENCES Employees(employee_id)
);

CREATE TABLE Bill_Items (
    bill_item_id INT PRIMARY KEY,
    bill_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),

    FOREIGN KEY (bill_id)
    REFERENCES Billing(bill_id),

    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);

CREATE TABLE Daily_Sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    total_bills INT,
    total_sales DECIMAL(10,2)
);

SELECT
    p.product_name,
    s.quantity
FROM Stock s
JOIN Products p
ON s.product_id = p.product_id;

SELECT
    b.bill_id,
    c.customer_name,
    e.employee_name,
    b.bill_date,
    b.total_amount
FROM Billing b
JOIN Customers c
ON b.customer_id = c.customer_id
JOIN Employees e
ON b.employee_id = e.employee_id;
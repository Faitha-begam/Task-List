USE EmployeeSubquery;
SHOW TABLES;
UPDATE teaemp
SET empsalary = 50000
WHERE empid = 1;
SELECT * FROM emp_update_backup;

CREATE TABLE emp_delete_backup (
    empid INT,
    empname VARCHAR(100),
    empdepart VARCHAR(50),
    empsalary DECIMAL(10,2),
    empcity VARCHAR(50),
    deleted_at DATETIME
);

DELIMITER //

CREATE TRIGGER after_employee_delete
AFTER DELETE ON teaemp
FOR EACH ROW
BEGIN
    INSERT INTO emp_delete_backup
    VALUES (
        OLD.empid,
        OLD.empname,
        OLD.empdepart,
        OLD.empsalary,
        OLD.empcity,
        NOW()
    );
END //

DELIMITER ;

DELETE FROM teaemp
WHERE empid = 2;

SELECT * FROM emp_delete_backup;

USE EmployeeSubquery;

DELIMITER //

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON teaemp
FOR EACH ROW
BEGIN
    IF NEW.empsalary < 15000 THEN
        SET NEW.empsalary = 15000;
    END IF;
END //

DELIMITER ;

SELECT *
FROM teaemp
WHERE empid = 8;

CREATE TABLE teaproduct (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);

INSERT INTO teaproduct VALUES
(1, 'Laptop', 55000, 'Electronics'),
(2, 'Mouse', 800, 'Accessories'),
(3, 'Keyboard', 1500, 'Accessories'),
(4, 'Monitor', 12000, 'Electronics');

CREATE TABLE product_backup (
    product_id INT,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50),
    backup_time DATETIME
);
USE EmployeeSubquery;

DELIMITER //

CREATE TRIGGER after_product_update
AFTER UPDATE ON teaproduct
FOR EACH ROW
BEGIN
    INSERT INTO product_backup
    VALUES (
        OLD.product_id,
        OLD.product_name,
        OLD.price,
        OLD.category,
        NOW()
    );
END //

DELIMITER ;
UPDATE teaproduct
SET price = 60000
WHERE product_id = 1;
SELECT * FROM product_backup;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    phone VARCHAR(15)
);
INSERT INTO customer VALUES
(1, 'Arun', '9876543210'),
(2, 'Priya', '9876543211'),
(3, 'Karthik', '9876543212');
SELECT * FROM customer;
CREATE TABLE customer_audit (
    customer_id INT,
    customer_name VARCHAR(100),
    operation VARCHAR(20),
    audit_time DATETIME
);
DELIMITER //

CREATE TRIGGER customer_after_insert
AFTER INSERT ON customer
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit
    VALUES (
        NEW.customer_id,
        NEW.customer_name,
        'INSERT',
        NOW()
    );
END //

DELIMITER ;

INSERT INTO customer
VALUES (4, 'Divya', '9876543213');
SELECT * FROM customer_audit;

DELIMITER //

CREATE TRIGGER customer_after_update
AFTER UPDATE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit
    VALUES (
        NEW.customer_id,
        NEW.customer_name,
        'UPDATE',
        NOW()
    );
END //

DELIMITER ;

UPDATE customer
SET customer_name = 'Divya Sharma'
WHERE customer_id = 4;
SELECT * FROM customer_audit;

DELIMITER //

CREATE TRIGGER customer_after_delete
AFTER DELETE ON customer
FOR EACH ROW
BEGIN
    INSERT INTO customer_audit
    VALUES (
        OLD.customer_id,
        OLD.customer_name,
        'DELETE',
        NOW()
    );
END //

DELIMITER ;

DELETE FROM customer
WHERE customer_id = 4;
SELECT * FROM customer_audit;
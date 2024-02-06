--
-- Create a database to do our work in today
CREATE DATABASE ORDERS;
USE ORDERS;

--
-- Create a table for customer information
-- Note many of these columns do not hav 
-- constraints, but should they.
CREATE TABLE customers (
    customer_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(150),
    address1 VARCHAR(50),
    address2 VARCHAR(50),
    city VARCHAR(50),
    province VARCHAR(50),
    code VARCHAR(15),
    country VARCHAR(50) NOT NULL,
    sales_rep_employee_number VARCHAR(10) NOT NULL,
    credit_limit INT
);

--
-- Create a table orders
-- again no rows with constraints shoul 
-- there be some
CREATE TABLE orders (
    order_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_customer_id INT NOT NULL,
    order_date DATETIME,
    required_date DATETIME,
    shipped_date DATETIME,
    order_status INT,
    comments TEXT,
    FOREIGN KEY (fk_customer_id)
        REFERENCES customers(customer_id)
        ON DELETE CASCADE
);

--
-- Create an employees ta
-- Note the ENUM data type
CREATE TABLE employees (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    employee_number VARCHAR(10) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    employee_type ENUM('Sales', 'Mgmt', 'Admin', 'IT'),
    birthdate DATE
);

-- 
-- We couldn't create the foreign key before because the employee
-- table didn't exist. So now we are going to rename it so we can
-- follow our convention with "fk_" and add a foreign key
ALTER TABLE customers RENAME COLUMN sales_rep_employee_number to fk_sales_employee_number;
ALTER TABLE customers
   ADD FOREIGN KEY (fk_sales_employee_number)
   REFERENCES employees(employee_number);


---
--- Some commands to add NOT NULL to the first_name
UPDATE customers SET fist_name='' WHERE fist_name IS NULL;
ALTER TABLE customers MODIFY fist_name VARCHAR(50) NOT NULL DEFAULT '';
SHOW CREATE TABLE customers;

-- Add some people to the employees table
INSERT INTO employees (employee_number, first_name, last_name, employee_type)
     VALUES ('XY_1212', 'Bad', 'Wolfe', 'Mgmt');
INSERT INTO employees (employee_number, first_name, last_name, employee_type)
     VALUES ('XY_2222', 'Mary', 'Lambe','Sales');
INSERT INTO employees (employee_number, first_name, last_name, employee_type)
     VALUES ('XY_1321', 'Farley', 'Mowat', 'IT');
INSERT INTO employees (employee_number, first_name, last_name, employee_type)
     VALUES ('XY_1112', 'Margaret', 'Atwood','Sales');
INSERT INTO employees (employee_number, first_name, last_name, employee_type)
     VALUES ('XY_1332', 'Purple', 'Monster','Admin');
INSERT INTO employees (employee_number, first_name, last_name, employee_type)
     VALUES ('XY_1421', 'Yellow', 'Submarine','Admin');

-- Add some customers 
INSERT INTO customers (company_name, city, country, fk_sales_employee_number)
    VALUES ('Walmart','Halifax', 'Canada', 'XY_2222');
INSERT INTO customers (company_name, city, country, fk_sales_employee_number)
    VALUES ('SporCheck','Calgary', 'Canada', 'XY_2222');
INSERT INTO customers (company_name, city, country, fk_sales_employee_number)
    VALUES ('Canadian Tire','Toronto', 'Canada', 'XY_1112');
INSERT INTO customers (company_name, city, country, fk_sales_employee_number)
    VALUES ('Boston Pizza','Toronto', 'Canada', 'XY_1112');
INSERT INTO customers (company_name, city, country, fk_sales_employee_number)
    VALUES ('Rona','Vancouver', 'Canada', 'XY_3772');


-- create some orders
INSERT INTO orders (fk_customer_id, order_date, order_status) 
       VALUES (1, '2022-09-08', 2);
INSERT INTO orders (fk_customer_id, order_date, order_status) 
       VALUES (1, '2022-12-08', 2);

CREATE DATABASE class3;
USE DATABASE class3;

CREATE TABLE customers (
    customer_id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    fist_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(10),
    address1 VARCHAR(50),
    address2 VARCHAR(50),
    city VARCHAR(50),
    province VARCHAR(50),
    code VARCHAR(15),
    country VARCHAR(50) NOT NULL,
    sales_rep_employee_number INT NOT NULL,
    credit_limit INT
);

INSERT INTO customers (first_name, last_name, city, country, sales_rep_employee_number)
    VALUES '';

CREATE TABLE order (
    order_number INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME,
    required_date DATETIME,
    shipped_date DATETIME,
    order_status,
    comments,
    FOREIGN KEY customer_id,
        REFERENCES customers(customer_id),
        ON DELETE CASCADE
);


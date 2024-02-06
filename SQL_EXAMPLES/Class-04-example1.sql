CREATE DATABASE SIMPLE_ORDER_DB;
USE SIMPLE_ORDER_DB;

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


CREATE TABLE orders (
    order_number INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
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

INSERT INTO customers (last_name, city, country, sales_rep_employee_number)
    VALUES ('Wolfe','Calgary', 'Canada', 53);
INSERT INTO customers (fist_name, last_name, city, country, sales_rep_employee_number)
    VALUES ('Margaret','Atwood','Calgary', 'Canada', 69);

ALTER TABLE customers MODIFY fist_name VARCHAR(50) NOT NULL;
ALTER TABLE customers MODIFY fist_name VARCHAR(50) NOT NULL DEFAULT '';
SHOW CREATE TABLE customers;
ALTER TABLE customers MODIFY fist_name VARCHAR(50) DEFAULT '';
UPDATE customers SET fist_name='' WHERE fist_name IS NULL;

INSERT INTO orders (fk_customer_id, order_date, order_status) 
       VALUES (1, '2022-09-08', 2);
INSERT INTO orders (fk_customer_id, order_date, order_status) 
       VALUES (1, '2022-12-08', 2);

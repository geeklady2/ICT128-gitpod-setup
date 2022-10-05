--- List all views in a database toy_sales
SHOW FULL TABLES IN toy_sales WHERE TABLE_TYPE LIKE 'VIEW';

-- Show definition of a vew
SHOW CREATE VIEW vToy_sales;

--- Create a view combining all of the tables
DROP VIEW IF EXISTS vToy_sales;
CREATE VIEW vToy_sales AS
    SELECT employee_name, toy_name, brand, price, quantity, sale_date
    FROM Toys
    INNER JOIN Sales
    ON Sales.toy_id=Toys.id
    INNER JOIN Employees
    ON Employees.id=Sales.employee_id;

SELECT * from vToy_sales;

-- Add some more rows, does the view change
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (3, 2, '2020-07-05', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (1, 3, '2020-07-05', 1);

--- Create a view of the total sales, 
--- like what was done in stored procedures

DROP VIEW IF EXISTS vTotal_sales;
CREATE VIEW vTotal_sales AS
    SELECT employee_name, ROUND(SUM(price * quantity),2) AS total_sales
    FROM Sales
    INNER JOIN Toys
    ON Toys.id=Sales.toy_id
    INNER JOIN Employees
    ON Employees.id=Sales.employee_id
    GROUP BY employee_id;



--- Further exercises
--- View listing sales by brand
--- View listing sales for the last month only
--- View listing top employee based on sales
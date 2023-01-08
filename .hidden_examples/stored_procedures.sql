-- Switch to the database with the toy sales data
USE toy_sales;

-- SHOW all of the stored procedures in database toy_sales
SHOW PROCEDURE STATUS WHERE db='toy_sales';


-- MySQL equivalent of Hello World
DROP PROCEDURE IF EXISTS hello;
DELIMITER //
CREATE PROCEDURE hello()
BEGIN
    SELECT 'Hello World!' AS 'Hi';
END//
DELIMITER ;

-- Exceute Hello World
CALL hello();




-- Create a stored procecure to list all of the toys and their prices.
DROP PROCEDURE IF EXISTS toyList;
DELIMITER $$
CREATE PROCEDURE toyList()
BEGIN
    SELECT toy_name, brand, price FROM Toys;
END$$
DELIMITER ;
CALL toyList();

-- We are going to make a more advanced version that lists
-- the type of toy based on the price.  First we need to drop
-- the original procedure
DROP PROCEDURE IF EXISTS toyList;

DELIMITER $$
CREATE PROCEDURE toyList()
BEGIN
    SELECT toy_name, brand, price,
        CASE
            WHEN price > 25 THEN "high end toy"
            WHEN price < 15 THEN "cheap toy"
            ELSE "mid range toy"
        END AS toy_type
    FROM Toys;
END$$
DELIMITER ;

CALL toyList();


--- Stored procedure that uses an input value and
--- a local variable
DROP PROCEDURE IF EXISTS employeeSales;
DELIMITER $$
CREATE PROCEDURE employeeSales(
    IN employeeName VARCHAR(50)
)
BEGIN
    -- Create a local variable for the employee ID
    DECLARE employeeID INT;

    -- Find the employee ID that matches the given name and store the
    -- ID in the local variable.
    SELECT id
    INTO employeeID
    FROM Employees
    WHERE employee_name=employeeName;

    -- The next line is a degbugging line to see if we find an 
    -- employee ID
    -- SELECT employeeID;

    SELECT *
    FROM Sales
    WHERE employee_id=employeeID;
END$$
DELIMITER ;

CALL employeeSales('Sofia Clark');
CALL employeeSales('Sofia White');



--- Stored procedure that returns a value
DROP PROCEDURE IF EXISTS mySqrt;

DELIMITER $$
CREATE PROCEDURE mySqrt(
    IN inputNumber INT, 
    OUT outNumber FLOAT)
BEGIN
    SET outNumber=SQRT(inputNumber);
END$$
DELIMITER ;

CALL mySqrt(4,@out_value);
SELECT @out_value;

--- NOTES
--- Toy price is in the Toys Table, price column
--- Total Sale amount is the quantity * the price
--- Employee Name is in employee table, and the 
--- employee id is in the sale table

-- Version one, list total sales for all employess
DROP PROCEDURE IF EXISTS allTotalSales;
DELIMITER $$
CREATE PROCEDURE allTotalSales()
BEGIN
    SELECT employee_name, ROUND(SUM(price * quantity),2) AS total_price
    FROM Sales
    INNER JOIN Toys
    ON Toys.id=Sales.toy_id
    INNER JOIN Employees
    ON Employees.id=Sales.employee_id
    GROUP BY employee_id;
END$$
DELIMITER ;

CALL allTotalSales();
DROP PROCEDURE totalSales();


--- version 2 have the output total sales for
--- a particular employee (input)
DROP PROCEDURE IF EXISTS totalSales;
DELIMITER $$
CREATE PROCEDURE totalSales(
    IN employeeName VARCHAR(50),
    OUT totalSales FLOAT
)
BEGIN
    -- Find and store the employee ID into a local variable
    DECLARE employeeID INT;
    SELECT id
    INTO employeeID
    FROM Employees
    WHERE employee_name=employeeName;

    IF ISNULL(employeeID) THEN
       SELECT 0
       INTO totalSales;
    ELSE
        SELECT ROUND(SUM(price * quantity),2)
        INTO totalSales
        FROM Sales
        INNER JOIN Toys
        ON Toys.id=Sales.toy_id
        WHERE employee_id=EmployeeID
        GROUP BY employee_id;
    END IF;
END$$
DELIMITER ;

CALL totalSales('Fiona Clark', @outSales);
SELECT @outSales;
Call totalSales('Jane White', @outSales);
SELECT @outSales;


-- SHOW all of the stored procedures in database toy_sales
SHOW PROCEDURE STATUS WHERE db='toy_sales';

-- Further practice exersizes
-- Sales on a particular day
-- Sales by Brand
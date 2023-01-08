DROP DATABASE IF EXISTS toy_sales;

CREATE DATABASE IF NOT EXISTS toy_sales;
USE toy_sales;


CREATE TABLE IF NOT EXISTS Employees (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL  
);

CREATE TABLE IF NOT EXISTS  Toys (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    toy_name VARCHAR(100) NOT NULL,
    brand VARCHAR(100),
    price FLOAT

);

CREATE TABLE  IF NOT EXISTS Sales (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    toy_id INT NOT NULL,
    employee_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity FLOAT NOT NULL,
    CHECK (quantity > 0),
    FOREIGN KEY (toy_id)
         REFERENCES Toys(id)
         ON DELETE CASCADE,
    FOREIGN KEY (employee_id)
         REFERENCES Employees(id)
         ON DELETE CASCADE       
);


INSERT INTO Employees (employee_name) VALUES ('Rob Stevens');
INSERT INTO Employees (employee_name) VALUES ('Jane White');
INSERT INTO Employees (employee_name) VALUES ('Sofia Clark');

INSERT INTO Toys (toy_name, brand, price) VALUES ('Bumblebee', 'Transformers', 14.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Optimus Prime', 'Transformers', 19.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Lightning McQueen', 'Disney Cars', 23.97);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Ramone', 'Disney Cars', 20.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Wonder Woman', 'Barbie', 39.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Princess Leia', 'Barbie', 99.99);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Wizard of Oz: Glinda', 'Barbie', 43.95);
INSERT INTO Toys (toy_name, brand, price) VALUES ('Yoda', 'Disney Star Ward', NULL);

INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (5, 3, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (1, 1, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (3, 1, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (6, 3, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (2, 3, '2020-07-03', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (4, 3, '2020-07-04', 2);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (3, 2, '2020-07-04', 1);
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (1, 1, '2020-07-04', 3);

SELECT brand AS 'OLD brand', 
    REPLACE(brand, 'Disney', 'Marvel') AS 'New brand'
FROM Toys;

SELECT toy_name, LENGTH(toy_name) AS 'name size'
FROM Toys;

SELECT MIN(LENGTH(toy_name)) AS 'smallest name',
       MAX(LENGTH(toy_name)) AS 'largest name'
FROM Toys;

SELECT HEX('Hello!');
SELECT REVERSE('Hello!');

SELECT YEAR('1943-08-23 08:52:31');
SELECT DAYOFWEEK('1943-08-23 08:52:31');
SELECT WEEKDAY('1943-08-23 08:52:31');

SELECT CONCAT('Toy: ', toy_name)
FROM Toys;

SELECT LPAD(toy_name, 30, '-')
FROM Toys;

SELECT CAST("2017-08-29" AS DATE); 
SELECT CAST(20 AS CHAR); 

SELECT *
FROM Toys
WHERE price=MAX((SELECT price FROM Toys));

SELECT *
FROM Toys
WHERE price=(SELECT MAX(price) FROM Toys);


SELECT * 
FROM Toys
WHERE price >= ALL(SELECT price FROM Toys);

SELECT * 
FROM Toys
WHERE price=(SELECT MAX(price) 
             FROM Toys
             );


SELECT toy_name, price,
    CASE
        WHEN price > 25 THEN "price is greater than 15"
        WHEN price < 15 THEN "price is 15 or less"
        ELSE "error"
    END
FROM Toys;

--- An Example of a Union
SELECT employee_name, ROUND(SUM(price * quantity),2) As total_sales
FROM Sales
INNER JOIN Toys ON Toys.id=Sales.toy_id
INNER JOIN Employees ON Sales.employee_id=Employees.id
GROUP BY employee_id
UNION
SELECT 'Total Sales', ROUND(SUM(price * quantity),2)
FROM Sales
INNER JOIN Toys
ON Toys.id=Sales.toy_id;

-- Create a Trigger to make sure we have an employee ID g>=0
DELIMITER // 
CREATE TRIGGER tEmployeeIDCheck 
     BEFORE INSERT ON Sales 
     FOR EACH ROW 
         IF NEW.employee_id < 0
         THEN SET NEW.employee_id = 4; 
         END IF;
//
DELIMITER ;
INSERT INTO Employees (id, employee_name) VALUES(0, 'Nobody');
INSERT INTO Sales (toy_id, employee_id, sale_date, quantity) VALUES (2, -9,'2020-07-05',4);
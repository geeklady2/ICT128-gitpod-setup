/* ICT 128i 003 - Class 3 example - DDL Creating Databases and Tables */

/* Step 1. Create a database to store information */
SHOW DATABASES;
CREATE DATABASE schools;
SHOW DATABASES;


/* Step 2. switch to the database that was just created */
USE schools;


/* Step 3. Create a very simple table and list the tables in the database */
CREATE TABLE universities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30), 
    location VARCHAR(30)
);
SHOW TABLES;


/* Step 4. Add data to the table and  see the data in the table */
INSERT INTO universities (name) VALUES ('UCalgary');
SELECT * FROM universities;


/* Step 5. Add some more data to the table, including changing a record */
INSERT INTO universities 
    (name, location)
    VALUES ('UToronto', 'Toronto');
UPDATE universities SET location='Calgary' WHERE name='UCalgary';

INSERT INTO universities
    (name, location) 
    VALUES ("Simon Fraser University", 'Vancouver');
INSERT INTO universities 
    (name, location)
    VALUES ('MRU', 'Calgary');
INSERT INTO universities 
    (name, location)
    VALUES ("St. Mary's", 'Calgary');  /* Note double quotes on this one */
INSERT INTO universities 
    (name, location)
    VALUES ('Univerity of Lethbridge', 'Lethbridge');
INSERT INTO universities
    (name, location) 
    VALUES ("University of BC", 'Vancouver');
/* Now do your own insert for UCalgary Continuing Ed */


/* Step 6. Show what's in the table, Show all the Calgary Schools */
SELECT * FROM universities;
SELECT * FROM universities WHERE location='Calgary';
/* Do your own SELECT comamand to find all of the Vancouver Schools */


/* Step 7. Add more columns to the database, note rank is a special work in SQL
   so we used urank instead of rank. */
ALTER TABLE universities ADD COLUMN urank INT DEFAULT 0;
ALTER TABLE universities ADD COLUMN PROVINCE VARCHAR(30);
INSERT INTO universities (name, location, urank, province, mcrank) VALUES ('MRU', 'Calgary', 5, 'AB', 7);
SELECT * FROM universities;
/* Add another column to the table on your own */


/* Step 8. Remove the table
    WARNING this delete a table and all of the data in the table
*/
DROP TABLE universities;
SHOW TABLES;

/* Step 9. Remove the database
WARNING this delete the whole schools database, all the table in 
        the database and all of the data, everything that can be
        found in the database.
*/
DROP DATABASE schools;
SHOW DATABASES;

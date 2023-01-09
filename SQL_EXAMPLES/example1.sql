/* Step 1. Create a database to store information */
CREATE DATABASE schools;
SHOW DATABASES;

/* Step 2. switch to the database that was just created */
USE schools;

/* Step 3. Create a very simple table, insert some data, and view what is in the database */
CREATE TABLE universities (
    id INT AUTO_INCREMENT PRIMARY KEY;
    name VARCHAR(30), 
    location VARCHAR(30)
);
INSERT INTO universities (name) VALUES ('UCalgary');
SELECT * FROM universities;

/* Step 4. Add some more data to the table, including changeing a record */
INSERT INTO universities VALUES ('UToronto', 'Toronto');
UPDATE universities SET location='Calgary' WHERE name='UCalgary';
INSERT INTO universities VALUES ('MRU', 'Calgary');
INSERT INTO universities VALUES ("St. Mary's", 'Calgary');
INSERT INTO universities VALUES ("UBC", 'Vancouver');
SELECT * FROM universities;
SELECT * FROM universities WHERE location='Calgary';

/* Step 5. Add more columns to the database, note rank is a special work in SQL
   so we used urank instead of rank. */
ALTER TABLE universities ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE universities ADD COLUMN urank INT;
ALTER TABLE universities ADD COLUMN PROVINCE VARCHAR(30);
ALTER TABLE universities ADD COLUMN mcrank INT DEFAULT 0;
INSERT INTO universities (name, location, urank, province, mcrank) VALUES ('MRU', 'Calgary', 5, 'AB', 7);
SELECT * FROM universities;

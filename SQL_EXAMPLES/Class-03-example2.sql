CREATE DATABASE POLITICS;

USE POLITICS;

CREATE TABLE People (
    id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    age INT DEFAULT 18,
    CHECK (age >=18)
);

INSERT INTO People (first_name, last_name, age) VALUES ('Justin', 'Trudeau', 25);
INSERT INTO People (first_name, last_name, age) VALUES ('Queen', 'Elizabeth', 96);
INSERT INTO People (first_name, last_name, age) VALUES ('Joe', 'Biden', 55);
INSERT INTO People (first_name, last_name, age) VALUES ('Kelly', 'Trudeau', 27);

CREATE TABLE Addresses (
    id INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    fk_people_id INT NOT NULL,
    street VARCHAR(100),
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    INDEX idx_addresses_city (city),
    FOREIGN KEY (fk_people_id)
         REFERENCES People(id)
         ON DELETE CASCADE
);

INSERT INTO Addresses (fk_people_id, city, country) VALUES (1, 'Ottawa', 'Canada');
INSERT INTO Addresses (fk_people_id, city, country) VALUES (2, 'London', 'England');
INSERT INTO Addresses (fk_people_id, city, country) VALUES (3, 'Washington', 'United States');
INSERT INTO Addresses (fk_people_id, city, country) VALUES (4, 'Ottawa', 'Canada');

SELECT * FROM People INNER JOIN Addresses ON People.id=Addresses.fk_people_id;
SELECT * FROM People, Addresses WHERE People.id=Addresses.fk_people_id;
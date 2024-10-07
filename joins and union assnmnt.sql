CREATE DATABASE joins_union_assnmnt; 
USE joins_union_assnmnt;
CREATE TABLE Country (Id INT PRIMARY KEY,Country_name VARCHAR(40),Population INT,Area DECIMAL(10, 2));

CREATE TABLE Persons (Id INT PRIMARY KEY,Fname VARCHAR(35),Lname VARCHAR(35),Population INT,
    Rating DECIMAL(3, 2),
    Country_Id INT,
    Country_name VARCHAR(40),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id));
    
    INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331000000, 9833520.00),
(2, 'Canada', 38000000, 9984670.00),
(3, 'India', 1393409038, 3287263.00),
(4, 'UK', 67886011, 243610.00),
(5, 'Australia', 25687041, 7692024.00),
(6, 'Germany', 83783942, 357022.00),
(7, 'France', 65273511, 551695.00),
(8, 'Japan', 126476461, 377975.00),
(9, 'China', 1444216107, 9596961.00),
(10, 'Brazil', 212559417, 8515767.00);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'devid', 500000, 4.5, 1, 'USA'),
(2, 'Jeena', 'Smith', 800000, 4.0, 2, 'Canada'),
(3, 'sunil', 'chetri', 1200000, 4.8, 3, 'India'),
(4, 'Emily', 'Jones', 650000, 3.9, 4, 'UK'),
(5, 'anrian', 'loona', 1100000, 4.2, 5, 'Australia'),
(6, 'Hiro', 'Tanaka', 1000000, 4.6, 8, 'Japan'),
(7, 'kiliyan', 'embape', 600000, 3.5, 7, 'France'),
(8, 'Chen', 'Wei', 1500000, 4.9, 9, 'China'),
(9, 'tony', 'croos', 700000, 3.8, 6, 'Germany'),
(10, 'Neymar', 'jr', 950000, 4.1, 10, 'Brazil');

SELECT Persons.Id, Persons.Fname, Persons.Lname, Persons.Rating, Country.Country_name
FROM Persons
INNER JOIN Country ON Persons.Country_Id = Country.Id;

SELECT Persons.Id, Persons.Fname, Persons.Lname, Persons.Rating, Country.Country_name
FROM Persons
LEFT JOIN Country ON Persons.Country_Id = Country.Id;

SELECT Persons.Id, Persons.Fname, Persons.Lname, Persons.Rating, Country.Country_name
FROM Persons
RIGHT JOIN Country ON Persons.Country_Id = Country.Id;

SELECT DISTINCT Country_name FROM Country
UNION
SELECT DISTINCT Country_name FROM Persons;

SELECT Country_name FROM Country
UNION ALL
SELECT Country_name FROM Persons;

SELECT Id, Fname, Lname, ROUND(Rating) AS Rounded_Rating
FROM Persons;
-- Easy Level
-- Author-Book Mapping Using JOINs and Basic SQL Queries

-- Creating / Selecting database
USE BookStoreDB;

-- Creating Tables

CREATE TABLE Authors (
AuthorID INT PRIMARY KEY,
AuthorName VARCHAR(50) NOT NULL DEFAULT 'Anonymous',
MainPublisher VARCHAR(50)
);

CREATE TABLE Publications (
PublicationID INT PRIMARY KEY,
AuthorID INT NOT NULL,
BookTitle VARCHAR(60) NOT NULL,
PublishingHouse VARCHAR(50),
Cost INT NOT NULL,
QuantityAvailable INT DEFAULT 7,
FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Inserting data

INSERT INTO Authors (AuthorID, AuthorName, MainPublisher) VALUES
(201, 'Brandon Sanderson', 'Tor Books'),
(202, 'Octavia E. Butler', 'Warner Books'),
(203, 'Toni Morrison', 'Alfred A. Knopf'),
(204, 'Philip K. Dick', 'Vintage'),
(205, 'Ursula K. Le Guin', 'Harper & Row');

INSERT INTO Publications (PublicationID, AuthorID, BookTitle, PublishingHouse, Cost, QuantityAvailable) VALUES
(301, 201, 'Mistborn', 'Tor Books', 490, 20),
(302, 201, 'The Way of Kings', 'Tor Books', 650, 15),
(303, 202, 'Kindred', 'Warner Books', 520, 10),
(304, 202, 'Parable of the Sower', 'Warner Books', 540, 12),
(305, 203, 'Beloved', 'Alfred A. Knopf', 580, 8),
(306, 203, 'Song of Solomon', 'Alfred A. Knopf', 560, 9),
(307, 204, 'Do Androids Dream of Electric Sheep?', 'Vintage', 500, 11),
(308, 204, 'Ubik', 'Vintage', 470, 13),
(309, 205, 'The Left Hand of Darkness', 'Harper & Row', 495, 14),
(310, 205, 'A Wizard of Earthsea', 'Harper & Row', 510, 10);

-- INNER JOIN query

SELECT 
    a.AuthorName AS Author,
    a.MainPublisher AS Publisher,
    p.BookTitle AS Title
FROM 
    Authors a
INNER JOIN 
    Publications p ON a.AuthorID = p.AuthorID;

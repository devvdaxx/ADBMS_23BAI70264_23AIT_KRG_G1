-- Easy Level
-- Writer-Book Relationship Using Joins and Basic SQL Operations

-- Creating / Using database
USE LibraryDB;

-- Creating Tables 

CREATE TABLE Writers (
Writer_ID INT PRIMARY KEY,
Writer_Name VARCHAR(40) NOT NULL DEFAULT('Unknown'),
Writer_Publisher VARCHAR(40)
);

CREATE TABLE Books (
Book_ID INT PRIMARY KEY,
Writer_ID INT NOT NULL,
Title VARCHAR(50) NOT NULL,
Publisher VARCHAR(40),
Price INT NOT NULL,
Stock INT DEFAULT 5,
FOREIGN KEY (Writer_ID) REFERENCES Writers(Writer_ID)
);

-- Adding values

INSERT INTO Writers (Writer_ID, Writer_Name, Writer_Publisher) VALUES
(101, 'Neil Gaiman', 'HarperCollins'),
(102, 'Margaret Atwood', 'McClelland'),
(103, 'Haruki Murakami', 'Shinchosha'),
(104, 'Kazuo Ishiguro', 'Faber'),
(105, 'Chimamanda Ngozi Adichie', 'Knopf');

INSERT INTO Books (Book_ID, Writer_ID, Title, Publisher, Price, Stock) VALUES
(201, 101, 'American Gods', 'HarperCollins', 550, 12),
(202, 101, 'Coraline', 'HarperCollins', 420, 18),
(203, 102, 'The Handmaid\'s Tale', 'McClelland', 480, 10),
(204, 102, 'Oryx and Crake', 'McClelland', 500, 8),
(205, 103, 'Kafka on the Shore', 'Shinchosha', 620, 11),
(206, 103, 'Norwegian Wood', 'Shinchosha', 590, 9),
(207, 104, 'Never Let Me Go', 'Faber', 450, 14),
(208, 104, 'Klara and the Sun', 'Faber', 470, 13),
(209, 105, 'Half of a Yellow Sun', 'Knopf', 530, 7),
(210, 105, 'Purple Hibiscus', 'Knopf', 510, 10);

-- INNER JOIN query

SELECT 
    w.Writer_Name AS Author,
    w.Writer_Publisher AS Publisher,
    bk.Title AS Book_Title
FROM 
    Writers w
JOIN 
    Books bk ON w.Writer_ID = bk.Writer_ID;

-- Medium Level
-- SELF JOIN Example on Staff Hierarchy

USE StaffDB;

-- Creating Table

CREATE TABLE Staff (
	StaffID INT PRIMARY KEY,
	StaffName VARCHAR(40) NOT NULL,
	Division VARCHAR(40) NOT NULL,
	ReportsTo INT NULL
);

-- Adding foreign key to self
ALTER TABLE Staff
ADD CONSTRAINT FK_Staff_Manager FOREIGN KEY (ReportsTo) REFERENCES Staff(StaffID);

-- Inserting data

INSERT INTO Staff (StaffID, StaffName, Division, ReportsTo)
VALUES
(101, 'Riya Sharma', 'Operations', NULL),        
(102, 'Arjun Mehta', 'Accounts', 101),
(103, 'Meena Iyer', 'Tech Support', 101),
(104, 'Kunal Roy', 'Accounts', 102),
(105, 'Priya Singh', 'Tech Support', 103),
(106, 'Nikhil Rao', 'Operations', 101);

-- Self JOIN to display staff-manager relationship

SELECT 
	S1.StaffID AS [Staff_ID], 
	S1.StaffName AS [Staff_Name], 
	S1.Division AS [Staff_Division],
	S2.StaffID AS [Manager_ID], 
	S2.StaffName AS [Manager_Name], 
	S2.Division AS [Manager_Division]
FROM 
	Staff AS S1
LEFT JOIN 
	Staff AS S2
ON 
	S1.ReportsTo = S2.StaffID;

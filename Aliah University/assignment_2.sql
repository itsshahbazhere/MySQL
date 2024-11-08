-- --------------Q1) Create all tables and insert values.---------------

-- creating database assignment_2;
CREATE DATABASE assignment_2;
USE assignment_2;

-- creating table suppliers
CREATE TABLE suppliers(
	sid INT PRIMARY KEY,
    sname VARCHAR(100),
    address VARCHAR(255)
); 

-- creating table parts
CREATE TABLE parts(
	pid INT PRIMARY KEY,
    pname VARCHAR(100),
    color VARCHAR(50)
); 

-- creating table catalog
CREATE TABLE catalog(
	sid INT,
	pid INT,
    cost REAL,
    PRIMARY KEY(sid, pid),
    FOREIGN KEY (sid) REFERENCES suppliers(sid),
    FOREIGN KEY (pid) REFERENCES parts(pid)
);

-- Inserting values into suppliers table
INSERT INTO suppliers 
(sid, sname, address)
VALUES
(1, 'John Smith', '221 Packer Street'), 
(2, 'Alice Green', '55 Valley Road'), 
(3, 'Yosemite Sham', '122 River Street'), 
(4, 'Emma White', '221 Packer Street');


-- Inserting values into parts table
INSERT INTO parts 
(pid, pname, color)
VALUES
(101, 'Bolt', 'Red'), 
(102, 'Nut', 'Green'), 
(103, 'Screw', 'Blue'), 
(104, 'Washer', 'Red'),
(105, 'Pin', 'Green');

-- Inserting values into Catalog table 
INSERT INTO catalog
(sid, pid, cost)
VALUES 
(1, 101, 150.00), 
(1, 102, 50.00), 
(2, 101, 175.00), 
(2, 103, 200.00), 
(3, 104, 180.00), 
(3, 102, 190.00), 
(4, 105, 160.00), 
(4, 104, 130.00), 
(4, 101, 110.00);

-- Printing suppliers table
SELECT * FROM suppliers;

-- Printing parts table
SELECT * FROM parts;

-- Printing catalog table
SELECT * FROM catalog;



-- ----------------Q2)ANSWER THE FOLLOWING QUERIES---------------------- 

-- a) Find the names of suppliers who supply some red part.
SELECT DISTINCT s.sname FROM suppliers AS s
JOIN catalog AS c ON s.sid = c.sid
JOIN parts AS p ON p.pid = c.pid
WHERE p.color = 'Red';

-- b) Find the sid's of suppliers who supply some red or green part. 
SELECT s.sid 
FROM suppliers AS s
JOIN catalog AS c ON s.sid = c.sid
JOIN parts AS p ON p.pid = c.pid
WHERE p.color IN ('Red', 'Green')
GROUP BY s.sid
ORDER BY s.sid;

-- c) Find the sid's of suppliers who supply some red part or are at 221 Packer Street
SELECT DISTINCT s.sid
FROM suppliers AS s
JOIN catalog AS c ON s.sid = c.sid
JOIN parts AS p ON p.pid = c.pid
WHERE p.color='Red' OR s.address='221 Packer Street'
ORDER BY s.sid;

-- d) Find the sid's of suppliers who supply some red part and some green part.
SELECT DISTINCT s.sid
FROM suppliers AS s
JOIN catalog AS c1 ON s.sid = c1.sid
JOIN parts AS p1 ON p1.pid = c1.pid
JOIN catalog AS c2 ON s.sid = c2.sid
JOIN parts AS p2 ON p2.pid = c2.pid
WHERE p1.color='Red' AND  p2.color='Green'
ORDER BY s.sid;

-- e) Find the sid's of suppliers who supply every part.
SELECT s.sid
FROM suppliers AS s
JOIN catalog AS c ON s.sid = c.sid
GROUP BY s.sid
HAVING COUNT(DISTINCT c.pid) = (SELECT COUNT(*) FROM parts);

-- f) Find the sid's of suppliers who supply every red part 
SELECT s.sid
FROM suppliers AS s
JOIN catalog c ON c.sid = s.sid
JOIN parts p ON p.pid = c.pid
WHERE p.color='red'
GROUP BY c.sid
HAVING COUNT(DISTINCT c.pid) = (SELECT COUNT(*) FROM parts WHERE color='Red');

-- g) Find the sid's of suppliers who supply every red or green part.
SELECT s.sid
FROM suppliers AS s
JOIN catalog c ON c.sid = s.sid
JOIN parts p ON p.pid = c.pid
WHERE p.color IN ('Red', 'Green')
GROUP BY c.sid
HAVING COUNT(DISTINCT c.pid) = (SELECT COUNT(*) FROM parts WHERE color IN('Red', 'Green'));

-- h) Find the sids of suppliers who supply every red part or supply every green part.
SELECT s.sid
FROM suppliers AS s
JOIN catalog c ON c.sid = s.sid
JOIN parts p ON p.pid = c.pid
GROUP BY c.sid
HAVING COUNT(DISTINCT CASE WHEN P.color = 'Red' THEN C.pid END) = (SELECT COUNT(*) FROM Parts WHERE color = 'Red') 
OR COUNT(DISTINCT CASE WHEN P.color = 'Green' THEN C.pid END) = (SELECT COUNT(*) FROM Parts WHERE color = 'Green'); 


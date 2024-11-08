-- ---------------------------Q1) Create all tables and insert values.------------------------------

-- creating database
CREATE DATABASE assignment_1;
USE assignment_1;

-- creating table of client_master
CREATE TABLE client_master(
	client_no VARCHAR(6),
    name VARCHAR(20),
    address1 VARCHAR(30),
    address2 VARCHAR(30),
    city VARCHAR(15),
    state VARCHAR(15),
    pincode INT(6),
    bal_due DECIMAL(10,2)
);

-- creating table of product_master
CREATE TABLE product_master ( 
	product_no VARCHAR(6), 
	description VARCHAR(20), 
	profit_percent DECIMAL(10,2), 
	unit_measure VARCHAR(30), 
	qty_on_hand DECIMAL(10,2), 
    reorder_level VARCHAR(15), 
    sell_price DECIMAL(10,2), 
	cost_price DECIMAL(10,2) 
);

-- inserting data in table client_master
INSERT INTO client_master
(client_no, name, address1, address2, city, state, pincode, bal_due)
VALUES
('001', 'Alice', '123 Main St', 'Apt 4', 'Mumbai', 'Maharashtra', 400001, 1500.00),
('002', 'Bob', '456 Park Ave', 'APT 3', 'Chennai', 'Tamil Nadu', 600001, 2500.00), 
('003', 'Charlie', '789 Broadway', 'APT 9', 'Kolkata', 'West Bengal', 110001, 3000.00);


-- inserting data in table product_master
INSERT INTO product_master 
(product_no, description, profit_percent, unit_measure, qty_on_hand, reorder_level, sell_price, cost_price)
VALUES
('P001', '1.44 drive', 20.00, 'pcs', 50, '5 pcs', 6000.00, 5000.00),
('P002', '1.22 drive', 15.00, 'pcs', 30, '10 pcs', 4500.00, 4000.00),
('P003', 'USB drive', 25.00, 'pcs', 100, '20 pcs', 3000.00, 2400.00); 

-- printing table of client_master
SELECT * FROM client_master;

-- printing table of product_master
SELECT *FROM product_master;






-- ---------------------------Q2)ANSWER THE FOLLOWING QUERIES------------------------------

-- a) Find out the names of all the clients. 
SELECT name FROM client_master;

-- b) Retrieve the list of names and cities of all the clients.
SELECT name, city FROM client_master;

-- c) List the various products available from the product_master table.
SELECT description FROM product_master; 

-- d) List the clients who are located in Mumbai. 
SELECT * FROM client_master WHERE city='Mumbai';

-- e) Display the information for client no 001 and 002.  
SELECT * FROM client_master WHERE client_no IN ('001', '002');

-- f) Find the product with descriptions as ‘1.44 drive’ and ‘1.22 drive’.
SELECT * FROM product_master WHERE description IN ('1.44 drive', '1.22 drive');

-- g) Find all the products whose sale price is greater than 5000. 
SELECT * FROM product_master WHERE sell_price>5000;

-- h) Find the product whose selling price is greater than 2000 and less than or equal to 5000. 
SELECT * FROM product_master WHERE sell_price>2000 AND sell_price<=5000;

-- i)Find the list of all clients who stay in city ‘Mumbai’ or city ‘Chennai’
SELECT * FROM client_master WHERE city IN ('Mumbai', 'Chennai');

-- j) List the name,city and state of clients not in the state of ‘Maharastra’.
SELECT name, city, state FROM client_master WHERE state!='Maharashtra';
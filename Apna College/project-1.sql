CREATE DATABASE IF NOT EXISTS shahbaz_db;
USE shahbaz_db;



-- practice question-1

CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary FLOAT
);

INSERT INTO employee
(id,name,salary)
VALUES
(1,"adam",25000.25),
(2,"bob",30000),
(3,"casey", 40000);

SELECT * FROM employee;









-- Practice question 2

CREATE TABLE payment(
	customer_id INT PRIMARY KEY,
    customer VARCHAR(50),
    mode VARCHAR(30) NOT NULL,
    city VARCHAR(20)
);

INSERT INTO payment
(customer_id, customer, mode,city)
VALUES
(101,"Ram","Net Banking","Poland"),
(102,"Shayam","Credit Card","Miami"),
(103,"Suresh","Credit Card","Seattle"),
(104,"Akash","NetBanking","Denver"),
(105,"Neel","Credit Card","New Orleans"),
(106,"Ratan","Dredit Card","Minneapolis"),
(107,"Vishal","Dredit Card","Phoenix"),
(108,"Raj","NetBanking","Boston"),
(109,"Shivam","NetBanking","Nashville"),
(110,"Shahbaz","Credit Card","Boston");

SELECT * FROM payment;

SELECT mode, COUNT(customer_id)
FROM payment
GROUP BY mode;

-- ------Learning CASCADING FOR FOREGIN KEY -----------

CREATE TABLE dept(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO dept
(id,name)
VALUES
(101, "English"),
(102, "IT");

UPDATE dept 
SET id = 105
WHERE id = 102;

UPDATE dept
SET id = 110
WHERE id = 101;

SELECT * FROM dept;

CREATE TABLE teacher(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES dept(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

INSERT INTO teacher
(id,name,dept_id)
VALUES
(101, "SHAHBAZ", 101),
(102, "KAIF" , 102),
(103, "TAAHA" , 102);

SELECT * FROM teacher;










-- ------- Learning--------

CREATE TABLE student (
    rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(5),
    city VARCHAR(30)
);


INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, 'Md Shahbaz Alam', 98, 'A+', 'Kolkata'),
(102, 'Md Taaha Parwez', 95, 'A', 'Bihar'),
(103, 'Md Kaif', 100, 'A', 'Kolkata'),
(104, 'Javed Alam', 36, 'B+', 'Bihar'),
(105, 'Md Abu Talha Tabish', 99, 'B', 'Kolkata');


SELECT * FROM student;
SELECT name, marks FROM student;
SELECT DISTINCT city FROM student;

SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY city ASC;


SELECT city, COUNT(rollno)
FROM student
GROUP BY city
HAVING MAX(marks)>90;


SELECT city,COUNT(rollno)
FROM student
WHERE grade="A"
GROUP BY city
HAVING MAX(marks)>=95
ORDER BY city DESC;


-- Alter -----

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 19;


ALTER TABLE student
MODIFY age VARCHAR(2);

INSERT INTO student
(rollno, name, marks, grade, city,age)
VALUES
(111, "john" , 12, 'C', "LONDON", 100);

ALTER TABLE student
CHANGE stu_age age INT;

ALTER TABLE student 
DROP COLUMN age;


ALTER TABLE stu
RENAME TO student;


SELECT * FROM student;
TRUNCATE TABLE student;




-- Practice question ----

-- change the name of column "name" to the "full_name"
ALTER TABLE student
CHANGE name full_name VARCHAR(50);

-- deleted alll the student who scored marks less than 90
DELETE FROM student
WHERE marks<90; -- this delete jawed data

-- delete the column for grades
ALTER TABLE student
DROP COLUMN grade;
















-- Inner Join ------

CREATE DATABASE inner_join;
USE inner_join;

CREATE TABLE students(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO students (id,name)
VALUES
(101,"saif"),
(102,"faiz"),
(103,"ayaz");

SELECT * FROM students;

CREATE TABLE courses(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO courses (id,course)
VALUES
(102,"English"),
(105,"Math"),
(103,"Physics"),
(109,"Chemistry"),
(108,"Computer");

SELECT * FROM courses;

SELECT *
FROM students as s
INNER JOIN courses as c
ON s.id = c.id;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

-- Left Join ------

CREATE DATABASE left_join;
USE left_join;

CREATE TABLE students(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO students (id,name)
VALUES
(101,"saif"),
(102,"faiz"),
(103,"ayaz");

SELECT * FROM students;

CREATE TABLE courses(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO courses (id,course)
VALUES
(102,"English"),
(105,"Math"),
(103,"Physics"),
(109,"Chemistry"),
(108,"Computer");

SELECT * FROM courses;

SELECT *
FROM students as s
LEFT JOIN courses as c
ON s.id = c.id;
    
    
    
    
    
    
    
    
    
    
    

-- right Join ------

CREATE DATABASE right_join;
USE right_join;

CREATE TABLE students(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO students (id,name)
VALUES
(101,"saif"),
(102,"faiz"),
(103,"ayaz");

SELECT * FROM students;

CREATE TABLE courses(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO courses (id,course)
VALUES
(102,"English"),
(105,"Math"),
(103,"Physics"),
(109,"Chemistry"),
(108,"Computer");

SELECT * FROM courses;

SELECT *
FROM students as s
RIGHT JOIN courses as c
ON s.id = c.id;
    
    
    
    
    
    





 
    

-- FULL Join ------

CREATE DATABASE full_join;
USE full_join;

CREATE TABLE students(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO students (id,name)
VALUES
(101,"saif"),
(102,"faiz"),
(103,"ayaz");

SELECT * FROM students;

CREATE TABLE courses(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO courses (id,course)
VALUES
(102,"English"),
(105,"Math"),
(103,"Physics"),
(109,"Chemistry"),
(108,"Computer");

SELECT * FROM courses;

SELECT *
FROM students as s
LEFT JOIN courses as c
ON s.id = c.id
UNION
SELECT *
FROM students as s
RIGHT JOIN courses as c
ON s.id = c.id;














-- LEFT EXCLUSIVE JOIN ------

CREATE DATABASE left_exclusive_join;
USE left_exclusive_join;

CREATE TABLE students(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO students (id,name)
VALUES
(101,"saif"),
(102,"faiz"),
(103,"ayaz");

SELECT * FROM students;

CREATE TABLE courses(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO courses (id,course)
VALUES
(102,"English"),
(105,"Math"),
(103,"Physics"),
(109,"Chemistry"),
(108,"Computer");

SELECT * FROM courses;

SELECT *
FROM students as s
LEFT JOIN courses as c
ON s.id = c.id
WHERE c.id IS NULL;
    
    
    
    
    
    
    
    


-- RIGHT EXCLUSIVE JOIN ------

CREATE DATABASE right_exclusive_join;
USE right_exclusive_join;

CREATE TABLE students(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO students (id,name)
VALUES
(101,"saif"),
(102,"faiz"),
(103,"ayaz");

SELECT * FROM students;

CREATE TABLE courses(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO courses (id,course)
VALUES
(102,"English"),
(105,"Math"),
(103,"Physics"),
(109,"Chemistry"),
(108,"Computer");

SELECT * FROM courses;

SELECT *
FROM students as s
RIGHT JOIN courses as c
ON s.id = c.id
WHERE s.id IS NULL;
    
    
    
    
    
    
    
    

-- left and right exclusive join (HOMEWORK) ------

CREATE DATABASE homework_join;
USE homework_join;

CREATE TABLE students(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO students (id,name)
VALUES
(101,"saif"),
(102,"faiz"),
(103,"ayaz");

SELECT * FROM students;

CREATE TABLE courses(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO courses (id,course)
VALUES
(102,"English"),
(105,"Math"),
(103,"Physics"),
(109,"Chemistry"),
(108,"Computer");

SELECT * FROM courses;

SELECT *
FROM students as s
LEFT JOIN courses as c
ON s.id = c.id
WHERE c.id IS NULL
UNION
SELECT *
FROM students as s
RIGHT JOIN courses as c
ON s.id = c.id
WHERE s.id IS NULL;
    
    
    
    
    
    
    
    
    
-- --------Self join--------------

CREATE DATABASE self_join;
USE self_join;

CREATE TABLE employee(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee
(id, name, manager_id)
VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

-- SELECT *
SELECT a.name as manager_name , b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;















-- --------SUB QUERIES EXAMPLE 1--------------
CREATE DATABASE ex_one;
USE ex_one;

CREATE TABLE student(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

INSERT INTO student
(rollno,name,marks)
VALUES
(101, "anil", 78),
(102, "bhumika", 93),
(103, "chetan", 85),
(104, "dhruv", 96),
(105, "emanuel", 92),
(106, "farah", 82);


SELECT name,marks
FROM student
WHERE marks > AVG(marks);

SELECT name, marks
FROM student
WHERE marks > (SELECT AVG(marks) FROM student);











-- --------SUB QUERIES EXAMPLE 2--------------
CREATE DATABASE ex_two;
USE ex_two;

CREATE TABLE student(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

INSERT INTO student
(rollno,name,marks)
VALUES
(101, "anil", 78),
(102, "bhumika", 93),
(103, "chetan", 85),
(104, "dhruv", 96),
(105, "emanuel", 92),
(106, "farah", 82);

-- SELECT name, rollno
-- FROM student
-- WHERE rollno%2=0;

SELECT name, rollno
FROM student
WHERE rollno IN(
	SELECT rollno
	FROM student
	WHERE rollno%2=0
);
























-- --------SUB QUERIES EXAMPLE 3 (USING FROM)--------------
CREATE DATABASE ex_three;
USE ex_three;


CREATE TABLE student(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT,
    city VARCHAR(50) NOT NULL
);

INSERT INTO student
(rollno,name,marks, city)
VALUES
(101, "anil", 78, "Pune"),
(102, "bhumika", 93, "Mumbai"),
(103, "chetan", 85, "Mumbai"),
(104, "dhruv", 96, "Delhi"),
(105, "emanuel", 92, "Delhi"),
(106, "farah", 82, "Delhi");


SELECT MAX(marks)
FROM (SELECT * FROM student WHERE city="Delhi") AS temp;

-- SELECT MAX(marks),city
-- FROM student
-- WHERE city="Delhi";



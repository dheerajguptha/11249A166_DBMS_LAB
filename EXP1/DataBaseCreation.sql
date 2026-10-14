-- Experiment 1 — Database creation and information retrieval
--
-- AIM
-- To build a student database and retrieve its records through filtering, sorting, and aggregate queries.

--program
-- Step 1
CREATE DATABASE IF NOT EXISTS LAB_EXPERIMENT_1;

-- Step 2
USE LAB_EXPERIMENT_1;

-- Step 3
CREATE TABLE Student(
StudentID INT PRIMARY KEY,
StudentName VARCHAR(30),
Department VARCHAR(20),
Age INT,
CGPA DECIMAL(3,2)
);

-- Step 4
INSERT INTO Student VALUES
(101,'Anu','CSE',20,8.90),
(102,'Bala','ECE',21,8.50),
(103,'Charles','IT',20,9.10),
(104,'Divya','CSE',22,8.70),
(105,'Esha','AIDS',21,9.20);

-- Step 5
SELECT * FROM Student;

-- Step 6
SELECT * FROM Student WHERE Department='CSE';

-- Step 7
SELECT * FROM Student WHERE CGPA>8.8;

-- Step 8
SELECT * FROM Student ORDER BY CGPA DESC;

-- Step 9
SELECT COUNT(*) AS TotalStudents FROM Student;

-- Step 10
SELECT AVG(CGPA) FROM Student;

-- RESULT
-- The program creates and populates a student table and demonstrates filtering, sorting, counting, and averaging its records.

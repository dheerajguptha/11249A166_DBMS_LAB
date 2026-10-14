-- Experiment 4 — SQL constraints
--
-- AIM
-- To define and test table constraints that protect data integrity.


-- Step 1: Define a database object
CREATE DATABASE IF NOT EXISTS LAB_EXPERIMENT_4;

-- Step 2: Execute the SQL command
USE LAB_EXPERIMENT_4;

-- Step 3: Define a database object
CREATE TABLE Department ( dept_id     INT PRIMARY KEY,  dept_name VARCHAR(50) NOT NULL UNIQUE);

-- Step 4: Define a database object
CREATE TABLE Student (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 17 AND age <= 30),
    email VARCHAR(50) UNIQUE,
    gender VARCHAR(20) DEFAULT 'Not Specified',
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Step 5: Insert sample data
INSERT INTO Department VALUES (1, 'Computer Science');

-- Step 6: Insert sample data
INSERT INTO Department VALUES (2, 'Electronics');

-- Step 7: Insert sample data
INSERT INTO Student (roll_no, name, age, email, gender, dept_id)
VALUES (101, 'Arun', 20, 'arun@email.com', 'Male', 1);

-- Step 8: Insert sample data
INSERT INTO Student (roll_no, name, age, email, dept_id)
VALUES (102, 'Priya', 21, 'priya@email.com', 2);

-- Step 9: Insert sample data
INSERT INTO Student (roll_no, name, age, email, dept_id)
VALUES (103, NULL, 22, 'test1@email.com', 1);

-- Step 10: Insert sample data
INSERT INTO Student (roll_no, name, age, email, dept_id)
VALUES (104, 'Kumar', 23, 'arun@email.com', 1);

-- Step 11: Insert sample data
INSERT INTO Student (roll_no, name, age, email, dept_id)
VALUES (101, 'Ravi', 22, 'ravi@email.com', 1);

-- Step 12: Insert sample data
INSERT INTO Student (roll_no, name, age, email, dept_id)
VALUES (105, 'Sita', 35, 'sita@email.com', 1);

-- Step 13: Insert sample data
INSERT INTO Student (roll_no, name, age, email, dept_id)
VALUES (106, 'Meena', 20, 'meena@email.com', 9);

-- Step 14: Change an object definition
ALTER TABLE Student
ADD CONSTRAINT chk_name CHECK (LENGTH(name) >= 3);

-- Step 15: Change an object definition
ALTER TABLE Student
DROP CHECK chk_name;

-- Step 16: Execute the SQL command
DESC Student;

-- RESULT
-- The constraints maintain valid table relationships and reject data that violates the defined rules.

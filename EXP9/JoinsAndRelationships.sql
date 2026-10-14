-- Experiment 9 — Relationships, joins and subqueries
--
-- AIM
-- To connect tables through keys and answer retrieval questions using joins and nested queries.

-- Step 1: Define a database object
CREATE DATABASE IF NOT EXISTS LAB_EXPERIMENT_9;

-- Step 2: Execute the SQL command
USE LAB_EXPERIMENT_9;

-- Step 3: Define a database object
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

-- Step 4: Define a database object
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    dept_id INT,
    cgpa DECIMAL(3,2),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Step 5: Define a database object
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(60) NOT NULL,
    dept_id INT,
    credits INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

-- Step 6: Define a database object
CREATE TABLE Enrollment (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    semester INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Step 7: Insert sample data
INSERT INTO Department VALUES
(10, 'CSE', 'Block A'),
(20, 'ECE', 'Block B'),
(30, 'IT',  'Block C'),
(40, 'MECH','Block D');

-- Step 8: Insert sample data
INSERT INTO Student VALUES
(101, 'Anu',   10, 8.70),
(102, 'Bala',  10, 7.90),
(103, 'Charan',20, 8.20),
(104, 'Divya', 30, 9.10),
(105, 'Esha',  NULL, 7.50);

-- Step 9: Insert sample data
INSERT INTO Course VALUES
(501, 'DBMS',       10, 4),
(502, 'Data Structures', 10, 4),
(503, 'Digital Systems', 20, 3),
(504, 'Web Technology', 30, 3);

-- Step 10: Insert sample data
INSERT INTO Enrollment VALUES
(1, 101, 501, 5, 88),
(2, 101, 502, 5, 91),
(3, 102, 501, 5, 76),
(4, 103, 503, 5, 84),
(5, 104, 504, 5, 95);

-- Step 11: Retrieve records or calculate a summary
SELECT s.student_id, s.student_name, d.dept_name
FROM Student s
INNER JOIN Department d
    ON s.dept_id = d.dept_id;

-- Step 12: Retrieve records or calculate a summary
SELECT s.student_id, s.student_name, d.dept_name
FROM Student s
LEFT JOIN Department d
    ON s.dept_id = d.dept_id;

-- Step 13: Retrieve records or calculate a summary
SELECT d.dept_id, d.dept_name, s.student_name
FROM Department d
LEFT JOIN Student s
    ON d.dept_id = s.dept_id
ORDER BY d.dept_id;

-- Step 14: Retrieve records or calculate a summary
SELECT s.student_name, c.course_name, e.marks
FROM Enrollment e
INNER JOIN Student s ON e.student_id = s.student_id
INNER JOIN Course c ON e.course_id = c.course_id
ORDER BY s.student_id;

-- Step 15: Retrieve records or calculate a summary
SELECT s.student_name, c.course_name, e.marks
FROM Enrollment e
JOIN Student s ON e.student_id = s.student_id
JOIN Course c ON e.course_id = c.course_id
WHERE e.marks > 80;

-- Step 16: Retrieve records or calculate a summary
SELECT d.dept_name, s.student_name
FROM Student s
RIGHT JOIN Department d
    ON s.dept_id = d.dept_id
ORDER BY d.dept_id;

-- Step 17: Retrieve records or calculate a summary
SELECT student_id, student_name, cgpa
FROM Student
WHERE cgpa > (SELECT AVG(cgpa) FROM Student);

-- Step 18: Retrieve records or calculate a summary
SELECT student_id, student_name
FROM Student
WHERE dept_id = (
    SELECT dept_id
    FROM Department
    WHERE dept_name = 'CSE'
);

-- Step 19: Retrieve records or calculate a summary
SELECT student_id, student_name
FROM Student
WHERE student_id IN (
    SELECT student_id
    FROM Enrollment
    WHERE course_id = (
        SELECT course_id
        FROM Course
        WHERE course_name = 'DBMS'
    )
);

-- Step 20: Retrieve records or calculate a summary
SELECT course_id, course_name, credits
FROM Course
WHERE credits > ANY (
    SELECT credits
    FROM Course
    WHERE dept_id = 20
);

-- Step 21: Retrieve records or calculate a summary
SELECT s.student_id, s.student_name, s.dept_id, s.cgpa
FROM Student s
WHERE s.cgpa > (
    SELECT AVG(s2.cgpa)
    FROM Student s2
    WHERE s2.dept_id = s.dept_id
);

-- Step 22: Retrieve records or calculate a summary
SELECT student_id, student_name, cgpa
FROM Student
WHERE cgpa = (SELECT MAX(cgpa) FROM Student);

-- RESULT
-- Related records are retrieved through joins, aggregate subqueries, and correlated conditions.

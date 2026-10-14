-- Experiment 8 — Normalization from 1NF to 5NF
--
-- AIM
-- To organize the supplied relations into normalized tables and verify the decomposed data with SQL joins.

-- Step 1: Define a database object
CREATE TABLE StudentCourse_1NF (
    SID           VARCHAR2(10),
    SName         VARCHAR2(30),
    Course        VARCHAR2(20),
    Faculty       VARCHAR2(30),
    FacultyPhone  VARCHAR2(15),
    Dept          VARCHAR2(10),
    HOD           VARCHAR2(30),
    CONSTRAINT pk_1nf PRIMARY KEY (SID, Course)
);

-- Step 2: Insert sample data
INSERT INTO StudentCourse_1NF VALUES ('S1','Arun','DBMS','Ravi','9990001','CSE','Dr. Sharma');

-- Step 3: Insert sample data
INSERT INTO StudentCourse_1NF VALUES ('S1','Arun','OS','Meena','9990002','CSE','Dr. Sharma');

-- Step 4: Insert sample data
INSERT INTO StudentCourse_1NF VALUES ('S2','Bala','DBMS','Ravi','9990001','CSE','Dr. Sharma');

-- Step 5: Commit the transaction
COMMIT;

-- Step 6: Retrieve records or calculate a summary
SELECT * FROM StudentCourse_1NF;

-- Step 7: Define a database object
CREATE TABLE Student (
    SID    VARCHAR2(10) PRIMARY KEY,
    SName  VARCHAR2(30)
);

-- Step 8: Define a database object
CREATE TABLE Course_Faculty (
    Course        VARCHAR2(20) PRIMARY KEY,
    Faculty       VARCHAR2(30),
    FacultyPhone  VARCHAR2(15),
    Dept          VARCHAR2(10),
    HOD           VARCHAR2(30)
);

-- Step 9: Define a database object
CREATE TABLE Enrollment (
    SID     VARCHAR2(10),
    Course  VARCHAR2(20),
    PRIMARY KEY (SID, Course),
    FOREIGN KEY (SID) REFERENCES Student(SID),
    FOREIGN KEY (Course) REFERENCES Course_Faculty(Course)
);

-- Step 10: Insert sample data
INSERT INTO Student VALUES ('S1','Arun');

-- Step 11: Insert sample data
INSERT INTO Student VALUES ('S2','Bala');

-- Step 12: Insert sample data
INSERT INTO Course_Faculty VALUES ('DBMS','Ravi','9990001','CSE','Dr. Sharma');

-- Step 13: Insert sample data
INSERT INTO Course_Faculty VALUES ('OS','Meena','9990002','CSE','Dr. Sharma');

-- Step 14: Insert sample data
INSERT INTO Enrollment VALUES ('S1','DBMS');

-- Step 15: Insert sample data
INSERT INTO Enrollment VALUES ('S1','OS');

-- Step 16: Insert sample data
INSERT INTO Enrollment VALUES ('S2','DBMS');

-- Step 17: Commit the transaction
COMMIT;

-- Step 18: Define a database object
CREATE TABLE Department (
    Dept  VARCHAR2(10) PRIMARY KEY,
    HOD   VARCHAR2(30)
);

-- Step 19: Define a database object
CREATE TABLE Faculty_Dept (
    Faculty       VARCHAR2(30) PRIMARY KEY,
    FacultyPhone  VARCHAR2(15),
    Dept          VARCHAR2(10),
    FOREIGN KEY (Dept) REFERENCES Department(Dept)
);

-- Step 20: Define a database object
CREATE TABLE Course_3NF (
    Course   VARCHAR2(20) PRIMARY KEY,
    Faculty  VARCHAR2(30),
    FOREIGN KEY (Faculty) REFERENCES Faculty_Dept(Faculty)
);

-- Step 21: Insert sample data
INSERT INTO Department VALUES ('CSE','Dr. Sharma');

-- Step 22: Insert sample data
INSERT INTO Faculty_Dept VALUES ('Ravi','9990001','CSE');

-- Step 23: Insert sample data
INSERT INTO Faculty_Dept VALUES ('Meena','9990002','CSE');

-- Step 24: Insert sample data
INSERT INTO Course_3NF VALUES ('DBMS','Ravi');

-- Step 25: Insert sample data
INSERT INTO Course_3NF VALUES ('OS','Meena');

-- Step 26: Commit the transaction
COMMIT;

-- Step 27: Retrieve records or calculate a summary
SELECT c.Course, f.Faculty, f.FacultyPhone, f.Dept, d.HOD
FROM Course_3NF c
JOIN Faculty_Dept f ON c.Faculty = f.Faculty
JOIN Department d ON f.Dept = d.Dept;

-- Step 28: Define a database object
CREATE TABLE Faculty_Course (
    Faculty  VARCHAR2(30),
    Course   VARCHAR2(20),
    PRIMARY KEY (Faculty, Course)
);

-- Step 29: Define a database object
CREATE TABLE Faculty_Language (
    Faculty   VARCHAR2(30),
    Language  VARCHAR2(20),
    PRIMARY KEY (Faculty, Language)
);

-- Step 30: Insert sample data
INSERT INTO Faculty_Course VALUES ('Ravi','DBMS');

-- Step 31: Insert sample data
INSERT INTO Faculty_Course VALUES ('Ravi','OS');

-- Step 32: Insert sample data
INSERT INTO Faculty_Language VALUES ('Ravi','English');

-- Step 33: Insert sample data
INSERT INTO Faculty_Language VALUES ('Ravi','Hindi');

-- Step 34: Commit the transaction
COMMIT;

-- Step 35: Define a database object
CREATE TABLE Faculty_Course_5NF (
    Faculty  VARCHAR2(30),
    Course   VARCHAR2(20),
    PRIMARY KEY (Faculty, Course)
);

-- Step 36: Define a database object
CREATE TABLE Course_Textbook_5NF (
    Course     VARCHAR2(20),
    Textbook   VARCHAR2(30),
    PRIMARY KEY (Course, Textbook)
);

-- Step 37: Define a database object
CREATE TABLE Faculty_Textbook_5NF (
    Faculty    VARCHAR2(30),
    Textbook   VARCHAR2(30),
    PRIMARY KEY (Faculty, Textbook)
);

-- Step 38: Insert sample data
INSERT INTO Faculty_Course_5NF VALUES ('Ravi','DBMS');

-- Step 39: Insert sample data
INSERT INTO Faculty_Course_5NF VALUES ('Meena','OS');

-- Step 40: Insert sample data
INSERT INTO Course_Textbook_5NF VALUES ('DBMS','Korth');

-- Step 41: Insert sample data
INSERT INTO Course_Textbook_5NF VALUES ('DBMS','Navathe');

-- Step 42: Insert sample data
INSERT INTO Course_Textbook_5NF VALUES ('OS','Silberschatz');

-- Step 43: Insert sample data
INSERT INTO Faculty_Textbook_5NF VALUES ('Ravi','Korth');

-- Step 44: Insert sample data
INSERT INTO Faculty_Textbook_5NF VALUES ('Ravi','Navathe');

-- Step 45: Insert sample data
INSERT INTO Faculty_Textbook_5NF VALUES ('Meena','Silberschatz');

-- Step 46: Commit the transaction
COMMIT;

-- Step 47: Retrieve records or calculate a summary
SELECT fc.Faculty, fc.Course, ct.Textbook
FROM Faculty_Course_5NF fc
JOIN Course_Textbook_5NF ct ON fc.Course = ct.Course
JOIN Faculty_Textbook_5NF ft ON fc.Faculty = ft.Faculty AND ct.Textbook = ft.Textbook;

-- Step 48: Retrieve records or calculate a summary
SELECT table_name FROM user_tables;

-- Step 49: Execute the SQL command
DESC Faculty_Dept;

-- Step 50: Retrieve records or calculate a summary
SELECT constraint_name, constraint_type, table_name
FROM user_constraints
WHERE table_name IN ('STUDENT','COURSE_3NF','FACULTY_DEPT','DEPARTMENT');

-- Step 51: Retrieve records or calculate a summary
SELECT a.table_name, a.column_name, c.constraint_type
FROM user_cons_columns a
JOIN user_constraints c ON a.constraint_name = c.constraint_name
WHERE c.constraint_type IN ('P','R')
ORDER BY a.table_name;

-- RESULT
-- The normalized tables represent the supplied sample relationships. The 5NF decomposition depends on the assumed join dependency; matching sample rows alone does not prove that dependency.

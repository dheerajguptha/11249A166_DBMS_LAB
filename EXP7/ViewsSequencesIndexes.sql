-- Experiment 7 — Views, sequences, indexes and savepoints
--
-- AIM
-- To work with Oracle views, sequences, indexes, and transaction savepoints.


-- Step 1: Define a database object
CREATE TABLE STUDENT (
    ROLLNO NUMBER(5) PRIMARY KEY,
    NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    MARKS NUMBER(3)
);

-- Step 2: Insert sample data
INSERT INTO STUDENT VALUES (101, 'ARUN', 'CSE', 85);

-- Step 3: Insert sample data
INSERT INTO STUDENT VALUES (102, 'PRIYA', 'ECE', 90);

-- Step 4: Insert sample data
INSERT INTO STUDENT VALUES (103, 'KUMAR', 'CSE', 78);

-- Step 5: Insert sample data
INSERT INTO STUDENT VALUES (104, 'DIVYA', 'IT', 88);

-- Step 6: Insert sample data
INSERT INTO STUDENT VALUES (105, 'RAHUL', 'CSE', 92);

-- Step 7: Commit the transaction
COMMIT;

-- Step 8: Define a database object
CREATE VIEW CSE_STUDENTS AS
SELECT ROLLNO, NAME, MARKS
FROM STUDENT
WHERE DEPARTMENT = 'CSE';

-- Step 9: Retrieve records or calculate a summary
SELECT * FROM CSE_STUDENTS;

-- Step 10: Execute the SQL command
DROP VIEW CSE_STUDENTS;

-- Step 11: Define a database object
CREATE SEQUENCE STUDENT_SEQ
START WITH 106
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Step 12: Retrieve records or calculate a summary
SELECT STUDENT_SEQ.NEXTVAL FROM DUAL;

-- Step 13: Retrieve records or calculate a summary
SELECT STUDENT_SEQ.NEXTVAL FROM DUAL;

-- Step 14: Insert sample data
INSERT INTO STUDENT
VALUES (STUDENT_SEQ.NEXTVAL, 'SNEHA', 'CSE', 89);

-- Step 15: Commit the transaction
COMMIT;

-- Step 16: Retrieve records or calculate a summary
SELECT * FROM STUDENT;

-- Step 17: Execute the SQL command
DROP SEQUENCE STUDENT_SEQ;

-- Step 18: Define a database object
CREATE INDEX IDX_STUDENT_NAME
ON STUDENT(NAME);

-- Step 19: Retrieve records or calculate a summary
SELECT * FROM STUDENT WHERE NAME = 'ARUN';

-- Step 20: Execute the SQL command
DROP INDEX IDX_STUDENT_NAME;

-- Step 21: Insert sample data
INSERT INTO STUDENT VALUES (106, 'MOHAN', 'IT', 80);

-- Step 22: Mark a transaction savepoint
SAVEPOINT SP1;

-- Step 23: Insert sample data
INSERT INTO STUDENT VALUES (107, 'LATHA', 'ECE', 87);

-- Step 24: Retrieve records or calculate a summary
SELECT * FROM STUDENT;

-- Step 25: Roll back transaction changes
ROLLBACK TO SP1;

-- Step 26: Commit the transaction
COMMIT;

-- Step 27: Retrieve records or calculate a summary
SELECT * FROM STUDENT ORDER BY ROLLNO;

-- RESULT
-- The examples illustrate view-based retrieval, sequence generation, index creation, and rollback to a savepoint.

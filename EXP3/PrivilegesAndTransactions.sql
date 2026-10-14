-- Experiment 3 — DCL and TCL commands
--
-- AIM
-- To demonstrate table privileges and transaction control with GRANT, REVOKE, COMMIT, ROLLBACK, and SAVEPOINT.

-- Step 1: Define a database object
CREATE DATABASE IF NOT EXISTS LAB_EXPERIMENT_3;

-- Step 2: Execute the SQL command
USE LAB_EXPERIMENT_3;

-- Step 3: Define a database object
CREATE TABLE Employee(
EmpID INT PRIMARY KEY,
Name VARCHAR(30),
Department VARCHAR(20),
Salary DECIMAL(10,2));

-- Step 4: Insert sample data
INSERT INTO Employee VALUES
(101,'Arun','HR',35000),
(102,'Priya','IT',45000),
(103,'Kavin','Finance',50000),
(104,'Divya','IT',55000);

-- Step 5: Grant access privileges
GRANT SELECT ON Employee TO user1;

-- Step 6: Grant access privileges
GRANT SELECT, INSERT ON Employee TO user1;

-- Step 7: Revoke access privileges
REVOKE INSERT ON Employee FROM user1;

-- Step 8: Revoke access privileges
REVOKE ALL ON Employee FROM user1;

-- Step 9: Execute the SQL command
SET AUTOCOMMIT=0;

-- Step 10: Update matching records
UPDATE Employee SET Salary=48000 WHERE EmpID=102;

-- Step 11: Mark a transaction savepoint
SAVEPOINT SP1;

-- Step 12: Update matching records
UPDATE Employee SET Salary=60000 WHERE EmpID=104;

-- Step 13: Retrieve records or calculate a summary
SELECT * FROM Employee;

-- Step 14: Roll back transaction changes
ROLLBACK TO SP1;

-- Step 15: Commit the transaction
COMMIT;

-- Step 16: Delete matching records
DELETE FROM Employee WHERE EmpID=101;

-- Step 17: Roll back transaction changes
ROLLBACK;

-- Step 18: Retrieve records or calculate a summary
SELECT * FROM Employee;

-- Step 19: Define a database object
CREATE TABLE Book(
 BookID INT PRIMARY KEY,
 Title VARCHAR(50),
 Author VARCHAR(40),
 Category VARCHAR(30),
 Price DECIMAL(8,2)
);

-- Step 20: Insert sample data
INSERT INTO Book VALUES
(101,'Database System','Korth','Database',550),
(102,'C Programming','Dennis Ritchie','Programming',450),
(103,'Java Programming','Herbert Schildt','Programming',650),
(104,'Python Basics','Mark Lutz','Programming',700),
(105,'Computer Networks','Andrew Tanenbaum','Networking',600);

-- Step 21: Commit the transaction
COMMIT;

-- Step 22: Grant access privileges
GRANT SELECT ON Book TO student1;

-- Step 23: Grant access privileges
GRANT INSERT, UPDATE ON Book TO student1;

-- Step 24: Revoke access privileges
REVOKE UPDATE ON Book FROM student1;

-- Step 25: Revoke access privileges
REVOKE ALL ON Book FROM student1;

-- Step 26: Execute the SQL command
SET AUTOCOMMIT=0;

-- Step 27: Update matching records
UPDATE Book SET Price=Price*1.10 WHERE Category='Programming';

-- Step 28: Mark a transaction savepoint
SAVEPOINT SP_Book;

-- Step 29: Update matching records
UPDATE Book SET Price=800 WHERE BookID=104;

-- Step 30: Roll back transaction changes
ROLLBACK TO SP_Book;

-- Step 31: Delete matching records
DELETE FROM Book WHERE BookID=105;

-- Step 32: Roll back transaction changes
ROLLBACK;

-- Step 33: Commit the transaction
COMMIT;

-- Step 34: Retrieve records or calculate a summary
SELECT * FROM Book;

-- RESULT
-- The examples illustrate privilege changes and the effects of committing or rolling back transactions.

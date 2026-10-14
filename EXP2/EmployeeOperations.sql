-- Experiment 2 — Insertion, deletion, updating, altering and viewing records
--
-- AIM
-- To maintain employee data using conditional SELECT, INSERT, UPDATE, DELETE, and ALTER TABLE statements.

-- Step 1: Define a database object
CREATE DATABASE IF NOT EXISTS LAB_EXPERIMENT_2;

-- Step 2: Execute the SQL command
USE LAB_EXPERIMENT_2;

-- Step 3: Define a database object
CREATE TABLE Employee (EmpID INT PRIMARY KEY, Name VARCHAR(50), Department VARCHAR(30), Salary DECIMAL(10,2), JoinDate DATE );

-- Step 4: Insert sample data
INSERT INTO Employee (EmpID, Name, Department, Salary, JoinDate) VALUES (101, 'Anjali Sharma', 'IT', 45000.00, '2023-06-15');

-- Step 5: Insert sample data
INSERT INTO Employee (EmpID, Name, Department, Salary, JoinDate) VALUES (102, 'Ravi Kumar', 'HR', 38000.00, '2022-03-10'), (103, 'Priya Singh', 'Finance', 52000.00, '2021-11-01'), (104, 'Karthik Iyer', 'IT', 47000.00, '2023-01-20');

-- Step 6: Retrieve records or calculate a summary
SELECT * FROM Employee;

-- Step 7: Retrieve records or calculate a summary
SELECT * FROM Employee WHERE Department = 'IT';

-- Step 8: Retrieve records or calculate a summary
SELECT Name, Salary FROM Employee
WHERE Salary > 40000;

-- Step 9: Retrieve records or calculate a summary
SELECT * FROM Employee WHERE Department = 'IT' AND Salary >= 45000;

-- Step 10: Retrieve records or calculate a summary
SELECT * FROM Employee WHERE Salary BETWEEN 40000 AND 50000;

-- Step 11: Retrieve records or calculate a summary
SELECT * FROM Employee WHERE Department IN ('IT', 'Finance');

-- Step 12: Retrieve records or calculate a summary
SELECT * FROM Employee WHERE Name LIKE 'A%';

-- Step 13: Retrieve records or calculate a summary
SELECT * FROM Employee WHERE Department = 'IT' ORDER BY Salary DESC;

-- Step 14: Update matching records
UPDATE Employee
SET Salary = 48000.00
WHERE EmpID = 101;

-- Step 15: Update matching records
UPDATE Employee
SET Salary = Salary + 2000, Department = 'Systems'
WHERE Department = 'IT';

-- Step 16: Delete matching records
DELETE FROM Employee
WHERE EmpID = 102;

-- Step 17: Delete matching records
DELETE FROM Employee
WHERE Salary < 40000;

-- Step 18: Delete matching records
DELETE FROM Employee;

-- Step 19: Execute the SQL command
TRUNCATE TABLE Employee;

-- Step 20: Change an object definition
ALTER TABLE Employee ADD Email VARCHAR(100);

-- Step 21: Change an object definition
ALTER TABLE Employee
MODIFY COLUMN Name VARCHAR(80);

-- Step 22: Change an object definition
ALTER TABLE Employee RENAME COLUMN Email TO ContactEmail;

-- Step 23: Change an object definition
ALTER TABLE Employee DROP COLUMN ContactEmail;

-- Step 24: Change an object definition
ALTER TABLE Employee RENAME TO Staff;

-- RESULT
-- Employee records can be inserted, selected, changed, and deleted, and the table definition can be altered.

-- Experiment 6 — Aggregate functions, GROUP BY and HAVING
--
-- AIM
-- To calculate employee summaries and select groups using aggregate functions, GROUP BY, and HAVING.

-- Step 1: Define a database object
CREATE DATABASE IF NOT EXISTS LAB_EXPERIMENT_6;

-- Step 2: Execute the SQL command
USE LAB_EXPERIMENT_6;

-- Step 3: Define a database object
CREATE TABLE Employee (
    EmpID       INT PRIMARY KEY,
    EmpName     VARCHAR(50),
    Department  VARCHAR(30),
    Designation VARCHAR(30),
    Salary      DECIMAL(10,2),
    City        VARCHAR(30),
    DOJ         DATE
);

-- Step 4: Insert sample data
INSERT INTO Employee VALUES
(1, 'Aarav Sharma',   'IT',      'Developer',      55000, 'Chennai',   '2021-03-15'),
(2, 'Priya Nair',     'IT',      'Team Lead',       75000, 'Chennai',   '2019-06-10'),
(3, 'Rohit Verma',    'HR',      'Executive',       35000, 'Bangalore', '2022-01-20'),
(4, 'Sneha Iyer',     'HR',      'Manager',         65000, 'Bangalore', '2018-11-05'),
(5, 'Karthik Raj',    'Finance', 'Analyst',         45000, 'Chennai',   '2020-07-01'),
(6, 'Divya Menon',    'Finance', 'Manager',         70000, 'Mumbai',    '2017-09-25'),
(7, 'Arjun Das',      'IT',      'Developer',       58000, 'Mumbai',    '2021-12-12'),
(8, 'Fatima Khan',    'HR',      'Executive',       36000, 'Chennai',   '2023-02-18'),
(9, 'Vikram Singh',   'Finance', 'Analyst',         47000, 'Bangalore', '2022-05-30'),
(10,'Meera Pillai',   'IT',      'Developer',       59000, 'Bangalore', '2020-08-14');

-- Step 5: Retrieve records or calculate a summary
SELECT COUNT(*) AS TotalEmployees FROM Employee;

-- Step 6: Retrieve records or calculate a summary
SELECT SUM(Salary) AS TotalSalary FROM Employee;

-- Step 7: Retrieve records or calculate a summary
SELECT AVG(Salary) AS AverageSalary FROM Employee;

-- Step 8: Retrieve records or calculate a summary
SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary FROM Employee;

-- Step 9: Retrieve records or calculate a summary
SELECT Department, COUNT(*) AS EmpCount
FROM Employee
GROUP BY Department;

-- Step 10: Retrieve records or calculate a summary
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY Department
ORDER BY AvgSalary DESC;

-- Step 11: Retrieve records or calculate a summary
SELECT Department, COUNT(*) AS EmpCount
FROM Employee
GROUP BY Department
HAVING COUNT(*) > 3;

-- Step 12: Retrieve records or calculate a summary
SELECT Department, AVG(Salary) AS AvgSalary
FROM Employee
GROUP BY Department
HAVING AVG(Salary) > 50000;

-- Step 13: Retrieve records or calculate a summary
SELECT Department, City, COUNT(*) AS EmpCount
FROM Employee
WHERE Salary > 40000
GROUP BY Department, City
HAVING COUNT(*) >= 2
ORDER BY Department;

-- Step 14: Retrieve records or calculate a summary
SELECT City, SUM(Salary) AS TotalSalary
FROM Employee
GROUP BY City
HAVING SUM(Salary) > 100000;

-- RESULT
-- The queries produce totals, averages, extremes, and grouped summaries from the employee data.

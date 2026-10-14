-- Experiment 10 — PL/SQL programming
--
-- AIM
-- To practice Oracle PL/SQL control flow, exception handling, procedures, functions, triggers, and cursors.

-- Step 1: Execute the SQL command
SET SERVEROUTPUT ON

-- Step 2: Define a database object
CREATE TABLE dept (
  deptno NUMBER(2) PRIMARY KEY,
  dname  VARCHAR2(20)
);

-- Step 3: Define a database object
CREATE TABLE emp (
  empno  NUMBER(4) PRIMARY KEY,
  ename  VARCHAR2(20) NOT NULL,
  job    VARCHAR2(15),
  sal    NUMBER(8,2),
  deptno NUMBER(2) REFERENCES dept(deptno)
);

-- Step 4: Define a database object
CREATE TABLE emp_audit (
  audit_id NUMBER GENERATED ALWAYS AS IDENTITY,
  empno    NUMBER,
  action   VARCHAR2(10),
  old_sal  NUMBER,
  new_sal  NUMBER,
  changed_on DATE DEFAULT SYSDATE
);

-- Step 5: Insert sample data
INSERT INTO dept VALUES (10, 'ACCOUNTING');

-- Step 6: Insert sample data
INSERT INTO dept VALUES (20, 'RESEARCH');

-- Step 7: Insert sample data
INSERT INTO dept VALUES (30, 'SALES');

-- Step 8: Insert sample data
INSERT INTO emp VALUES (101, 'SMITH',  'CLERK',    8000, 20);

-- Step 9: Insert sample data
INSERT INTO emp VALUES (102, 'ALLEN',  'SALESMAN', 15000, 30);

-- Step 10: Insert sample data
INSERT INTO emp VALUES (103, 'WARD',   'SALESMAN', 12500, 30);

-- Step 11: Insert sample data
INSERT INTO emp VALUES (104, 'JONES',  'MANAGER',  29750, 20);

-- Step 12: Insert sample data
INSERT INTO emp VALUES (105, 'KING',   'PRESIDENT', 50000, 10);

-- Step 13: Commit the transaction
COMMIT;

-- Step 14: Execute a PL/SQL block
DECLARE
  v_sal  emp.sal%TYPE;
  v_name emp.ename%TYPE;
BEGIN
  SELECT ename, sal INTO v_name, v_sal FROM emp WHERE empno = 102;

  IF v_sal >= 30000 THEN
    DBMS_OUTPUT.PUT_LINE(v_name || ': Grade A');
  ELSIF v_sal >= 10000 THEN
    DBMS_OUTPUT.PUT_LINE(v_name || ': Grade B');
  ELSE
    DBMS_OUTPUT.PUT_LINE(v_name || ': Grade C');
  END IF;
END;
/

-- Step 15: Execute a PL/SQL block
DECLARE
  v_job   emp.job%TYPE;
  v_sal   emp.sal%TYPE;
  v_bonus NUMBER;
BEGIN
  SELECT job, sal INTO v_job, v_sal FROM emp WHERE empno = 103;

  v_bonus := CASE v_job
               WHEN 'SALESMAN'  THEN v_sal * 0.10
               WHEN 'MANAGER'   THEN v_sal * 0.15
               ELSE v_sal * 0.05
             END;

  DBMS_OUTPUT.PUT_LINE('Bonus: ' || v_bonus);
END;
/

-- Step 16: Execute a PL/SQL block
DECLARE
  v_name emp.ename%TYPE;
BEGIN
  SELECT ename INTO v_name FROM emp WHERE empno = 999;
  DBMS_OUTPUT.PUT_LINE(v_name);
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No employee with that number.');
  WHEN TOO_MANY_ROWS THEN
    DBMS_OUTPUT.PUT_LINE('More than one row returned.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error ' || SQLCODE || ': ' || SQLERRM);
END;
/

-- Step 17: Execute a PL/SQL block
DECLARE
  e_low_salary EXCEPTION;
  v_sal emp.sal%TYPE;
BEGIN
  SELECT sal INTO v_sal FROM emp WHERE empno = 101;

  IF v_sal < 10000 THEN
    RAISE e_low_salary;
  END IF;
EXCEPTION
  WHEN e_low_salary THEN
    DBMS_OUTPUT.PUT_LINE('Salary below minimum: ' || v_sal);
END;
/

-- Step 18: Execute a PL/SQL block
BEGIN
  INSERT INTO emp VALUES (101, 'DUP', 'CLERK', 5000, 10);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    RAISE_APPLICATION_ERROR(-20001, 'Employee number already exists');
END;
/

-- Step 19: Define a database object
CREATE OR REPLACE PROCEDURE raise_salary (
  p_empno   IN emp.empno%TYPE,
  p_percent IN NUMBER
) IS
BEGIN
  UPDATE emp
     SET sal = sal + sal * p_percent / 100
   WHERE empno = p_empno;

  IF SQL%NOTFOUND THEN
    RAISE_APPLICATION_ERROR(-20002, 'Employee not found');
  END IF;
  COMMIT;
END raise_salary;
/

-- Step 20: Execute the SQL command
EXEC raise_salary(101, 10);

-- Step 21: Define a database object
CREATE OR REPLACE PROCEDURE get_emp_info (
  p_empno IN  emp.empno%TYPE,
  p_name  OUT emp.ename%TYPE,
  p_sal   OUT emp.sal%TYPE
) IS
BEGIN
  SELECT ename, sal INTO p_name, p_sal FROM emp WHERE empno = p_empno;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    p_name := NULL;
    p_sal  := NULL;
END;
/

-- Step 22: Execute a PL/SQL block
DECLARE
  v_name emp.ename%TYPE;
  v_sal  emp.sal%TYPE;
BEGIN
  get_emp_info(104, v_name, v_sal);
  DBMS_OUTPUT.PUT_LINE(v_name || ' earns ' || v_sal);
END;
/

-- Step 23: Define a database object
CREATE OR REPLACE PROCEDURE square_it (p_num IN OUT NUMBER) IS
BEGIN
  p_num := p_num * p_num;
END;
/

-- Step 24: Execute a PL/SQL block
DECLARE n NUMBER := 7;
BEGIN
  square_it(n);
  DBMS_OUTPUT.PUT_LINE('Result: ' || n);
END;
/

-- Step 25: Define a database object
CREATE OR REPLACE FUNCTION annual_sal (p_empno IN emp.empno%TYPE)
RETURN NUMBER IS
  v_sal emp.sal%TYPE;
BEGIN
  SELECT sal INTO v_sal FROM emp WHERE empno = p_empno;
  RETURN v_sal * 12;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;
/

-- Step 26: Execute a PL/SQL block
BEGIN
  DBMS_OUTPUT.PUT_LINE(annual_sal(102));
END;
/

-- Step 27: Retrieve records or calculate a summary
SELECT ename, annual_sal(empno) AS yearly FROM emp;

-- Step 28: Define a database object
CREATE OR REPLACE TRIGGER trg_check_sal
BEFORE INSERT OR UPDATE OF sal ON emp
FOR EACH ROW
BEGIN
  IF :NEW.sal < 0 THEN
    RAISE_APPLICATION_ERROR(-20010, 'Salary cannot be negative');
  END IF;
  :NEW.ename := UPPER(:NEW.ename);
END;
/

-- Step 29: Update matching records
UPDATE emp SET sal = -100 WHERE empno = 101;

-- Step 30: Define a database object
CREATE OR REPLACE TRIGGER trg_emp_audit
AFTER INSERT OR UPDATE OR DELETE ON emp
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO emp_audit(empno, action, new_sal)
    VALUES (:NEW.empno, 'INSERT', :NEW.sal);
  ELSIF UPDATING THEN
    INSERT INTO emp_audit(empno, action, old_sal, new_sal)
    VALUES (:OLD.empno, 'UPDATE', :OLD.sal, :NEW.sal);
  ELSIF DELETING THEN
    INSERT INTO emp_audit(empno, action, old_sal)
    VALUES (:OLD.empno, 'DELETE', :OLD.sal);
  END IF;
END;
/

-- Step 31: Update matching records
UPDATE emp SET sal = 9000 WHERE empno = 101;

-- Step 32: Delete matching records
DELETE FROM emp WHERE empno = 103;

-- Step 33: Retrieve records or calculate a summary
SELECT * FROM emp_audit;

-- Step 34: Roll back transaction changes
ROLLBACK;

-- Step 35: Define a database object
CREATE OR REPLACE TRIGGER trg_no_weekend
BEFORE INSERT OR UPDATE OR DELETE ON emp
BEGIN
  IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') IN ('SAT', 'SUN') THEN
    RAISE_APPLICATION_ERROR(-20011, 'Changes not allowed on weekends');
  END IF;
END;
/

-- Step 36: Change an object definition
ALTER TRIGGER trg_no_weekend DISABLE;

-- Step 37: Execute a PL/SQL block
BEGIN
  UPDATE emp SET sal = sal + 500 WHERE deptno = 30;
  DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' row(s) updated');
  ROLLBACK;
END;
/

-- Step 38: Execute a PL/SQL block
DECLARE
  CURSOR c_emp IS SELECT ename, sal FROM emp ORDER BY sal DESC;
  v_name emp.ename%TYPE;
  v_sal  emp.sal%TYPE;
BEGIN
  OPEN c_emp;
  LOOP
    FETCH c_emp INTO v_name, v_sal;
    EXIT WHEN c_emp%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(RPAD(v_name, 10) || v_sal);
  END LOOP;
  CLOSE c_emp;
END;
/

-- RESULT
-- The examples demonstrate the behavior of PL/SQL blocks and stored database objects.

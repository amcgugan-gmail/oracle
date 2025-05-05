-- Oracle 23c Feature Showcase
-- Author: OpenAI ChatGPT
-- GitHub-ready script demonstrating new SQL & PL/SQL features in Oracle Database 23ai
-- -------------------------------------------------------------------------------

-- 1. BOOLEAN Data Type in SQL
-- Demonstrates native BOOLEAN datatype support in Oracle 23c
CREATE TABLE flags (
  id NUMBER PRIMARY KEY,
  is_active BOOLEAN
);

INSERT INTO flags VALUES (1, TRUE);
INSERT INTO flags VALUES (2, FALSE);
SELECT * FROM flags WHERE is_active;

-- 2. CREATE / DROP TABLE IF [NOT] EXISTS
-- Conditionally create or drop a table, useful for CI/CD or DevOps pipelines
CREATE TABLE IF NOT EXISTS users (
  id NUMBER PRIMARY KEY,
  name VARCHAR2(100)
);

DROP TABLE IF EXISTS users;

-- 3. SELECT without FROM clause
-- Simplified scalar queries, useful in scripting and testing
SELECT 'Hello from 23c!' AS message;

-- 4. GROUP BY Column Alias
-- Allows grouping by SELECT alias instead of repeating full expression
SELECT department_id AS dept, COUNT(*) AS cnt
FROM employees
GROUP BY dept;

-- 5. TABLE operator with subquery
-- Use TABLE operator directly on subqueries (previously required pipelined functions)
-- Uncomment and adjust as needed
-- SELECT * FROM TABLE(SELECT embedded_collection FROM some_table);

-- 6. VECTOR datatype and similarity search
-- AI-native feature for vector similarity (cosine, Euclidean, inner product)
CREATE TABLE embeddings (
  id NUMBER PRIMARY KEY,
  title VARCHAR2(100),
  content_vector VECTOR(3)
);

-- Insert dummy vector data
INSERT INTO embeddings VALUES (1, 'Doc A', VECTOR '[0.1, 0.2, 0.3]');
INSERT INTO embeddings VALUES (2, 'Doc B', VECTOR '[0.2, 0.3, 0.4]');

-- Perform similarity search using vector distance operator <=>
SELECT *
FROM embeddings
ORDER BY content_vector <=> VECTOR '[0.1, 0.2, 0.3]';

-- 7. Qualified Expression (PL/SQL)
-- Cleaner object type initialization (e.g., SDO_GEOMETRY)
DECLARE
  l_point SDO_GEOMETRY := SDO_GEOMETRY(2001, 8307, SDO_POINT_TYPE(1.0, 2.0, NULL), NULL, NULL);
BEGIN
  DBMS_OUTPUT.PUT_LINE('Point initialized.');
END;
/

-- 8. SQL Macro Function
-- Define reusable SQL fragments via scalar SQL macros
CREATE OR REPLACE FUNCTION filter_dept(p_deptno NUMBER)
RETURN VARCHAR2 SQL_MACRO(SCALAR) IS
BEGIN
  RETURN 'department_id = ' || p_deptno;
END;
/

-- Use SQL macro in query
SELECT * FROM employees WHERE filter_dept(10);

-- 9. OUT Parameters from SQL (PL/SQL)
-- Use OUT parameters directly in SQL expressions (Oracle 23c)
CREATE OR REPLACE PROCEDURE get_bonus(p_empid IN NUMBER, p_bonus OUT NUMBER) IS
BEGIN
  SELECT salary * 0.1 INTO p_bonus FROM employees WHERE employee_id = p_empid;
END;
/

-- Use procedure in SQL (new 23c capability)
SELECT get_bonus(employee_id) AS bonus
FROM employees;


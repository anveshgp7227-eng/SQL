-- Question: What is a table, what operations can we perform on it, and what category do they fall under?

-- A table is a fundamental object in a database that stores data in a structured format.
-- It consists of rows (records) and columns (attributes). Each row represents a single record,
-- and each column represents a specific type of data. For example, in the Sakila database,
-- the 'actor' table stores information about actors with columns like actor_id, first_name, and last_name.

-- Operations on tables fall mainly under **DDL (Data Definition Language)**, because they define or
-- modify the table structure. However, operations that manipulate data inside tables (like INSERT, UPDATE, DELETE)
-- fall under **DML (Data Manipulation Language)**. Querying the table (SELECT) is **DQL (Data Query Language)**.

-- Common table-level operations and examples:

-- 1. CREATE TABLE: Defines a new table and its columns.
CREATE TABLE test_actor (
    actor_id INT PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    last_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. ALTER TABLE: Modifies an existing table's structure, such as adding, deleting, or modifying columns.
ALTER TABLE test_actor
ADD COLUMN middle_name VARCHAR(45);

-- 3. DROP TABLE: Completely removes a table and all its data.
-- DROP TABLE test_actor;

-- 4. TRUNCATE TABLE: Removes all rows from a table but keeps its structure intact.
TRUNCATE TABLE actor;

-- 5. INSERT (DML): Adds new records to a table.
INSERT INTO test_actor (actor_id, first_name, last_name)
VALUES (1, 'Chris', 'Evans');

-- 6. UPDATE (DML): Modifies existing records in a table.
UPDATE test_actor
SET first_name = 'Robert'
WHERE actor_id = 1;

-- 7. DELETE (DML): Removes specific records from a table.
DELETE FROM test_actor
WHERE actor_id = 1;

-- 8. SELECT (DQL): Retrieves data from the table.
SELECT * FROM actor;

-- Summary of categories:
-- Table structure operations: CREATE, ALTER, DROP, TRUNCATE → DDL
-- Data operations inside table: INSERT, UPDATE, DELETE → DML
-- Data retrieval: SELECT → DQL
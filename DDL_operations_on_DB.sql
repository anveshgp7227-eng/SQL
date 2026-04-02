-- Question: How do we create and manage databases in SQL?

-- A database is a structured container for storing all related data for a system.
-- Before creating tables, we must first create a database. All tables, views,
-- and other database objects will reside inside this database.
-- ------------------------------------------------------------------------------------------------------------
-- 1. CREATE DATABASE: Creates a new database. 
--    You can also check if it exists first to avoid errors.
CREATE DATABASE IF NOT EXISTS my_sakila_db;

-- 2. USE DATABASE: Selects a database to work on. 
--    All subsequent operations (like creating tables) will occur in this database.
USE my_sakila_db;

-- 3. DROP DATABASE: Completely deletes a database along with all its tables and data.
--    Use with caution, as it cannot be rolled back.
-- DROP DATABASE my_sakila_db;

-- 4. SHOW DATABASES: Lists all databases available in the server.
SHOW DATABASES;

-- Key points:
-- - You cannot create tables without first creating or selecting a database.
-- - CREATE DATABASE only defines the container, it does not include any tables.
-- - DROP DATABASE removes the entire container and everything inside it.
-- -----------------------------------------------------------------------------------------------------------------------------------------+



-- Question: What category do database-level operations fall under in SQL?

-- Database-level operations involve creating, selecting, and deleting entire databases.
-- These operations primarily affect the **structure** of the database system rather than the data itself.
-- Therefore, they fall under **DDL (Data Definition Language)**, because DDL is used to define,
-- modify, or remove database objects like databases and tables.

-- Examples of database-level DDL operations:

-- 1. CREATE DATABASE: Creates a new database container.
CREATE DATABASE IF NOT EXISTS my_sakila_db;

-- 2. USE DATABASE: Selects an existing database to work on.
USE my_sakila_db;

-- 3. DROP DATABASE: Deletes the entire database and all objects inside it.
-- DROP DATABASE my_sakila_db;

-- 4. SHOW DATABASES: Lists all available databases. (Technically a query, but part of database management)
SHOW DATABASES;
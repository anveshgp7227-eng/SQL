-- Question: What is a Database and a Schema?

-- A Database is a structured collection of data stored electronically
-- in a system that allows easy access, management, and retrieval.
-- It contains multiple tables, views, procedures, and other objects.
-- In simple terms, a database is like a container that holds all the data
-- and related objects for a particular application or system.

-- A Schema is the organizational blueprint of a database. It defines how
-- data is structured within the database, including the tables, columns,
-- data types, indexes, and relationships. A schema helps maintain order
-- and consistency, ensuring that everyone accessing the database understands
-- how data is organized.

-- In MySQL, a database often acts as a schema itself, but in some database
-- systems like PostgreSQL or Oracle, a single database can contain multiple schemas.

-- Example: Viewing schemas (databases) in MySQL

SHOW DATABASES;

-- Example: Viewing tables within the Sakila database (schema)

USE sakila;
SHOW TABLES;

-- Explanation:
-- Here, 'sakila' is the database (or schema) that contains multiple tables
-- like 'actor', 'customer', 'rental', etc. Each table has columns and data
-- types defined in the schema

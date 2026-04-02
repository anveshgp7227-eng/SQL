-- SQL (Structured Query Language) is a standard language used to interact
-- with relational databases. It allows users to store, retrieve, update,
-- and delete data in a structured format.

-- In a relational database like Sakila, data is organized into tables
-- consisting of rows (records) and columns (attributes). SQL acts as the
-- communication layer between the user and the database.

-- Using SQL, we can perform different operations such as:
-- retrieving data (SELECT), inserting new data (INSERT),
-- updating existing data (UPDATE), and deleting data (DELETE).

-- SQL is widely used in data engineering, analytics, and backend systems
-- because it ensures structured data handling and efficient querying.

-- Example: Retrieve all data from the actor table
use sakila;
SELECT *
FROM actor;

-- Here we are using sakila database a commonly used sql database to perform operations 

-- Question: What is the difference between DBMS and RDBMS? What are common interview questions on this topic?

-- A DBMS (Database Management System) is software used to store, manage,
-- and retrieve data in a structured way. It does not necessarily enforce
-- relationships between data. Data in a DBMS can be stored in files or simple
-- tables, and there is less focus on data integrity and constraints.

-- An RDBMS (Relational Database Management System) is an advanced form of DBMS
-- that stores data in multiple related tables. It follows the relational model,
-- where data is organized into tables with rows and columns, and relationships
-- are maintained using keys such as primary keys and foreign keys.

-- The main difference is that DBMS does not support relationships between tables,
-- while RDBMS enforces relationships and ensures data integrity through constraints.
-- RDBMS also follows normalization rules to reduce redundancy and improve consistency.

-- In real-world systems like the Sakila database, tables such as 'customer' and
-- 'rental' are connected using keys, which is a characteristic of an RDBMS.
-- ----------------------------------------------------------------------------------------------------------------------
-- -----------------------------------------------------------------------------------------------------------------------
-- Question: What is a Primary Key and a Foreign Key?

-- A Primary Key is a column (or a combination of columns) in a table
-- that uniquely identifies each row in that table. It ensures that
-- no duplicate or NULL values exist in that column, which helps maintain
-- data integrity. Every table should ideally have a primary key so that
-- each record can be uniquely identified.

-- A Foreign Key is a column in one table that refers to the primary key
-- in another table. It is used to establish a relationship between the
-- two tables. The foreign key ensures that the value in that column
-- matches an existing value in the referenced table, maintaining
-- referential integrity.

-- In simple terms, the primary key uniquely identifies records in its
-- own table, while the foreign key connects one table to another.

-- In the Sakila database, 'customer_id' is a primary key in the customer
-- table, and the same 'customer_id' appears in the rental table as a
-- foreign key, linking rentals to customers.

-- Example: Showing Primary Key and Foreign Key relationship

SELECT c.customer_id, c.first_name, r.rental_id, r.rental_date
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
LIMIT 10;

-- ----------------------------------------------------------------------------------------------------------
-- --------------------------------------------------------------------------------------------------------
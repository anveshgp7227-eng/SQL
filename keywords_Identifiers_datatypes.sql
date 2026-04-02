/*
==============================
SQL Keywords, Identifiers, and Data Types with Examples
==============================

SQL Keywords:
SQL keywords are reserved words in SQL that have a predefined meaning. They are used to perform operations 
like querying, inserting, updating, deleting, or managing database objects. 
Examples include SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, WHERE, JOIN. 
Keywords cannot be used as names for tables or columns unless enclosed in quotes/backticks.
Example:
-- SELECT first_name, last_name FROM actor WHERE actor_id = 1;

Identifiers:
Identifiers are names given to database objects like tables, columns, indexes, views, and schemas.
They must start with a letter, can contain letters, numbers, or underscores, and avoid reserved keywords.
Example:
-- Table name: actor_table
-- Column names: actor_id, first_name, last_name

Data Types:
Data types define the kind of data a column can store, ensuring correct storage and integrity.

1. Numeric Data Types:
-- INT or INTEGER: Whole numbers
-- Example: age INT;
-- DECIMAL(p,s) or NUMERIC(p,s): Fixed-point numbers
-- Example: salary DECIMAL(8,2);
-- FLOAT, REAL, DOUBLE: Approximate numbers
-- Example: rating FLOAT;

2. Character/String Data Types:
-- CHAR(n): Fixed-length string
-- Example: gender CHAR(1);
-- VARCHAR(n): Variable-length string
-- Example: first_name VARCHAR(45);
-- TEXT: Large text data
-- Example: description TEXT;

3. Date and Time Data Types:
-- DATE: Stores date in YYYY-MM-DD
-- Example: birth_date DATE;
-- TIME: Stores time in HH:MM:SS
-- Example: login_time TIME;
-- DATETIME or TIMESTAMP: Stores date and time
-- Example: last_update DATETIME;

4. Boolean Data Types:
-- BOOLEAN or BOOL: Stores TRUE or FALSE
-- Example: is_active BOOLEAN;

Summary:
Keywords define operations, identifiers name objects, and data types ensure data integrity. 
These three together form the foundation of SQL programming.
*/
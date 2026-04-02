
-- ==============================
-- SQL Conversion and Null Handling Functions, and Wildcards
-- ==============================

-- 1. Conversion / CAST / CONVERT
-- -------------------------------
-- These functions are used to **convert data from one type to another**.

-- CAST(expression AS datatype)
-- Example: Convert rental_id (INT) to CHAR
SELECT rental_id, CAST(rental_id AS CHAR) AS rental_id_char
FROM sakila.rental
LIMIT 5;

-- CONVERT(expression, datatype)
-- Example: Convert rental_date (DATETIME) to DATE
SELECT rental_date, CONVERT(rental_date, DATE) AS rental_date_only
FROM sakila.rental
LIMIT 5;

-- Difference:
-- CAST is ANSI SQL standard; CONVERT is MySQL-specific but works similarly.

-- -------------------------------------------------
-- 2. COALESCE / IFNULL / ISNULL
-- -------------------------------
-- These functions are used to **handle NULL values**.

-- COALESCE(expr1, expr2, ...) 
-- Returns the first non-NULL value
SELECT rental_id, return_date, 
       COALESCE(return_date, '9999-12-31 00:00:00') AS return_date_non_null
FROM sakila.rental
LIMIT 5;

-- IFNULL(expr1, expr2) 
-- Returns expr2 if expr1 is NULL
SELECT rental_id, return_date,
       IFNULL(return_date, '9999-12-31 00:00:00') AS return_date_non_null
FROM sakila.rental
LIMIT 5;

-- ISNULL(expr) 
-- Returns 1 if expr is NULL, else 0
SELECT rental_id, return_date,
       ISNULL(return_date) AS is_null_flag
FROM sakila.rental
LIMIT 5;
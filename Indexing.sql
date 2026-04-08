/*Indexing is a technique used to improve the speed of data retrieval in a database.
 An index works like a lookup table that allows the database to find rows quickly without scanning the entire table. 
 Without an index, SQL performs a full table scan, which is slow for large datasets.

Indexes are usually created on columns that are frequently used in WHERE, JOIN, or ORDER BY clauses. 
While indexes improve read performance, they can slightly slow down INSERT, UPDATE, and DELETE operations because the index also needs to be updated.

There are different types of indexes like Primary Index (automatically created for primary keys), Unique Index, 
and Composite Index (multiple columns).*/

-- Create an index on last_name for faster search
CREATE INDEX idx_customer_last_name
ON sakila.customer(last_name);

-- Query using indexed column (faster lookup)
SELECT customer_id, first_name, last_name
FROM sakila.customer
WHERE last_name = 'SMITH';


-- Create a composite index on customer_id and rental_date
CREATE INDEX idx_rental_customer_date
ON sakila.rental(customer_id, rental_date);

-- Query using composite index
SELECT *
FROM sakila.rental
WHERE customer_id = 1
ORDER BY rental_date;
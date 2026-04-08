/*Joins and CTEs are both used to combine and organize data, but they serve different purposes.
 Joins are used to directly combine data from multiple tables in a single query, and they are essential for retrieving related data. 
 However, as queries grow, multiple joins can make the query complex and harder to read.

A CTE (Common Table Expression) does not replace joins but organizes them better.
 It allows you to first define a result set (which may include joins) and then reuse it in the main query. 
 This improves readability and makes debugging easier. 
 In short, joins handle data combination, while CTEs improve structure and clarity of complex queries.*/
 
 -- Abstraction
 -- Abstraction is used to hide complex SQL logic (joins, aggregations, filters) behind a simple object like a view. 
 -- Instead of writing complex queries repeatedly, you define it once and reuse it.
 
 -- Create a view (abstraction)
 use sakila;
-- CREATE OR REPLACE VIEW customer_rental_summary AS
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS total_rentals
FROM sakila.customer c
JOIN sakila.rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- Use the view (simple query, no joins visible)
SELECT * 
FROM customer_rental_summary
WHERE total_rentals > 5;


/*Abstraction ≈ Function concept (hides complexity)
View = like function without parameters
Stored Procedure = closer to real function (can take inputs)
Goal = reusability + simplicity + clean queries*/
-- cardinality 

Question:
What are the different types of relationships in SQL databases, and how are they used?

Explanation:
In SQL, relationships define how tables are connected. There are three main types of relationships:

One-to-One (1:1) – Each row in Table A relates to exactly one row in Table B. Rare in practice; often used for splitting sensitive data.
One-to-Many (1:N) – Each row in Table A can relate to multiple rows in Table B, but each row in Table B belongs to only one row in Table A. This is the most common relationship.
Many-to-Many (M:N) – Rows in Table A can relate to multiple rows in Table B and vice versa. Implemented using a junction table (also called a bridge table).

Understanding these relationships helps in writing correct JOIN queries, enforcing foreign keys, and designing normalized databases.

-- 1. One-to-One: Each customer has one address (simplified, assuming unique address per customer)
SELECT c.customer_id, c.first_name, a.address
FROM sakila.customer c
JOIN sakila.address a ON c.address_id = a.address_id
LIMIT 5;

-- 2. One-to-Many: One customer can have many rentals
SELECT c.customer_id, c.first_name, COUNT(r.rental_id) AS total_rentals
FROM sakila.customer c
JOIN sakila.rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name
ORDER BY total_rentals DESC
LIMIT 5;

-- 3. Many-to-Many: Films and actors (a film can have many actors, an actor can play in many films)
SELECT f.film_id, f.title, a.actor_id, a.first_name, a.last_name
FROM sakila.film f
JOIN sakila.film_actor fa ON f.film_id = fa.film_id
JOIN sakila.actor a ON fa.actor_id = a.actor_id
ORDER BY f.film_id
LIMIT 5;
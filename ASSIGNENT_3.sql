/*1. display all customer details who have made more than 5 payments.
2. Find the names of actors who have acted in more than 10 films.
3. Find the names of customers who never made a payment.
4. List all films whose rental rate is higher than the average rental rate of all films.
5. List the titles of films that were never rented.
6. Display the customers who rented films in the same month as customer with ID 5.
7. Find all staff members who handled a payment greater than the average payment amount.
8. Show the title and rental duration of films whose rental duration is greater than the average.
9. Find all customers who have the same address as customer with ID 1.
10. List all payments that are greater than the average of all payments.*/

-- 1. display all customer details who have made more than 5 payments.

-- using CTE 
WITH count_payment AS (
    SELECT customer_id, COUNT(*) AS count_payment
    FROM sakila.payment
    GROUP BY customer_id
)
SELECT c.customer_id, c.first_name, c.last_name, p.count_payment
FROM sakila.customer as  c
JOIN COUNT_payment as p ON c.customer_id = p.customer_id
WHERE p.count_payment > 5
ORDER BY p.count_payment DESC;
	 
-- 2.2. Find the names of actors who have acted in more than 10 films..alter
-- USING CTE 
 SHOW TABLES;
 SELECT * FROM ACTOR;
 SELECT * FROM FILM_ACTOR;
 
 WITH COUNT_ACTOR AS(
 SELECT ACTOR_ID,COUNT(*) AS COUNT_ACTOR
 FROM FILM_ACTOR
 GROUP BY ACTOR_ID 
 )
 
 SELECT A.ACTOR_ID,A.FIRST_NAME,A.LAST_NAME,F.COUNT_ACTOR
 FROM SAKILA.ACTOR AS A
 JOIN  COUNT_ACTOR  AS F ON A.ACTOR_ID=F.ACTOR_ID
 WHERE F.ACTOR_ID>5
 ORDER BY COUNT_ACTOR DESC;
 
 -- 3. Find the names of customers who never made a payment.

SELECT first_name, last_name, customer_id
FROM sakila.customer
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM sakila.payment
);

-- 4. List all films whose rental rate is higher than the average rental rate of all films.
SHOW TABLES;
SELECT * FROM FILM;

SELECT RENTAL_RATE,TITLE                                
FROM SAKILA.FILM
WHERE RENTAL_RATE > ( SELECT AVG(RENTAL_RATE) FROM SAKILA.FILM);

-- 5. List the titles of films that were never rented.
SELECT title
FROM sakila.film
WHERE film_id NOT IN (
    SELECT i.film_id
    FROM sakila.inventory i
    JOIN sakila.rental r 
        ON i.inventory_id = r.inventory_id
);

-- 6.Display the customers who rented films in the same month as customer with ID 5.
use sakila;
show tables;
SELECT * FROM rental;
select * from customer;
select * from customer_list;
 
SELECT customer_id, first_name, last_name
FROM sakila.customer
WHERE customer_id <> 5
AND customer_id IN (
    SELECT DISTINCT customer_id
    FROM sakila.rental
    WHERE MONTH(rental_date) IN (
        SELECT DISTINCT MONTH(rental_date)
        FROM sakila.rental
        WHERE customer_id = 5
    )
);

-- 7 7. Find all staff members who handled a payment greater than the average payment amount.
SELECT DISTINCT staff_id
FROM sakila.payment
WHERE amount > (
    SELECT AVG(amount)
    FROM sakila.payment
);

-- -- . Find all customers who have the same address as customer with ID 1.

CREATE TEMPORARY TABLE temp_address AS
SELECT address_id
FROM sakila.customer
WHERE customer_id = 1;

SELECT customer_id, first_name, last_name
FROM sakila.customer
WHERE address_id = (
    SELECT address_id FROM temp_address
);

--  List all payments that are greater than the average of all payments

CREATE VIEW high_payments AS
SELECT payment_id, customer_id, staff_id, amount, payment_date
FROM sakila.payment
WHERE amount > (
    SELECT AVG(amount)
    FROM sakila.payment
);

SELECT * FROM high_payments;












   

 
 


    
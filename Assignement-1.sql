use sakila;
show tables;
describe sakila.customer;
select * from customer;

-- query Get all customers whose first name starts with 'J' and who are active.
select first_name,active from sakila.customer
where first_name like 'J%' 
and active=1;

-- Find all films where the title contains the word 'ACTION' or the description contains 'WAR'.
show tables;
select * from film;

SELECT title,description
FROM sakila.film
where title LIKE '%action%' or description like 'war';

--  List all customers whose last name is not 'SMITH' and whose first name ends with 'a'.
select first_name,last_name
from sakila.customer
where last_name not like '%smith%'
 and first_name like '%a'  ;
 
 -- 4. Get all films where the rental rate is greater than 3.0 and the replacement cost is not null.

select rental_rate,replacement_cost
from sakila.film
where rental_rate > 3.0 and replacement_cost <> 0;
  
 -- 5. Count how many customers exist in each store who have active status = 1.
 select * from sakila.customer;
 select count(active)
 from sakila.customer
 where active=1;
 
 -- 6. Show distinct film ratings available in the film table.
 select * from sakila.film;
 select distinct(rating)
 from sakila.film;
 
-- 7. Find the number of films for each rental duration where the average length is more than 100 minutes.
SELECT rental_duration, COUNT(*) AS num_films, AVG(length) AS avg_length
FROM sakila.film	
GROUP BY rental_duration
HAVING AVG(length) > 100;

-- 
-- 8. List payment dates and total amount paid per date, but only include days where more than 100 payments were made.
select * from sakila.payment;

SELECT payment_date, COUNT(*) AS total_payments
FROM sakila.payment
GROUP BY payment_date
HAVING COUNT(*) > 100
ORDER BY payment_date;

-- 9. 9. Find customers whose email address is null or ends with '.org'.
SELECT email
FROM sakila.customer
WHERE email IS NULL
OR email like '%.org';

-- 10. List all films with rating 'PG' or 'G', and order them by rental rate in descending order.
select * from sakila.film;

select rating,rental_rate
from sakila.film
having rating like 'G'  or rating like 'PG'
order by rental_rate desc;

-- 11. Count how many films exist for each length where the film title starts with 'T' and the count is more than 5.
select * from sakila.film;        

SELECT length, COUNT(*) AS total_films
FROM sakila.film
WHERE title LIKE 'T%' or title LIKE 't%'
GROUP BY length
HAVING COUNT(*) > 5;

-- 12. List all actors who have appeared in more than 10 films.

select * from actor;

SELECT actor_id, first_name, last_name
FROM sakila.actor
where actor_id IN(select actor_id from sakila.film_actor
group by actor_id
having count(film_id ) > 10
)
order by actor_id;
-- 13. Find the top 5 films with the highest rental rates and longest lengths combined,
--  ordering by rental rate first and length second.

select * from sakila.film;

SELECT  rental_rate,length
FROM sakila.film
ORDER BY rental_rate DESC,LENGTH DESC
LIMIT 5;

-- 14.14. Show all customers along with the total number of rentals they have made, ordered from most to least rentals.
SHOW TABLES;


SELECT FIRST_NAME,LAST_NAME,CUSTOMER_ID,
(
SELECT COUNT(*) FROM SAKILA.RENTAL 
WHERE RENTAL.CUSTOMER_id=CUSTOMER.CUSTOMER_id
) AS Total_rentals

FROM sakila.customer AS customer
ORDER BY total_rentals DESC;

-- 15.15. List the film titles that have never been rented.

SELECT title
FROM sakila.film AS f
WHERE NOT EXISTS (
    SELECT 1
    FROM sakila.inventory AS i
    JOIN sakila.rental AS r
      ON i.inventory_id = r.inventory_id
    WHERE i.film_id = f.film_id
)
ORDER BY title;



/* SQL JOIN QUESTIONS 

1. List all customers along with the films they have rented.

2. List all customers and show their rental count, including those who haven't rented any films.

3. Show all films along with their category. Include films that don't have a category assigned.

4. Show all customers and staff emails from both customer and staff tables using a full outer join (simulate using LEFT + RIGHT + UNION).

5. Find all actors who acted in the film "ACADEMY DINOSAUR".

6. List all stores and the total number of staff members working in each store, even if a store has no staff.

7. List the customers who have rented films more than 5 times. Include their name and total rental count. */

-- 1. List all customers along with the films they have rented.

select c.customer_id,c.first_name,c.last_name, r.rental_id,f.film_id,f.title
from sakila.customer as c 
join sakila.rental as r  on c.customer_id= r.customer_id   -- we are joining rental columns that mastches customer id in customer table
JOIN sakila.inventory i ON r.inventory_id = i.inventory_id    -- we are joiing inventory coloumns that matches inventiry id in rental table 
JOIN sakila.film f ON i.film_id = f.film_id -- here we are joining film coulms that have same id in inventory table and film table 
ORDER BY c.customer_id, r.rental_date;

-- List all customers and show their rental count, including those who haven't rented any films.

select c.customer_id,c.first_name,c.last_name,count(r.rental_id) as total_count
from  sakila.customer as c
left join sakila.rental as r 
		on c.customer_id=r.customer_id
group by c.customer_id,c.first_name,c.last_name
ORDER BY total_count desc, c.customer_id asc;

-- 3. Show all films along with their category. Include films that don't have a category assigned.
select f.film_id,f.title,c.name as category
from sakila.film as f
 left join sakila.film_category as fc on f.film_id=fc.film_id
 left join sakila.category as c on fc.category_id=c.category_id;

-- Q4) Show all customer and staff emails from both table using a FULL OUTER JOIN simulation (LEFT + RIGHT + UNION).
  SELECT c.email AS customer_email, s.email AS staff_email
  FROM sakila.customer c
  LEFT JOIN sakila.staff s ON c.email = s.email

  UNION


SELECT c.email AS customer_email, s.email AS staff_email
FROM sakila.customer c
RIGHT JOIN sakila.staff s ON c.email = s.email
ORDER BY staff_email DESC;

-- Q5) Find all actors who acted in the film "ACADEMY DINOSAUR".
SELECT a.actor_id, a.first_name, a.last_name
FROM sakila.film f
JOIN sakila.film_actor fa ON f.film_id = fa.film_id
JOIN sakila.actor a ON fa.actor_id = a.actor_id
WHERE f.title = 'ACADEMY DINOSAUR'
ORDER BY a.last_name, a.first_name;

-- Q6) List all stores and the total number of staff members working in each store, even if a store has no staff.
SELECT
  s.store_id,
  COUNT(st.staff_id) AS staff_count
FROM sakila.store s
LEFT JOIN sakila.staff st
  ON s.store_id = st.store_id
GROUP BY s.store_id
ORDER BY s.store_id;

-- Q7) List the customers who have rented films more than 5 times. Include their name and total rental count.
  SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  COUNT(r.rental_id) AS total_rentals
FROM sakila.customer c
JOIN sakila.rental r
  ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(r.rental_id) > 5
ORDER BY total_rentals DESC, c.customer_id;










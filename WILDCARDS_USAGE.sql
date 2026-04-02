-- Wildcards are used in **pattern matching** with LIKE.

-- % : Represents zero or more characters
-- _ : Represents exactly one character

-- Example 1: Find customers whose first name starts with 'M'
SELECT first_name, last_name
FROM sakila.customer
WHERE first_name LIKE 'M%';

-- Example 2: Find customers whose last name ends with 'son'
SELECT first_name, last_name
FROM sakila.customer
WHERE last_name LIKE '%son';

-- Example 3: Find films with exactly 5 characters in title
SELECT title
FROM sakila.film
WHERE title LIKE '_____';

-- Example 4: Find films containing 'cat'
SELECT title
FROM sakila.film
WHERE title LIKE '%cat%';


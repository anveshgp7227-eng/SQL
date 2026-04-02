-- string functions 
-- "."a dot chareacter is used to access a column in the table 

select first_name from sakila.customer;
select distinct first_name from sakila.customer;

SELECT COUNT(distinct first_name)
from sakila.customer; 

SELECT COUNT(first_name)
from sakila.customer; 
-- ----------------------------------------------------

-- 1 concatenation 
select * from sakila.customer;
-- to merge first name and last name we use string conactenate function 
SELECT CONCAT(first_name,'--',last_name) AS FULL_NAME
FROM sakila.customer;

-- --LENGTH -- used to count the number of characters in a string.
SELECT title, LENGTH(title) AS title_length
FROM sakila.film                   
WHERE LENGTH(title) = 8;

-- SUB STRING 
SELECT email,
substring_index(SUBSTRING(email, LOCATE('@', email) + 1), '.', -1) AS domain   
FROM sakila.customer;

-- SUB_STRONG INDEX
select substring_index(email,'@', 1) from sakila.customer;

-- UPPER AND LOWER CASE CONVERSION 
SELECT email,
       UPPER(email) AS new_email,
       LOWER(email) AS worn_out
FROM sakila.customer;

-- -REPLACE--used to substitute a specific substring with another value
SELECT title, REPLACE(title, 'A', 'x') AS cleaned_title  -- creates a new column called cleaned_title where:Every capital letter 'A' in the title is replaced by 'x'.
FROM sakila.film
WHERE title LIKE '% %';

-- IF YOU WANT TO FILL THE WHITE SPACES WITH *
-- 1. LEFT PADDING
select title, LPAD(TITLE,20, '*') AS left_padded
from sakila.film
limit5;                                   -- This adds padding to the left of the title.

-- 2 . rIGHT PADDING 
SELECT TITLE, RPAD(TITLE,20,'*') AS RIGHT_PADDED -- 20 IS THE LIMIT OF SPACES IN THE COULMNS FOR CHARACTERS TO BE FILLED
FROM SAKILA.FILM
LIMIT5;

-- -REGEXP (Regular Expressions) :using REGEXP in SQL to write more dynamic and flexible queries.
-- not contains 3 consecutive vowels
SELECT customer_id, last_name
FROM sakila.customer
WHERE last_name NOT REGEXP '[^aeiouAEIOU]{3}';

-- count
select right(title,1), count(*)
FROM sakila.film
WHERE title REGEXP '[aeiouAEIOU]$'
group by right(title,1)


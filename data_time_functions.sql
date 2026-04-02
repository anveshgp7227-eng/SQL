
-- ==============================
-- SQL Date and Time Functions (sakila database)
-- ==============================
USE SAKILA;
-- 1. NOW() – Current date and time
SELECT NOW() AS current_datetime;

-- 2. SYSDATE() – Returns the current timestamp (execution time)
SELECT SYSDATE() AS sys_datetime;

-- 3. CURDATE() / CURRENT_DATE – Current date only
SELECT CURDATE() AS current_date;
SELECT CURRENT_DATE AS current_date_alt;

-- 4. CURTIME() / CURRENT_TIME – Current time only
SELECT CURTIME() AS current_time;
SELECT CURRENT_TIME AS current_time_alt;

-- 5. DATE() – Extract date from datetime
SELECT rental_date, DATE(rental_date) AS date_only
FROM sakila.rental
LIMIT 5;

-- 6. TIME() – Extract time from datetime
SELECT rental_date, TIME(rental_date) AS time_only
FROM sakila.rental
LIMIT 5;

-- 7. YEAR(), MONTH(), DAY()
SELECT rental_date,
       YEAR(rental_date) AS year_val,
       MONTH(rental_date) AS month_val,
       DAY(rental_date) AS day_val
FROM sakila.rental
LIMIT 5;

-- 8. HOUR(), MINUTE(), SECOND()
SELECT rental_date,
       HOUR(rental_date) AS hour_val,
       MINUTE(rental_date) AS minute_val,
       SECOND(rental_date) AS second_val
FROM sakila.rental
LIMIT 5;

-- 9. DAYNAME(), MONTHNAME()
SELECT rental_date,
       DAYNAME(rental_date) AS day_name,
       MONTHNAME(rental_date) AS month_name
FROM sakila.rental
LIMIT 5;

-- 10. DATE_ADD() – Add interval to a date
SELECT rental_date,
       DATE_ADD(rental_date, INTERVAL 7 DAY) AS add_7_days
FROM sakila.rental
LIMIT 5;

-- 11. DATE_SUB() – Subtract interval from date
SELECT rental_date,
       DATE_SUB(rental_date, INTERVAL 7 DAY) AS sub_7_days
FROM sakila.rental
LIMIT 5;

-- 12. ADDDATE() – Same as DATE_ADD
SELECT rental_date,
       ADDDATE(rental_date, INTERVAL 10 DAY) AS add_10_days
FROM sakila.rental
LIMIT 5;

-- 13. SUBDATE() – Same as DATE_SUB
SELECT rental_date,
       SUBDATE(rental_date, INTERVAL 10 DAY) AS sub_10_days
FROM sakila.rental
LIMIT 5;

-- 14. DATEDIFF() – Days between two dates
SELECT rental_date,
       return_date,
       DATEDIFF(return_date, rental_date) AS days_diff
FROM sakila.rental
WHERE return_date IS NOT NULL
LIMIT 5;

-- 15. TIMEDIFF() – Difference between two datetime columns (time difference)
SELECT rental_date, return_date,
       TIMEDIFF(return_date, rental_date) AS time_diff
FROM sakila.rental
WHERE return_date IS NOT NULL
LIMIT 5;

-- 16. STR_TO_DATE() – Convert string to date
SELECT STR_TO_DATE('2026-04-01 10:30:00', '%Y-%m-%d %H:%i:%s') AS converted_datetime;

-- 17. DATE_FORMAT() – Format date as string
SELECT rental_date,
       DATE_FORMAT(rental_date, '%W, %M %d, %Y %H:%i:%s') AS formatted_date
FROM sakila.rental
LIMIT 5;

-- 18. UNIX_TIMESTAMP() – Seconds since 1970-01-01
SELECT rental_date,
       UNIX_TIMESTAMP(rental_date) AS seconds_since_epoch
FROM sakila.rental
LIMIT 5;

-- 19. FROM_UNIXTIME() – Convert seconds to datetime
SELECT FROM_UNIXTIME(1609459200) AS converted_datetime; -- Example: 2021-01-01 00:00:00

 
    
    
    





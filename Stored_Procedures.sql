/*A Stored Procedure is a precompiled set of SQL statements stored inside the database that can be executed whenever needed. 
It works very similar to a function in programming because it allows you to encapsulate logic, reuse code, and optionally accept parameters.
 Instead of writing the same SQL logic multiple times, you define it once as a stored procedure and call it whenever required.

Stored procedures are powerful because they improve performance (precompiled), 
enhance security (you can give users access to execute the procedure instead of accessing tables directly), 
and support modularity (breaking complex operations into reusable blocks). 
They can include control flow statements like IF, LOOP, and error handling, making them suitable for business logic inside the database.*/

-- Create a stored procedure to get rentals of a specific customer
use sakila;
DELIMITER $$

CREATE PROCEDURE get_customer_rentals(IN cust_id INT)
BEGIN
    SELECT r.rental_id, r.rental_date, r.return_date
    FROM sakila.rental r
    WHERE r.customer_id = cust_id;
END $$

DELIMITER ;

-- Call the stored procedure
CALL get_customer_rentals(1);

/*stored procedures are commonly categorized based on how they handle parameters and return values.
 There are three main types used in practice:

Stored Procedure without parameters – Executes a fixed set of SQL statements and always returns the same type of result.
Stored Procedure with input parameters (IN) – Accepts values from the user and uses them inside the query, making it dynamic.
Stored Procedure with output parameters (OUT / INOUT) – Returns values back to the caller through parameters,
 similar to returning a value from a function.

This classification is important in interviews because it shows how procedures can be made flexible and reusable depending on the requirement.*/

-- 1. Stored Procedure WITHOUT parameters
DELIMITER $$

CREATE PROCEDURE get_all_customers()
BEGIN
    SELECT customer_id, first_name, last_name
    FROM sakila.customer;
END $$

DELIMITER ;

CALL get_all_customers();

-- -----------------------------------------------------------------------------------------------------------------------
-- 2. Stored Procedure WITH INPUT parameter
DELIMITER $$

CREATE PROCEDURE get_rentals_by_customer(IN cust_id INT)
BEGIN
    SELECT rental_id, rental_date
    FROM sakila.rental
    WHERE customer_id = cust_id;
END $$

DELIMITER ;

CALL get_rentals_by_customer(1);
-- --------------------------------------------------------------------------------------------------------------------

-- 3. Stored Procedure WITH OUTPUT parameter
DELIMITER $$

CREATE PROCEDURE get_total_rentals(IN cust_id INT, OUT total INT)
BEGIN
    SELECT COUNT(*) INTO total
    FROM sakila.rental
    WHERE customer_id = cust_id;
END $$

DELIMITER ;

-- Calling with output
CALL get_total_rentals(1, @total);
SELECT @total;
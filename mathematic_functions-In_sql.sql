-- Nummeric functions 
-- Absolute function (Abs)--> Retuens postive value of a number 
USE sakila;
show tables;
select * from anvesh; 

UPDATE Anvesh
SET Age = CASE
    WHEN id = 1 THEN -25
    WHEN id = 2 THEN -30
    WHEN id = 3 THEN -28
END
WHERE id IN (1,2,3);

-- Absolute function (Abs)--> Retuens postive value of a number 
update anvesh 
set  age=Abs(age)
where age<0 AND id in (1,2,3);


-- ceil function--> rouns up to the nearest interger
-- floor function --> round down to the nearest integer
-- round function--> Rounds a number to a specific number of decimal places.
-- power-->Raises a number to a power.
-- sqrt--> square root of number
-- modulus--> returns the remainder of divison
-- exponential-->  retuens expoenetial (e pwoer x); wehre x is euler number 2.71554655
-- logarithimic values
-- rand() returns decimal number between 0--1
select abs(-10),ceil(1.6),floor(1.6),round(1.99),round(1.45),power(8,8),sqrt(625);

-- OR WE CAN WRITE THEM SEERATLE AS FOLLOES 
 
-- == ============================
-- Common SQL Math Functions - Executable Examples
-- == ============================

-- ABS(number) 
-- Returns the absolute value of a number
SELECT ABS(-10) AS absolute_value;

-- CEIL(number) or CEILING(number) 
-- Rounds up to the nearest integer
SELECT CEIL(1.6) AS ceiling_value;

-- FLOOR(number) 
-- Rounds down to the nearest integer
SELECT FLOOR(1.6) AS floor_value;

-- ROUND(number, decimals) 
-- Rounds a number to a specific number of decimal places
SELECT ROUND(1.99) AS round_default, ROUND(1.456,2) AS round_two_decimals;

-- POWER(base, exponent) 
-- Raises a number to a specified power
SELECT POWER(8,2) AS power_example;

-- SQRT(number) 
-- Returns the square root of a number
SELECT SQRT(625) AS sqrt_example;

-- MOD(number, divisor) 
-- Returns the remainder of division
SELECT MOD(10,3) AS modulus_example;

-- EXP(number) 
-- Returns e (Euler’s number, 2.71828...) raised to the power of the number
SELECT EXP(5) AS exp_example;

-- LOG(number) 
-- Returns the natural logarithm (base e) of a number
SELECT LOG(10) AS natural_log;

-- LOG10(number) 
-- Returns the logarithm base 10 of a number
SELECT LOG10(1000) AS log_base_10;

-- PI() 
-- Returns the value of π
SELECT PI() AS pi_value;

-- RAND() 
-- Returns a random decimal number between 0 and 1
SELECT RAND() AS random_value;

-- Combined Example:
SELECT ABS(-10) AS absolute_value,
       CEIL(1.6) AS ceiling_value,
       FLOOR(1.6) AS floor_value,
       ROUND(1.456,2) AS round_two_decimals,
       POWER(8,2) AS power_example,
       SQRT(625) AS sqrt_example,
       MOD(10,3) AS modulus_example,
       EXP(5) AS exp_example,
       LOG(10) AS natural_log,
       LOG10(1000) AS log_base_10,
       PI() AS pi_value,
       RAND() AS random_value;

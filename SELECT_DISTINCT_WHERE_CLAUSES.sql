update stable 
set age=25, email_id='ANVESH@GMAIL.COM' where student_id=5;
-- --------------------------------------------------------------------------------------------
-- here we can we have sme names same, to see table free from dulppicates we use disntint 

select distinct EMAIL_ID from stable;

-- TO SEE TOTAL ROWS
SELECT COUNT(*) FROM STABLE;
SELECT COUNT(DISTINCT NAME) FROM STABLE;
SELECT COUNT(AGE) FROM STABLE;

-- -------------------------------------------------------------------------------------------
-- IS NULL 
SELECT * FROM STABLE WHERE AGE IS NULL;

SELECT * FROM STABLE WHERE AGE IS NOT NULL; -- IS NOT NULL

-- ---------------------------------------------------------------------------

-- DIFFERENT WAYS OF USUNG WHERE 
SELECT * FROM STABLE WHERE AGE>30; -- 	using direct where comndition 
SELECT * FROM STABLE WHERE AGE>20 AND STUDENT_ID>1;
SELECT * FROM STABLE WHERE AGE>20 OR STUDENT_ID>1;
SELECT * FROM STABLE WHERE EMAIL_ID IN ('ANVESH@GMAIL.COM') AND AGE=25;
--  --  YOU WANT TO TO SEARCH OR APPLY ON A FILTERED DATA 
-- ----MUTIPLE AND & OR TOGETHER
SELECT * FROM STABLE
  WHERE STUDENT_ID>1 OR EMAIL_ID=('ANVESH@GMAIL.COM,SURESH@GMAIL.COM,SHEELA@HOTMAIL.COM')
  ORDER BY AGE ASC;
---        ----------------------------------------
-- FILTERING USING NOT 
SELECT STUDENT_ID FROM STABLE 
WHERE STUDENT_ID NOT IN (3) AND AGE<5;

  -- GROUPBY AND HAVING  # TO CHECK THE DUPLICATES / TO SELECT THE DUPLICATES ALSE WE USE GROUPBY/HAVING
-- -WHERE: row-level filter (before grouping)
---   HAVING: group-level filter (after grouping)
USE SAKILA;
SELECT CUSTOMER_ID, COUNT(*) AS COUNT -- COUNT(*) = count rows in each group.
FROM SAKILA.RENTAL
GROUP BY CUSTOMER_ID -- -GROUP BY = group rows by a column
HAVING COUNT(*) <= 30 -- HAVING filters after grouping (WHERE filters rows, Having filters group)
ORDER BY COUNT DESC;

---- SQL is written like:
-- SELECT ... FROM ... WHERE ... GROUP BY ... HAVING ... ORDER BY ... LIMIT ...
-- But executed roughly like:
-- FROM -> JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY -> LIMIT




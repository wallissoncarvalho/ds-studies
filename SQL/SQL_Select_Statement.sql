SELECT first_name, last_name
FROM employees;

	-- WHERE Statement
SELECT *
FROM employees
WHERE first_name = 'Denis';

	-- WHERE AND
SELECT *
FROM employees
WHERE first_name = 'Denis'
AND gender = 'M';

	-- WHERE OR
SELECT *
FROM employees
WHERE first_name = 'Denis' OR first_name = 'Elvis';

	-- WHERE AND OR
SELECT *
FROM employees
WHERE first_name = 'Denis'
AND (gender = 'F' or gender = 'M');

	-- IN and NOT IN
SELECT *
FROM employees
WHERE first_name IN ('Cathie', 'Nathan', 'Mark');

SELECT *
FROM employees
WHERE first_name NOT IN ('Cathie', 'Nathan', 'Mark');

	-- LIKE and NOT LIKE
SELECT *
FROM employees
WHERE first_name LIKE('Mar__');

	-- BETWEEN... AND...
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '2000-01-01';

	-- IS NOT NULL / IS NULL
SELECT *
FROM employees
WHERE first_name IS NOT NULL;

	-- SELECT DISTINCT
SELECT DISTINCT gender
FROM employees;

	-- Aggregate functions
SELECT COUNT(DISTINCT first_name)
FROM employees;

	-- ORDER BY
SELECT *
FROM employees
ORDER BY first_name;

	-- GROUP BY
SELECT first_name, COUNT(first_name) as n_first_name
FROM employees
GROUP BY first_name
ORDER BY first_name;

	-- HAVING
SELECT first_name, COUNT(first_name) as n_first_name
FROM employees
GROUP BY first_name
HAVING COUNT(first_name)>250
AND COUNT(first_name)<270
ORDER BY first_name;

	-- LIMIT
SELECT *
FROM salaries
ORDER BY salary DESC
LIMIT 10;

	-- CASTING
USE employees;
DELIMITER $$
CREATE PROCEDURE selec_salaries()
BEGIN
	SELECT *
	FROM salaries
	ORDER BY salary DESC
	LIMIT 10;
END$$
DELIMITER;

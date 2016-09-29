-- 05.	Find Towns with Name Length
-- Write a SQL query to find town names that are 5 or 6 symbols long and order them alphabetically by town name. Submit your query statements as Prepare DB & run queries.

SELECT Name FROM Towns
WHERE LEN(Name) BETWEEN 5 AND 6
ORDER BY Name
-- 06. Find Towns Starting With
-- Write a SQL query to find all towns that start with letters M, K, B or E. Order them alphabetically by town name. Submit your query statements as Prepare DB & run queries.

SELECT * FROM Towns
WHERE Name LIKE '[MKBE]%'
ORDER BY Name
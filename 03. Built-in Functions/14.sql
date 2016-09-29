-- 14. Get Users with IP Address Like Pattern
-- Find all users along with their IP addresses sorted by username alphabetically. Display only rows that IP address matches the pattern: “***.1^.^.***”. Submit your query statements as Prepare DB & run queries.
-- Legend: * - one symbol, ^ - one or more symbols

SELECT Username, IpAddress FROM Users
WHERE IpAddress LIKE '___.1%.%.___'
ORDER BY Username
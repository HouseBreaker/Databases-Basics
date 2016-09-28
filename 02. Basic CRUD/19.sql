-- 19. Find First 10 Started Projects
-- Write a SQL query to find first 10 started projects. Select all information about them and sort them by start date, then by name. Submit your query statements as Prepare DB & run queries.

SELECT TOP 10 * FROM Projects
ORDER BY StartDate,
Name
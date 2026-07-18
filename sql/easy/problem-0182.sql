-- Duplicate emails

WITH cte_table AS (
    SELECT
        email,
        COUNT(1) AS times
    FROM Person
    GROUP BY email
)
SELECT email
FROM cte_table
WHERE times > 1

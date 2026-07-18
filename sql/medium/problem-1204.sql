-- Last person to fit in the bus

WITH cte_tmp AS (
    SELECT
        turn,
        person_name,
        weight,
        SUM(weight) OVER(ORDER BY turn) AS cumsum
    FROM Queue
)
SELECT person_name
FROM cte_tmp
WHERE cumsum <= 1000
ORDER BY turn DESC
LIMIT 1

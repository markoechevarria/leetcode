-- Delete duplicate emails

WITH cte_tmp1 AS (
    SELECT
        id,
        ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS rnk
    FROM Person
), cte_tmp2 AS (
    SELECT id
    FROM cte_tmp1
    WHERE rnk <> 1
)

DELETE
FROM Person
WHERE id IN (
    SELECT id
    FROM cte_tmp2
)



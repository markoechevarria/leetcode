-- Friend Requests II: Who has the most friends

WITH cte_tmp1 AS (
    SELECT
        requester_id AS id,
        COUNT(DISTINCT accepter_id) AS num
    FROM RequestAccepted
    GROUP BY requester_id
), cte_tmp2 AS (
    SELECT
        accepter_id AS id,
        COUNT(DISTINCT requester_id) AS num
    FROM RequestAccepted
    GROUP BY accepter_id
)

SELECT
    id,
    SUM(NUM) AS num
FROM (
    SELECT * FROM cte_tmp1
    UNION ALL
    SELECT * FROM cte_tmp2
)
GROUP BY id
ORDER BY num DESC
LIMIT 1


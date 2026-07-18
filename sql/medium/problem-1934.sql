-- Confirmation Rate

WITH cte_tmp AS (
    SELECT
        s.user_id,
        COUNT(CASE WHEN action = 'confirmed' THEN 1 END) AS accepted,
        COUNT(CASE WHEN action = 'timeout' OR action IS NULL THEN 1 END) AS rejected
    FROM Signups s
    LEFT JOIN Confirmations c
        ON s.user_id = c.user_id
    GROUP BY s.user_id
)
SELECT
    user_id,
    ROUND( (1.0 * accepted) / (accepted + rejected), 2 ) AS confirmation_rate
FROM cte_tmp

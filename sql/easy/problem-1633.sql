-- Percentage of Users attended a Contest

WITH cte_tmp AS (
    SELECT COUNT(*) AS cnt 
    FROM Users
)
SELECT
    r.contest_id,
    ROUND( COUNT(DISTINCT u.user_id) * 100.0 / (SELECT * from cte_tmp), 2 ) AS percentage
FROM Users u
JOIN Register r
ON u.user_id = r.user_id
GROUP BY contest_id
ORDER BY percentage DESC, contest_id

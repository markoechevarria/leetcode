-- Consecutive Numbers

WITH cte_tmp AS (
    SELECT
        num,
        LAG(num, 1) OVER() AS lag,
        LEAD(num, 1) OVER() AS lead
    FROM Logs
)
SELECT
    DISTINCT num AS ConsecutiveNums
FROM cte_tmp
WHERE num = lag AND num = lead

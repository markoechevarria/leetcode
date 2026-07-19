-- Investments in 2016

WITH cte_tmp1 AS (
    SELECT
        lat, lon,
        COUNT(*) AS cnt
    FROM Insurance
    GROUP BY lat, lon
), cte_tmp2 AS (
    SELECT
        tiv_2015,
        COUNT(*) AS cnt
    FROM Insurance
    GROUP BY tiv_2015
)

SELECT
    ROUND( SUM(tiv_2016)::numeric, 2 ) as tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM cte_tmp2
    WHERE cnt >= 2
) AND (lat, lon) IN (
    SELECT lat, lon
    FROM cte_tmp1
    WHERE cnt = 1
)

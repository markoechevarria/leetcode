-- Group sold Products by the Date

WITH cte_tmp AS (
    SELECT
        sell_date, product
    FROM Activities
    GROUP BY sell_date, product
)

SELECT
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    string_agg( product, ',' ORDER BY product) AS products
FROM (
    SELECT sell_date, product
    FROM cte_tmp
)
GROUP BY sell_date
ORDER BY sell_date


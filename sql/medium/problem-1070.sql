-- Product Sales Analysis II

WITH cte_tmp AS (
    SELECT
        product_id,
        MIN(year) AS min_year
    FROM Sales
    GROUP BY product_id
)

SELECT
    s.product_id,
    c.min_year AS first_year,
    s.quantity,
    s.price
FROM Sales s
INNER JOIN cte_tmp c
ON s.product_id = c.product_id AND s.year = c.min_year

-- Customers who bought all products

WITH cte_tmp AS (
    SELECT
        customer_id,
        COUNT(DISTINCT product_key) AS cnt
    FROM Customer
    GROUP BY customer_id
)

SELECT customer_id
FROM cte_tmp
WHERE cnt = ( SELECT COUNT(*) FROM Product )

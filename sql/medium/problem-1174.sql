-- Inmediate Food Delivery II

WITH cte_tmp  AS (
    SELECT
        CASE WHEN MIN(order_date) = MIN(customer_pref_delivery_date) THEN 1 ELSE 0 END as inc
    FROM Delivery
    GROUP BY customer_id
)
SELECT
    ROUND (COUNT (CASE WHEN inc = 1 THEN 1 END) * 100.0 / COUNT(*) , 2) AS immediate_percentage
FROM cte_tmp

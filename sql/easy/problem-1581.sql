-- Customer who visited but did not make any transactions

SELECT
    customer_id,
    COUNT(1) AS count_no_trans
FROM Visits v
FULL JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id

-- Monthly Transactions I

WITH cte_tmp AS (
    SELECT
        id,
        country,
        state,
        amount,
        to_char(trans_date, 'YYYY-mm') AS trans_date
    FROM Transactions
)

SELECT
    trans_date AS month,
    country,
    COUNT(*) AS trans_count,
    COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    COALESCE(SUM(CASE WHEN state = 'approved' THEN amount END), 0) AS approved_total_amount
FROM cte_tmp
GROUP BY trans_date, country

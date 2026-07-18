-- User activity for the past 30 days

SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-07-27'::DATE - 29 AND '2019-07-27'::DATE
GROUP BY activity_date
ORDER BY day

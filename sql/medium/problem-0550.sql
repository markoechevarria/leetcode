-- Game Play Analysis IV

with cte_tmp AS (
    SELECT 
        player_id,
        MIN(event_date) AS min_event_date
    FROM Activity
    GROUP BY player_id
)

SELECT 
    ROUND( COUNT(c.player_id) * 1.0 / (SELECT COUNT(*) FROM cte_tmp), 2)  AS fraction
FROM Activity a
LEFT JOIN cte_tmp c
ON a.player_id = c.player_id AND c.min_event_date + 1 = a.event_date

-- Movie Rating

WITH cte_tmp1 AS (
    SELECT
        user_id,
        COUNT(*) AS cnt
    FROM MovieRating
    GROUP BY user_id
), cte_tmp2 AS (
    SELECT
        movie_id,
        AVG(rating) AS cnt
    FROM MovieRating
    WHERE created_at >= '2020-02-01' AND created_at <= '2020-02-29'
    GROUP BY movie_id
)

(
    SELECT u.name AS results
    FROM cte_tmp1 c
    INNER JOIN Users u
    ON c.user_id = u.user_id
    WHERE c.cnt = (
        SELECT MAX(cnt)
        FROM cte_tmp1
    )
    ORDER BY results
    LIMIT 1
)
UNION ALL
(
    SELECT m.title AS results
    FROM cte_tmp2 c
    INNER JOIN Movies m
    ON c.movie_id = m.movie_id
    WHERE c.cnt = (
        SELECT MAX(cnt)
        FROM cte_tmp2
    )
    ORDER BY results
    LIMIT 1
)

-- Exchange Seats

WITH cte_tmp AS (
    SELECT COUNT(*) AS quantity FROM Seat
)

SELECT
    CASE WHEN (
        id <> (
            SELECT quantity
            FROM cte_tmp
        ) OR (
            SELECT quantity
            FROM cte_tmp
        ) % 2 <> 1
    )
    THEN
        ( CASE WHEN id % 2 = 1 THEN id + 1 ELSE id - 1 END )
    ELSE
        id
    END AS id,
    student
FROM Seat
ORDER BY id

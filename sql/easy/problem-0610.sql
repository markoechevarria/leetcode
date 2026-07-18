-- Triangle Judgement

SELECT
    x,
    y,
    z,
    ( CASE
        WHEN
            x < y + z AND
            x > ABS(y - z) AND
            y < x + z AND
            y > ABS(x - z) AND
            z < x + z AND
            z > ABS(x - y)
        THEN 'Yes'
        ELSE 'No'
        END
    ) AS triangle
FROM Triangle

-- Delete duplicate emails

SELECT
    MIN(id),
    email
FROM Person
GROUP BY email

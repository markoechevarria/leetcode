-- Managers with at least 5 direct reports

WITH cte_tmp AS (
    SELECT managerId AS id
    FROM Employee
    GROUP BY managerId
    HAVING COUNT(*) >= 5
)

SELECT name
FROM Employee
WHERE id IN (SELECT id FROM cte_tmp)

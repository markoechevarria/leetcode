-- The number of employees which report to each employee

WITH cte_tmp AS (
    SELECT
        reports_to AS manager,
        COUNT(reports_to) AS cnt,
        ROUND(AVG(age)) AS avg_age
    FROM Employees
    WHERE reports_to IS NOT NULL
    GROUP BY reports_to
)

SELECT
    c.manager AS employee_id,
    e.name,
    c.cnt AS reports_count,
    c.avg_age AS average_age
FROM cte_tmp c
LEFT JOIN Employees e
ON c.manager = e.employee_id
ORDER BY employee_id

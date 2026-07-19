-- Primary Department for each Employee

WITH cte_tmp AS (
    SELECT
        employee_id,
        COUNT(*) AS depts
    FROM Employee
    GROUP BY employee_id
)

SELECT
    e.employee_id,
    e.department_id
FROM Employee e
INNER JOIN cte_tmp c
ON e.employee_id = c.employee_id
WHERE depts = 1 OR ( depts <> 1 AND primary_flag = 'Y' )

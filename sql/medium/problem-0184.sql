-- Department Highest Salary

WITH cte_tmp AS (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER(
            PARTITION BY d.name ORDER BY e.salary DESC
        ) AS rnk
    FROM Employee e
    INNER JOIN Department d
    ON e.departmentId = d.id
)
SELECT
    Department,
    Employee,
    Salary
FROM cte_tmp
WHERE rnk = 1

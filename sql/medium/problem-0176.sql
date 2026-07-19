-- Second highest salary

WITH cte_first AS (
    SELECT
        salary,
        DENSE_RANK() OVER( ORDER BY salary DESC ) AS times
    FROM Employee
)

SELECT MAX(salary) AS SecondHighestSalary
FROM cte_first
WHERE times = 2;

-- Employees whose manager left the company

SELECT employee_id
FROM Employees
WHERE
    salary < 30_000 AND
    manager_id IS NOT NULL AND
    manager_id NOT IN (
        SELECT DISTINCT employee_id
        FROM Employees
    )
ORDER BY employee_id

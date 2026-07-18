-- Employees Earning More Than Their Managers

SELECT 
    em.name AS Employee
FROM Employee as em
INNER JOIN Employee as mn
ON em.managerId = mn.id
WHERE em.salary > mn.salary;

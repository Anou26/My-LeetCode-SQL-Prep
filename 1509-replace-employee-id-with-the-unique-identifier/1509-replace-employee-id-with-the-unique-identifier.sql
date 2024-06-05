# Write your MySQL query statement below
SELECT COALESCE(u.unique_id, NULL) AS unique_id,
       e.name
FROM Employees e
LEFT JOIN EmployeeUNI u
ON e.id = u.id;

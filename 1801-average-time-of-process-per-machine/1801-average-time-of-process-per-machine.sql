# Write your MySQL query statement below
WITH ProcessTimes AS (
    SELECT 
        machine_id, 
        process_id, 
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) AS end_time
    FROM Activity
    GROUP BY machine_id, process_id
),
MachineAverages AS (
    SELECT 
        machine_id, 
        AVG(end_time - start_time) AS average_time
    FROM ProcessTimes
    GROUP BY machine_id
)
SELECT 
    machine_id, 
    ROUND(average_time, 3) AS processing_time
FROM MachineAverages;

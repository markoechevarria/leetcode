-- Students and Examinations

WITH cte_tmp AS (
    SELECT
        student_id,
        subject_name,
        COUNT(1) AS attended_exams
    FROM Examinations
    GROUP BY student_id, subject_name
)

SELECT
    st.student_id,
    st.student_name,
    su.subject_name,
    CASE WHEN ct.attended_exams IS NOT NULL THEN ct.attended_exams ELSE 0 END AS attended_exams
FROM students st
CROSS JOIN subjects su
LEFT JOIN cte_tmp ct
ON st.student_id = ct.student_id AND su.subject_name = ct.subject_name
ORDER BY st.student_id, su.subject_name

-- 코드를 작성해주세요
-- 2024-12-29
WITH
SUB_QUERY1 AS
(
    SELECT
        EMP_NO,
        CASE
            WHEN AVG(SCORE) >= 96 THEN 'S'
            WHEN AVG(SCORE) >= 90 THEN 'A'
            WHEN AVG(SCORE) >= 80 THEN 'B'
            ELSE 'C'
        END AS GRADE
    FROM HR_GRADE
    GROUP BY EMP_NO
),
SUB_QUERY2 AS
(
    SELECT *
    FROM HR_EMPLOYEES
    JOIN HR_DEPARTMENT USING(DEPT_ID)
)

SELECT
    EMP_NO,
    EMP_NAME,
    GRADE,
    CASE
        WHEN GRADE = 'S' THEN CAST(SAL * 0.2 AS UNSIGNED)
        WHEN GRADE = 'A' THEN CAST(SAL * 0.15 AS UNSIGNED)
        WHEN GRADE = 'B' THEN CAST(SAL * 0.1 AS UNSIGNED)
        ELSE 0
    END AS BONUS
FROM SUB_QUERY2
JOIN SUB_QUERY1 USING(EMP_NO)
ORDER BY EMP_NO;
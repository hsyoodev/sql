-- 코드를 작성해주세요
-- 2024-10-27
SELECT DEPT_ID, DEPT_NAME_EN, ROUND(AVG(SAL), 0) AS AVG_SAL
FROM HR_DEPARTMENT
NATURAL JOIN HR_EMPLOYEES
GROUP BY DEPT_ID
ORDER BY AVG_SAL DESC;
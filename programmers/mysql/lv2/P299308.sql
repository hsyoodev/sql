-- 코드를 작성해주세요
-- 2024-09-30
SELECT CONCAT(QUARTER(DIFFERENTIATION_DATE), 'Q') AS QUARTER, COUNT(*) AS ECOLI_COUNT
FROM ECOLI_DATA
GROUP BY QUARTER
ORDER BY QUARTER ASC;
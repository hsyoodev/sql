-- 코드를 입력하세요
-- 2024-10-20
SELECT A.CATEGORY, SUM(B.SALES)
FROM BOOK AS A
NATURAL JOIN BOOK_SALES AS B
WHERE DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-01'
GROUP BY CATEGORY
ORDER BY CATEGORY;
-- 코드를 입력하세요
-- 2024-10-08
SELECT 10000 * (PRICE DIV 10000) AS PRICE_GROUP, COUNT(*) AS PRODUCTS
FROM PRODUCT
GROUP BY PRICE_GROUP
ORDER BY PRICE_GROUP ASC;
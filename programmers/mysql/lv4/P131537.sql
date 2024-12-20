-- 코드를 입력하세요
-- 2024-11-13
(SELECT SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
FROM ONLINE_SALE
WHERE DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-03')
UNION
(SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d'), PRODUCT_ID, NULL, SALES_AMOUNT
FROM OFFLINE_SALE
WHERE DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-03')
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID;
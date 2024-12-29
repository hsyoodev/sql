-- 코드를 입력하세요
-- 2024-12-09
WITH
SUB_QUERY1 AS
(
    SELECT DISTINCT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE DATEDIFF(END_DATE, '2022-11-01') >= 0
),
SUB_QUERY2 AS
(
    SELECT DISTINCT CAR_ID, CAR_TYPE, DAILY_FEE
    FROM CAR_RENTAL_COMPANY_CAR
    LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY USING(CAR_ID)
    WHERE CAR_TYPE IN ('세단', 'SUV')
    AND CAR_ID NOT IN (SELECT *
                       FROM SUB_QUERY1)
),
SUB_QUERY3 AS
(
    SELECT *
    FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
    WHERE CAR_TYPE IN ('세단', 'SUV')
    AND CAST(DURATION_TYPE AS UNSIGNED) = 30
)

SELECT CAR_ID, CAR_TYPE, CAST(DAILY_FEE * ((1 - DISCOUNT_RATE / 100) * 30) AS UNSIGNED) AS FEE
FROM SUB_QUERY2
JOIN SUB_QUERY3 USING(CAR_TYPE)
WHERE CAST(DAILY_FEE * (1 - DISCOUNT_RATE / 100) * 30 AS UNSIGNED) BETWEEN 500000 AND 2000000
ORDER BY FEE DESC, CAR_TYPE, CAR_ID DESC;
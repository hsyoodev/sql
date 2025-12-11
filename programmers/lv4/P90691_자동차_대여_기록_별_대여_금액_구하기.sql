SELECT
        A.HISTORY_ID
      , ROUND(A.DURATION * B.DAILY_FEE * (100 - NVL(C.DISCOUNT_RATE, 0)) / 100) AS FEE
FROM
      (
            SELECT
                    HISTORY_ID
                  , CAR_ID
                  , (END_DATE - START_DATE + 1) AS DURATION
                  , CASE 
                        WHEN (END_DATE - START_DATE + 1) >= 90 THEN '90일 이상'
                        WHEN (END_DATE - START_DATE + 1) >= 30 THEN '30일 이상'
                        WHEN (END_DATE - START_DATE + 1) >= 7 THEN '7일 이상'
                    END AS DURATION_TYPE
            FROM
                    CAR_RENTAL_COMPANY_RENTAL_HISTORY
      ) A
INNER JOIN 
        CAR_RENTAL_COMPANY_CAR B 
ON 
        A.CAR_ID = B.CAR_ID AND B.CAR_TYPE = '트럭'
LEFT JOIN 
        CAR_RENTAL_COMPANY_DISCOUNT_PLAN C 
ON 
        A.DURATION_TYPE = C.DURATION_TYPE AND C.CAR_TYPE = '트럭'
ORDER BY
        FEE DESC, HISTORY_ID DESC;

-- 코드를 입력하세요
WITH
    CUSTOM_CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS
    (
        SELECT
                *
        FROM
                CAR_RENTAL_COMPANY_DISCOUNT_PLAN
        WHERE
                CAR_TYPE = '트럭'
    )
  , CUSTOM_CAR_RENTAL_COMPANY_CAR AS
    (
        SELECT
                *
        FROM
                CAR_RENTAL_COMPANY_CAR
        WHERE
                CAR_TYPE = '트럭'
    )
  , CUSTOM_CAR_RENTAL_COMPANY_RENTAL_HISTORY AS
    (
        SELECT
                HISTORY_ID
              , CAR_ID
              , (END_DATE - START_DATE + 1) AS DURATION_DATE
              , CASE
                    WHEN (END_DATE - START_DATE + 1) >= 90 THEN '90일 이상'
                    WHEN (END_DATE - START_DATE + 1) >= 30 THEN '30일 이상'
                    WHEN (END_DATE - START_DATE + 1) >= 7 THEN '7일 이상'
                END AS DURATION_TYPE
        FROM
                CAR_RENTAL_COMPANY_RENTAL_HISTORY
    )
SELECT
        HISTORY_ID
      , (DURATION_DATE * DAILY_FEE) * (1 - NVL(DISCOUNT_RATE, 0) / 100) AS FEE
FROM
        CUSTOM_CAR_RENTAL_COMPANY_RENTAL_HISTORY
INNER JOIN
        CUSTOM_CAR_RENTAL_COMPANY_CAR
        USING(CAR_ID)
LEFT OUTER JOIN
        CUSTOM_CAR_RENTAL_COMPANY_DISCOUNT_PLAN
        USING(DURATION_TYPE)
ORDER BY
        FEE DESC, HISTORY_ID DESC;

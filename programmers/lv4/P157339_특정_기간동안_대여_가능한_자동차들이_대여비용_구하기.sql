-- 코드를 입력하세요
WITH
    -- 2022년 11월 1일 부터 2022년 11월 30일까지 대여불가능한 자동차
    CUSTOM_CAR_RENTAL_COMPANY_RENTAL_HISTORY AS
    (
        SELECT
                DISTINCT CAR_ID
        FROM
                CAR_RENTAL_COMPANY_RENTAL_HISTORY
        WHERE
                TO_CHAR(START_DATE, 'YYYY-MM-DD') <= '2022-11-30'
          AND
                TO_CHAR(END_DATE, 'YYYY-MM-DD') >= '2022-11-01'
    )
SELECT
        CAR_ID
      , CAR_TYPE
      , (30 * DAILY_FEE * (1 - (DISCOUNT_RATE * 0.01))) AS FEE
FROM
        CAR_RENTAL_COMPANY_CAR
INNER JOIN
        CAR_RENTAL_COMPANY_DISCOUNT_PLAN
        USING(CAR_TYPE)
WHERE
        CAR_ID NOT IN (
                            SELECT
                                    CAR_ID
                            FROM
                                    CUSTOM_CAR_RENTAL_COMPANY_RENTAL_HISTORY
                      )
AND
        CAR_TYPE IN ('세단', 'SUV')
AND
        DURATION_TYPE = '30일 이상'
AND
        (30 * DAILY_FEE * (1 - (DISCOUNT_RATE * 0.01))) BETWEEN 500000 AND 2000000
ORDER BY
        FEE DESC, CAR_TYPE, CAR_ID DESC;

SELECT
        A.CAR_ID
      , A.CAR_TYPE
      , 30 * (A.DAILY_FEE * (1 - (B.DISCOUNT_RATE * 0.01))) AS FEE
FROM
        CAR_RENTAL_COMPANY_CAR A
      , CAR_RENTAL_COMPANY_DISCOUNT_PLAN B
WHERE
        A.CAR_TYPE = B.CAR_TYPE
AND
        A.CAR_TYPE IN ('세단', 'SUV')
AND
        B.DURATION_TYPE = '30일 이상'
AND
        A.CAR_ID NOT IN (
                            SELECT
                                    DISTINCT CAR_ID
                            FROM
                                    CAR_RENTAL_COMPANY_RENTAL_HISTORY
                            WHERE
                                    TO_CHAR(END_DATE, 'YYYYMMDD') >= '20221101'
                        )
AND
        30 * (A.DAILY_FEE * (1 - (B.DISCOUNT_RATE * 0.01))) BETWEEN 500000 AND 2000000
ORDER BY
        FEE DESC, CAR_TYPE, CAR_ID DESC;

-- 코드를 입력하세요
WITH
    -- 2022년 10월 16일에 대여 중인 자동차
    CUSTOM_CAR_RENTAL_COMPANY_RENTAL_HISTORY AS
        (
            SELECT
                    CAR_ID
            FROM
                    CAR_RENTAL_COMPANY_RENTAL_HISTORY
            WHERE
                    TO_DATE('2022-10-16', 'YYYY-MM-DD') BETWEEN START_DATE AND END_DATE
        )
SELECT
        CAR_ID
      , CASE
            WHEN CAR_ID IN (
                                SELECT
                                    CAR_ID
                                FROM
                                    CUSTOM_CAR_RENTAL_COMPANY_RENTAL_HISTORY
                           ) THEN '대여중'
           ELSE '대여 가능'
        END AS AVAILABILITY
FROM
        CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY
        CAR_ID
ORDER BY
        CAR_ID DESC;
        
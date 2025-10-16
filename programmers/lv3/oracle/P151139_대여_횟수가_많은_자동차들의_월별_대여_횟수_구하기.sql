SELECT
        TO_CHAR(START_DATE, 'FMMM') AS MONTH
      , CAR_ID
      , COUNT(*) AS RECORDS
FROM
        CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE
        CAR_ID IN (
                        SELECT
                                CAR_ID
                        FROM
                                CAR_RENTAL_COMPANY_RENTAL_HISTORY
                        WHERE
                                TO_CHAR(START_DATE, 'YYYY-MM-DD') < '2022-11-01'
                        AND
                                TO_CHAR(END_DATE, 'YYYY-MM-DD') >= '2022-08-01'
                        GROUP BY
                                CAR_ID
                        HAVING
                                COUNT(*) >= 5
                  )
GROUP BY
        TO_CHAR(START_DATE, 'FMMM')
      , CAR_ID
ORDER BY
        TO_NUMBER(MONTH)
      , CAR_ID DESC

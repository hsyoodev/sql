SELECT
        C.AUTHOR_ID
      , C.AUTHOR_NAME
      , B.CATEGORY
      , SUM(A.SALES * B.PRICE) AS TOTAL_SALES
FROM
        (
            SELECT
                    BOOK_ID
                  , TO_CHAR(SALES_DATE, 'YYYY-MM') AS SALES_DATE
                  , SALES
            FROM
                    BOOK_SALES
        ) A
      , BOOK B
      , AUTHOR C
WHERE
        A.BOOK_ID = B.BOOK_ID
AND
        B.AUTHOR_ID = C.AUTHOR_ID
AND
        A.SALES_DATE = '2022-01'
GROUP BY
        C.AUTHOR_ID, C.AUTHOR_NAME, B.CATEGORY
ORDER BY
        AUTHOR_ID, CATEGORY DESC;

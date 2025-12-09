SELECT
        B.MEMBER_NAME
      , A.REVIEW_TEXT
      , TO_CHAR(A.REVIEW_DATE, 'YYYY-MM-DD') AS REVIEW_DATE
FROM
        REST_REVIEW A
      , MEMBER_PROFILE B
WHERE
        A.MEMBER_ID = B.MEMBER_ID
AND
        A.MEMBER_ID IN (
                            SELECT
                                    MEMBER_ID
                            FROM
                                    REST_REVIEW
                            GROUP BY
                                    MEMBER_ID
                            ORDER BY
                                    COUNT(*) DESC
                            FETCH
                                    FIRST 1 ROWS ONLY
                       )
ORDER BY
        REVIEW_DATE, REVIEW_TEXT;

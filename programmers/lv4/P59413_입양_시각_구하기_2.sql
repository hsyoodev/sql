SELECT
        A.HOUR
      , COUNT(B.HOUR) AS COUNT
FROM
        (
            SELECT
                    (LEVEL - 1) AS HOUR
            FROM
                    DUAL
            CONNECT BY LEVEL <= 24
        ) A
      , (
            SELECT
                    TO_NUMBER(TO_CHAR(DATETIME, 'HH24')) AS HOUR
            FROM
                    ANIMAL_OUTS
        ) B
WHERE
        A.HOUR = B.HOUR(+)
GROUP BY
        A.HOUR
ORDER BY
        HOUR;

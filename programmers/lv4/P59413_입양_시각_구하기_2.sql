-- 코드를 입력하세요
WITH
    CUSTOM_ANIMAL_OUTS AS
    (
        SELECT
                TO_CHAR(DATETIME, 'HH24') AS HOUR
        FROM
                ANIMAL_OUTS
    )
  , CUSTOM_HOUR AS
    (
        SELECT
                LEVEL - 1 AS HOUR
        FROM
                DUAL
        CONNECT BY
                LEVEL <= 24
    )
SELECT
        A.HOUR
      , COUNT(B.HOUR) AS COUNT
FROM
        CUSTOM_HOUR A
LEFT OUTER JOIN
        CUSTOM_ANIMAL_OUTS B
        ON A.HOUR = B.HOUR
GROUP BY
        A.HOUR
ORDER BY
        A.HOUR;

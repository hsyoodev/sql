SELECT
        A.FLAVOR
FROM
        FIRST_HALF A
      , (
            SELECT
                    FLAVOR, SUM(TOTAL_ORDER) AS TOTAL_ORDER
            FROM
                    JULY
            GROUP BY
                    FLAVOR
        ) B
WHERE
        A.FLAVOR = B.FLAVOR
ORDER BY
        (A.TOTAL_ORDER + B.TOTAL_ORDER) DESC
FETCH NEXT 3 ROWS ONLY;

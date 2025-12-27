SELECT
        MIN(CITY)
      , LENGTH(CITY)
FROM
        STATION
WHERE
        LENGTH(CITY) IN (
                            (
                                SELECT
                                        MIN(LENGTH(CITY))
                                FROM
                                        STATION
                            )
                            UNION
                            (
                                SELECT
                                        MAX(LENGTH(CITY))
                                FROM
                                        STATION
                            )
                        )
GROUP BY
        LENGTH(CITY);

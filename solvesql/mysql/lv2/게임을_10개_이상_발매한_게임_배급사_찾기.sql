SELECT
        name
FROM
        companies
WHERE
        company_id IN (
                            SELECT
                                    publisher_id
                            FROM
                                    games
                            GROUP BY
                                    publisher_id
                            HAVING
                                    COUNT(*) >= 10
                      );

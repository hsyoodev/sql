WITH
    CUSTOM_TIPS AS
        (
            SELECT
                    day
                   , SUM(total_bill) as sales
            FROM
                    tips
            GROUP BY
                    day
        )
SELECT
        ROUND(AVG(sales), 2) AS avg_sales
FROM
        CUSTOM_TIPS;

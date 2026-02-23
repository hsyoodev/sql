SELECT
        day
      , ROUND(SUM(tip), 2) AS tip_daily
FROM
        tips
GROUP BY
        day
ORDER BY
        ROUND(SUM(tip), 2) DESC
LIMIT 1;

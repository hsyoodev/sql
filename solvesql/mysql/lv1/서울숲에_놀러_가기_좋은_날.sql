SELECT
        measured_at AS good_day
FROM
        measurements
WHERE
        DATE_FORMAT(measured_at, '%Y-%m') = '2022-12'
AND
        pm2_5 <= 9
ORDER BY
        good_day;

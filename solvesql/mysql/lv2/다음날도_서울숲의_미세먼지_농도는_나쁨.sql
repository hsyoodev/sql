SELECT
        A.measured_at AS today
      , B.measured_at AS next_day
      , A.pm10 AS pm10
      , B.pm10 AS next_pm10
FROM
        measurements A
INNER JOIN
        measurements B
ON
        DATE_ADD(A.measured_at, INTERVAL 1 DAY) = B.measured_at
AND
        A.pm10 < B.pm10;

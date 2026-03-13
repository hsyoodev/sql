SELECT
        DISTINCT B.athlete_id
FROM
        events A
INNER JOIN
        records B
        ON A.id = B.event_id
        AND A.sport = 'Golf';

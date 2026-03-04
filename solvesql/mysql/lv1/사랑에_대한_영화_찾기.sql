SELECT
        title
      , year
      , rotten_tomatoes
FROM
        movies
WHERE
        REGEXP_LIKE(title, 'Love|love')
ORDER BY
        rotten_tomatoes DESC, year DESC;

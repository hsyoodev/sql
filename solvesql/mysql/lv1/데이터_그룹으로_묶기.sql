SELECT
        quartet
      , ROUND(AVG(x), 2) AS x_mean
      , VAR_SAMP(x) AS x_var
      , ROUND(AVG(y), 2) as y_mean
      , ROUND(VAR_SAMP(y), 2) as y_var
FROM
        points
GROUP BY
        quartet;

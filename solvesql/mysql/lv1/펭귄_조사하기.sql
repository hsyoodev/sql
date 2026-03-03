SELECT
        island
      , species
FROM
        penguins
GROUP BY
        island, species
ORDER BY
        island, species;

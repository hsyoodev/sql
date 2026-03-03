SELECT
        game_id
      , name
      , year
FROM
        games
WHERE
        REGEXP_LIKE(name, 'Christmas|Santa');

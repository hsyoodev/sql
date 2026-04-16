SELECT
        ROUND(((SELECT COUNT(*) FROM artworks WHERE LOWER(credit) LIKE '%gift%') / COUNT(*)) * 100, 3) AS ratio
FROM
        artworks;

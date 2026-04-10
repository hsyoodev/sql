SELECT
        title
FROM
        film
WHERE
        rating IN ('R', 'NC-17')
AND
        title REGEXP '[^A|E|I|O|U]$';

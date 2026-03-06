SELECT
        YEAR(purchased_at) AS year
      , SUM(total_price - discount_amount) AS net_sales
FROM
        transactions
WHERE
        is_returned IS NOT TRUE
GROUP BY
        year
ORDER BY
        year;

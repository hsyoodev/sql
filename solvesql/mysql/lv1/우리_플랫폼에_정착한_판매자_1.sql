SELECT
        seller_id
      , count(DISTINCT order_id) AS orders
FROM
        olist_order_items_dataset
GROUP BY
        seller_id
HAVING
        count(DISTINCT order_id) >= 100;

SELECT
        DATE_FORMAT(order_purchase_timestamp, '%Y-%m-%d') AS dt
      , ROUND(SUM(payment_value), 2) AS revenue_daily
FROM
        olist_orders_dataset
INNER JOIN
        olist_order_payments_dataset
USING
        (order_id)
WHERE
        DATE_FORMAT(order_purchase_timestamp, '%Y-%m-%d') >= '2018-01-01'
GROUP BY
        DATE_FORMAT(order_purchase_timestamp, '%Y-%m-%d')
ORDER BY
        dt;

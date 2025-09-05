-- KPIs quotidiens (nombre de commandes et CA)
SELECT
    CAST(order_purchase_timestamp AS DATE) AS order_date,
    COUNT(DISTINCT order_id) AS nb_orders,
    SUM(price) AS total_sales
FROM `data-cloud-mydigitalschool.medallion.silver_orders_flat`
GROUP BY order_date
ORDER BY order_date

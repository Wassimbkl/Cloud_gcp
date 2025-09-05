-- Segmentation clients par nombre de commandes et valeur totale
SELECT
    c.customer_id,
    COUNT(DISTINCT o.order_id) AS nb_orders,
    SUM(i.price) AS total_spent,
    CASE
        WHEN SUM(i.price) > 1000 THEN 'VIP'
        WHEN SUM(i.price) BETWEEN 500 AND 1000 THEN 'Loyal'
        ELSE 'Occasional'
    END AS customer_segment
FROM `data-cloud-mydigitalschool.medallion.silver_customers_clean` c
LEFT JOIN `data-cloud-mydigitalschool.medallion.silver_orders_flat` o
    ON c.customer_id = o.customer_id
LEFT JOIN `data-cloud-mydigitalschool.medallion.bronze_order_items` i
    ON o.order_id = i.order_id
GROUP BY c.customer_id

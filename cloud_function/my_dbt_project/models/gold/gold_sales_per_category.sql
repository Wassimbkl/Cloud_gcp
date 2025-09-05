-- Ventes par catégorie de produit
SELECT
    p.product_category_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(i.price) AS total_sales
FROM `data-cloud-mydigitalschool.medallion.silver_orders_flat` o
JOIN `data-cloud-mydigitalschool.medallion.silver_products_clean` p
    ON o.product_id = p.product_id
JOIN `data-cloud-mydigitalschool.medallion.bronze_order_items` i
    ON o.order_id = i.order_id AND o.product_id = i.product_id
GROUP BY product_category_name
ORDER BY total_sales DESC

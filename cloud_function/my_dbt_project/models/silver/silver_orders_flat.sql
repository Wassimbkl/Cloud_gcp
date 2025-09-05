-- Jointure des commandes avec les clients et items
SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    i.product_id,
    i.seller_id,
    i.shipping_limit_date,
    i.price,
    i.freight_value
FROM `data-cloud-mydigitalschool.medallion.bronze_orders` o
JOIN `data-cloud-mydigitalschool.medallion.bronze_order_items` i
    ON o.order_id = i.order_id
WHERE o.order_id IS NOT NULL

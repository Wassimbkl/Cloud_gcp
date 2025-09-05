SELECT DISTINCT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM `data-cloud-mydigitalschool.medallion.bronze_customers`
WHERE customer_id IS NOT NULL

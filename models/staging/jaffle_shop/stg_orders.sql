SELECT
    id as order_id,
    user_id as customer_id,
    order_date,
    status

 FROM dbt-learn-bigquery-403813.jaffle_shop.orders
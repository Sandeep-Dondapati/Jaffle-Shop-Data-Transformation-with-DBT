SELECT 
    id as payment_id,
    orderid as order_id,
    paymentmethod,
    amount,
    status,
    created as created_date

FROM `dbt-learn-bigquery-403813.stripe.payments` 
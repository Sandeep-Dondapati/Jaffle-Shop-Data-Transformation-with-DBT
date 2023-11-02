SELECT 
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    amount/100 as amount,
    status,
    created as created_at

FROM dbt-learn-bigquery-403813.stripe.payments 
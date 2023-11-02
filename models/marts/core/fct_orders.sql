with orders as (

    select * from {{ ref ('stg_orders') }}
),

payments as (

    select * from {{ ref ('stg_payments') }}
),

fact_orders as (

    select
        orders.order_id,
        orders.customer_id,
        coalesce(payments.amount,0) as amount
    
    from orders
    
    left join payments using (order_id) 

)
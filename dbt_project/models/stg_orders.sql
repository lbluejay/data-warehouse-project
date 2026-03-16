with raw_orders as (
    select * from {{ source('raw_olist', 'orders') }}
)

select
    order_id,
    customer_id,
    order_status,
    -- Convert strings to actual timestamps
    cast(date(order_purchase_timestamp) as date) as purchase_date,
    cast(date(order_approved_at) as date) as approved_date,
    cast(date(order_delivered_carrier_date) as date) as delivered_carrier_date,
    cast(date(order_estimated_delivery_date) as date) as estimated_delivery_date,
    cast(date(order_delivered_customer_date) as date) as delivered_date,
from raw_orders
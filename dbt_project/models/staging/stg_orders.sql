with raw_orders as (
    select * from {{ source('raw_olist', 'orders') }}
)

select
    NULLIF(trim(cast(order_id as varchar)), '') as order_id,
    NULLIF(trim(cast(customer_id as varchar)), '') as customer_id,
    NULLIF(trim(cast(order_status as varchar)), '') as order_status,
    date(cast(NULLIF(trim(cast(order_purchase_timestamp as varchar)), '') as timestamp)) as purchase_date,
    date(cast(NULLIF(trim(cast(order_approved_at as varchar)), '') as timestamp)) as approved_date,
    date(cast(NULLIF(trim(cast(order_delivered_carrier_date as varchar)), '') as timestamp)) as delivered_carrier_date,
    date(cast(NULLIF(trim(cast(order_estimated_delivery_date as varchar)), '') as timestamp)) as estimated_delivery_date,
    date(cast(NULLIF(trim(cast(order_delivered_customer_date as varchar)), '') as timestamp)) as delivered_date
from raw_orders
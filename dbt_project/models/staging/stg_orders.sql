with raw_orders as (
    select * from {{ source('raw_olist', 'orders') }}
)

select
    nullif(trim(cast(order_id as string)), '') as order_id,
    nullif(trim(cast(customer_id as string)), '') as customer_id,
    nullif(trim(cast(order_status as string)), '') as order_status,
    date(cast(nullif(trim(cast(order_purchase_timestamp as string)), '') as timestamp)) as purchase_date,
    date(cast(nullif(trim(cast(order_approved_at as string)), '') as timestamp)) as approved_date,
    date(cast(nullif(trim(cast(order_delivered_carrier_date as string)), '') as timestamp)) as delivered_carrier_date,
    date(cast(nullif(trim(cast(order_estimated_delivery_date as string)), '') as timestamp)) as estimated_delivery_date,
    date(cast(nullif(trim(cast(order_delivered_customer_date as string)), '') as timestamp)) as delivered_date

from raw_orders
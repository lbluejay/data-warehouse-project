with raw_order_items as (
    select * from {{ source('raw_olist', 'order_items') }}
)

select
    nullif(trim(cast(order_id as string)), '') as order_id,
    nullif(trim(cast(product_id as string)), '') as product_id,
    nullif(trim(cast(seller_id as string)), '') as seller_id,
    cast(nullif(trim(cast(order_item_id as string)), '') as int64) as order_item_id,
    cast(nullif(trim(cast(price as string)), '') as float64) as price,
    cast(nullif(trim(cast(freight_value as string)), '') as float64) as freight_value,
    cast(nullif(trim(cast(shipping_limit_date as string)), '') as timestamp) as shipping_limit_date

from raw_order_items
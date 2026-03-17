with raw_order_items as (
    select * from {{ source('raw_olist', 'order_items') }}
)

select
    NULLIF(trim(cast(order_id as varchar)), '') as order_id,
    cast(NULLIF(trim(cast(order_item_id as varchar)), '') as int) as order_item_id,
    NULLIF(trim(cast(product_id as varchar)), '') as product_id,
    NULLIF(trim(cast(seller_id as varchar)), '') as seller_id,
    cast(NULLIF(trim(cast(shipping_limit_date as varchar)), '') as timestamp) as shipping_limit_date,
    cast(NULLIF(trim(cast(price as varchar)), '') as float) as price,
    cast(NULLIF(trim(cast(freight_value as varchar)), '') as float) as freight_value
from raw_order_items
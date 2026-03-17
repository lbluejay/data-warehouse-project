with raw_order_payments as (
    select * from {{ source('raw_olist', 'order_payments') }}
)

select
    NULLIF(trim(cast(order_id as varchar)), '') as order_id,
    cast(NULLIF(trim(cast(payment_sequential as varchar)), '') as int) as payment_sequential,
    NULLIF(trim(cast(payment_type as varchar)), '') as payment_type,
    cast(NULLIF(trim(cast(payment_installments as varchar)), '') as int) as payment_installments,
    cast(NULLIF(trim(cast(payment_value as varchar)), '') as float) as payment_value
from raw_order_payments
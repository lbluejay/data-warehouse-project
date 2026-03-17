with raw_order_payments as (
    select * from {{ source('raw_olist', 'order_payments') }}
)

select
    nullif(trim(cast(order_id as string)), '') as order_id,
    nullif(trim(cast(payment_type as string)), '') as payment_type,
    cast(nullif(trim(cast(payment_sequential as string)), '') as int64) as payment_sequential,
    cast(nullif(trim(cast(payment_installments as string)), '') as int64) as payment_installments,
    cast(nullif(trim(cast(payment_value as string)), '') as float64) as payment_value

from raw_order_payments
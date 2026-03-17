{% set src_name = var('source_name') %}
{% set tbl_name = var('orders_table') %}

with raw_orders as (
    select * from {{ source(src_name, tbl_name) }}
)

select
    order_id,
    customer_id,
    order_status,
    -- Use the DATE() function or CAST() for BigQuery
    date(order_purchase_timestamp) as purchase_date,
    date(order_approved_at) as approved_date,
    date(order_delivered_carrier_date) as delivered_carrier_date,
    date(order_estimated_delivery_date) as estimated_delivery_date,
    date(order_delivered_customer_date) as delivered_date
from raw_orders
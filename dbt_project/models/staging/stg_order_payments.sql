{% set src_name = var('source_name') %}
{% set tbl_name = var('order_payments_table') %}

with raw_order_payments as (
    select * from {{ source(src_name, tbl_name) }}
)

select * from raw_order_payments
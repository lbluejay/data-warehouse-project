{% set src_name = var('source_name') %}
{% set tbl_name = var('customers_table') %}

with raw_customers as (
    select * from {{ source(src_name, tbl_name) }}
)

select * from raw_customers
{% set src_name = var('source_name') %}
{% set tbl_name = var('products_table') %}

with raw_products as (
    select * from {{ source(src_name, tbl_name) }}
)

select * from raw_products
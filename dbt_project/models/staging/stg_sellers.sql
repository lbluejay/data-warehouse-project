{% set src_name = var('source_name') %}
{% set tbl_name = var('sellers_table') %}

with raw_sellers as (
    select * from {{ source(src_name, tbl_name) }}
)

select * from raw_sellers
{% set src_name = var('source_name') %}
{% set tbl_name = var('product_category_name_translation_table') %}

with raw_product_category_name_translation as (
    select * from {{ source(src_name, tbl_name) }}
)

select * from raw_product_category_name_translation
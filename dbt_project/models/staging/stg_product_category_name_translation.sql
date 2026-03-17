with raw_product_category_name_translation as (
    select * from {{ source('raw_olist', 'product_category_name_translation') }}
)

select
    NULLIF(trim(cast(product_category_name as varchar)), '') as product_category_name,
    NULLIF(trim(cast(product_category_name_english as varchar)), '') as product_category_name_english
from raw_product_category_name_translation
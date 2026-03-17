with raw_products as (
    select * from {{ source('raw_olist', 'products') }}
)

select
    NULLIF(trim(cast(product_id as varchar)), '') as product_id,
    NULLIF(trim(cast(product_category_name as varchar)), '') as product_category_name,
    cast(NULLIF(trim(cast(product_name_length as varchar)), '') as float) as product_name_length,
    cast(NULLIF(trim(cast(product_description_length as varchar)), '') as float) as product_description_length,
    cast(NULLIF(trim(cast(product_photos_qty as varchar)), '') as float) as product_photos_qty,
    cast(NULLIF(trim(cast(product_weight_g as varchar)), '') as float) as product_weight_g,
    cast(NULLIF(trim(cast(product_length_cm as varchar)), '') as float) as product_length_cm,
    cast(NULLIF(trim(cast(product_height_cm as varchar)), '') as float) as product_height_cm,
    cast(NULLIF(trim(cast(product_width_cm as varchar)), '') as float) as product_width_cm
from raw_products
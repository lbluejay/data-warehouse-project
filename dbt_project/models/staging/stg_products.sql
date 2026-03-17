with raw_products as (
    select * from {{ source('raw_olist', 'products') }}
)

select
    nullif(trim(cast(product_id as string)), '') as product_id,
    nullif(trim(cast(product_category_name as string)), '') as product_category_name,
    cast(nullif(trim(cast(product_name_lenght as string)), '') as float64) as product_name_length,
    cast(nullif(trim(cast(product_description_length as string)), '') as float64) as product_description_length,
    cast(nullif(trim(cast(product_photos_qty as string)), '') as float64) as product_photos_qty,
    cast(nullif(trim(cast(product_weight_g as string)), '') as float64) as product_weight_g,
    cast(nullif(trim(cast(product_length_cm as string)), '') as float64) as product_length_cm,
    cast(nullif(trim(cast(product_height_cm as string)), '') as float64) as product_height_cm,
    cast(nullif(trim(cast(product_width_cm as string)), '') as float64) as product_width_cm

from raw_products
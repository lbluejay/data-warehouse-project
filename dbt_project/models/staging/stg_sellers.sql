with raw_sellers as (
    select * from {{ source('raw_olist', 'sellers') }}
)

select
    NULLIF(trim(cast(seller_id as varchar)), '') as seller_id,
    cast(NULLIF(trim(cast(seller_zip_code_prefix as varchar)), '') as int) as seller_zip_code_prefix,
    NULLIF(trim(cast(seller_city as varchar)), '') as seller_city,
    NULLIF(trim(cast(seller_state as varchar)), '') as seller_state
from raw_sellers
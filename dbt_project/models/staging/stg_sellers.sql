with raw_sellers as (
    select * from {{ source('raw_olist', 'sellers') }}
)

select
    nullif(trim(cast(seller_id as string)), '') as seller_id,
    cast(nullif(trim(cast(seller_zip_code_prefix as string)), '') as int64) as seller_zip_code_prefix,
    nullif(trim(cast(seller_city as string)), '') as seller_city,
    nullif(trim(cast(seller_state as string)), '') as seller_state

from raw_sellers
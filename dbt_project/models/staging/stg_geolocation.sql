with raw_geolocation as (
    select * from {{ source('raw_olist', 'geolocation') }}
)

select
    cast(nullif(trim(cast(geolocation_zip_code_prefix as string)), '') as int64) as geolocation_zip_code_prefix,
    cast(nullif(trim(cast(geolocation_lat as string)), '') as float64) as geolocation_lat,
    cast(nullif(trim(cast(geolocation_lng as string)), '') as float64) as geolocation_lng,
    nullif(trim(cast(geolocation_city as string)), '') as geolocation_city,
    nullif(trim(cast(geolocation_state as string)), '') as geolocation_state
from raw_geolocation
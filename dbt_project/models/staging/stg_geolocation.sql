with raw_geolocation as (
    select * from {{ source('raw_olist', 'geolocation') }}
)

select
    cast(NULLIF(trim(cast(geolocation_zip_code_prefix as varchar)), '') as int) as geolocation_zip_code_prefix,
    cast(NULLIF(trim(cast(geolocation_lat as varchar)), '') as float) as geolocation_lat,
    cast(NULLIF(trim(cast(geolocation_lng as varchar)), '') as float) as geolocation_lng,
    NULLIF(trim(cast(geolocation_city as varchar)), '') as geolocation_city,
    NULLIF(trim(cast(geolocation_state as varchar)), '') as geolocation_state
from raw_geolocation
with raw_customers as (
    select * from {{ source('raw_olist', 'customers') }}
)

select
    NULLIF(trim(cast(customer_id as varchar)), '') as customer_id,
    NULLIF(trim(cast(customer_unique_id as varchar)), '') as customer_unique_id,
    cast(NULLIF(trim(cast(customer_zip_code_prefix as varchar)), '') as int) as customer_zip_code_prefix,
    NULLIF(trim(cast(customer_city as varchar)), '') as customer_city,
    NULLIF(trim(cast(customer_state as varchar)), '') as customer_state
from raw_customers
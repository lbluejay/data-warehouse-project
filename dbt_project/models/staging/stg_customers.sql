with raw_customers as (
    select * from {{ source('raw_olist', 'customers') }}
)

select
    nullif(trim(cast(customer_id as string)), '') as customer_id,
    nullif(trim(cast(customer_unique_id as string)), '') as customer_unique_id,
    cast(nullif(trim(cast(customer_zip_code_prefix as string)), '') as int64) as customer_zip_code_prefix,
    
    nullif(trim(cast(customer_city as string)), '') as customer_city,
    nullif(trim(cast(customer_state as string)), '') as customer_state
from raw_customers
with raw_order_reviews as (
    select * from {{ source('raw_olist', 'order_reviews') }}
)

select
    NULLIF(trim(cast(review_id as varchar)), '') as review_id,
    NULLIF(trim(cast(order_id as varchar)), '') as order_id,
    cast(NULLIF(trim(cast(review_score as varchar)), '') as int) as review_score,
    NULLIF(trim(cast(review_comment_title as varchar)), '') as review_comment_title,
    NULLIF(trim(cast(review_comment_message as varchar)), '') as review_comment_message,
    cast(NULLIF(trim(cast(review_creation_date as varchar)), '') as timestamp) as review_creation_date,
    cast(NULLIF(trim(cast(review_answer_timestamp as varchar)), '') as timestamp) as review_answer_timestamp
from raw_order_reviews
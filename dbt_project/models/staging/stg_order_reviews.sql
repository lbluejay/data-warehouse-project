with raw_order_reviews as (
    select * from {{ source('raw_olist', 'order_reviews') }}
)

select
    nullif(trim(cast(review_id as string)), '') as review_id,
    nullif(trim(cast(order_id as string)), '') as order_id,
    nullif(trim(cast(review_comment_title as string)), '') as review_comment_title,
    nullif(trim(cast(review_comment_message as string)), '') as review_comment_message,
    cast(nullif(trim(cast(review_score as string)), '') as int64) as review_score,
    cast(nullif(trim(cast(review_creation_date as string)), '') as timestamp) as review_creation_date,
    cast(nullif(trim(cast(review_answer_timestamp as string)), '') as timestamp) as review_answer_timestamp

from raw_order_reviews
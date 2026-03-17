{% set src_name = var('source_name') %}
{% set tbl_name = var('geolocation_table') %}

with raw_geolocation as (
    select * from {{ source(src_name, tbl_name) }}
)

select * from raw_geolocation
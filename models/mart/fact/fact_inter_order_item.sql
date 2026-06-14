{{
    config(
        materialized='incremental',
        unique_key=['order_id','line_number'],
        incremental_strategy='merge'
    )
}}

select *
from {{ ref('inter_order_item') }}

{% if is_incremental() %}

where ship_date >
(
    select max(ship_date)
    from {{ this }}
)

{% endif %}
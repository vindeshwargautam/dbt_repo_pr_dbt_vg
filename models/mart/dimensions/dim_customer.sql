with customers as (
    select * from {{ref('stg_customer')}}
),
nations as (
    select * from {{ref('stg_nation')}}
),
region as (
    select * from {{ref('stg_region')}}
),
final as (
    select
    c.customer_id,
    c.customer_name,
    c.customer_address,
    c.phone_number,
    c.market_segment,
    c.account_balance,
    case 
    when c.account_balance >= 5000 then 'high value'
    when c.account_balance >= 1000 then 'mid value'
    else 'low value' end as customer_tier
    from customers c 
    join nations n on n.nation_id=c.nation_id
    join region r on r.region_id=n.region_id
)
select * from final
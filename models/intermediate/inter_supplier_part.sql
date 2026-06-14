with
    partssupps as (
        select * from {{ref('stg_partsupp')}}
    ),
    supplier as (
        select * from {{ref('stg_supplier')}}
    ),
    nations as (
        select * from {{ref('stg_nation')}}
    ),
    regions as (
        select * from {{ref('stg_region')}}
    ),
    enriched as (
        select
        ps.part_id,
        ps.supplier_id,
        ps.available_quantity,
        ps.supply_cost,
        s.supplier_name,
        s.supplier_address,
        s.account_balance,
        n.nation_name,
        r.region_name
    from partssupps ps
    left join supplier s on ps.supplier_id = s.supplier_id
    left join nations n  on s.nation_id = n.nation_id
    left join regions r on n.region_id = n.region_id
    )
    select * from enriched
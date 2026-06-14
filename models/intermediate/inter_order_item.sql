with
   orders as (
    select * from {{ref('stg_orders')}}
   ) ,

    lineitems as (
        select * from {{ref('stg_lineitem')}}
    ),
        
        orders_items as ( 
            select
          o.order_id,
          o.customer_id,
          o.order_status,
          o.total_price,
          o.order_year,
          o.order_month,
          o.order_priority,
          l.line_number,
          l.part_id,
          l.quantity,
          l.extended_price,
          l.discount_perc,
          l.net_revenue,
          l.return_flag,
          l.ship_date,
          l.ship_mode,
          l.days_late
          from orders o
          inner join lineitems l
          on o.order_id = l.order_id
        )

        select * from orders_items
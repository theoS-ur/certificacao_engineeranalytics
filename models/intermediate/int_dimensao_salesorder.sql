with 
    salesorder as (
        select *
        from {{ref('stg_erp__salesorderheader')}}
    )
    

    
    , salesorder_enriquecido as(
        select
            salesorder.pk_salesorderheader as pk_salesorder
           , salesorder.order_status as order_status
           , salesorder.onlineorderflag as is_online
        from salesorder
    )

select *
from salesorder_enriquecido


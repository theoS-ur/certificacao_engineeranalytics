with 
    source_bridge as(
        select *
        from {{ref('stg_erp__salesorderheadersalesreason')}}
    )
    , source_bridge_enriquecido as (
        select
            source_bridge.fk_reason as fk_sales_reason
            ,source_bridge.fk_salesorderheader as fk_sales_order_header
        from source_bridge
    )

select *
from source_bridge_enriquecido
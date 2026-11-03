with 
    source_bridge as(
        select *
        from {{ref('stg_erp__salesorderheadersalesreason')}}
    )
    ,source_salesorderheader as(
        select *
        from {{ref('stg_erp__salesorderheader')}}
    )
    ,pedidos_sem_motivo as (
        select
            header.pk_salesorderheader as fk_sales_order_header
            ,-1 as fk_sales_reason
        from source_salesorderheader as header
        left join source_bridge on header.pk_salesorderheader = source_bridge.fk_salesorderheader
        where source_bridge.fk_salesorderheader is null
    )

    , source_bridge_valido as (
        select
            source_bridge.fk_reason as fk_sales_reason
            ,source_bridge.fk_salesorderheader as fk_sales_order_header
        from source_bridge
    )
    ,source_bridge_enriquecido as(
        select
            fk_sales_reason
            ,fk_sales_order_header
        from source_bridge_valido

        union all

        select
            fk_sales_reason
            ,fk_sales_order_header
        from pedidos_sem_motivo


    )

select *
from source_bridge_enriquecido

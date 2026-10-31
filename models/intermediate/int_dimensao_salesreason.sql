with 
    salesreason as (
        select *
        from {{ref('stg_erp__salesreason')}}
    )
    ,salesreason_enriquecido as (
        select
            salesreason.pk_reason as pk_sales_reason
            ,salesreason.reason_name as sales_reason_name
            ,salesreason.reasontype as sales_reason_type

         from salesreason
    )

select *
from salesreason_enriquecido
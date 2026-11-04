with 
    salesreason as (
        select *
        from {{ref('stg_erp__salesreason')}}
    )
    ,salesreason_motivos as (
        select
            salesreason.pk_reason as pk_sales_reason
            ,salesreason.reason_name as sales_reason_name
            ,salesreason.reason_type as sales_reason_type

         from salesreason
    )
    ,salesreason_enriquecido as (
        select 
            -1 as pk_sales_reason
            ,'Not provided' as sales_reason_name
            ,'Not provided' as sales_reason_type
        union all

        select
            pk_sales_reason
            ,sales_reason_name
            ,sales_reason_type
        from salesreason_motivos

    )

select *
from salesreason_enriquecido
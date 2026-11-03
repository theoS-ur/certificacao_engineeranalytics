with 
    sales_reason as (
        select *
        from {{ref('int_dimensao_salesreason')}}
    )

select *
from sales_reason
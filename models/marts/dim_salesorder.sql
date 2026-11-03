with 
    salesorder as (
        select *
        from {{ref('int_dimensao_salesorder')}}
    )

select *
from salesorder
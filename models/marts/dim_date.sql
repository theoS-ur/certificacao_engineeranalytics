with 
    date as (
        select *
        from {{ref('int_dimensao_date')}}
    )

select *
from date
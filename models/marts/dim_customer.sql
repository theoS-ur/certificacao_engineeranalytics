with 
    customer as (
        select *
        from {{ref('int_dimensao_customer')}}
    )

select *
from customer
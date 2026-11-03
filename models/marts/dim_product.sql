with 
    product as (
        select *
        from {{ref('int_dimensao_product')}}
    )

select *
from product
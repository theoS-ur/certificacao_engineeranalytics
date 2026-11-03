with 
    creditcard as (
        select *
        from {{ref('int_dimensao_creditcard')}}
    )

select *
from creditcard
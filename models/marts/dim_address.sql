with 
    _address as (
        select *
        from {{ref('int_dimensao_address')}}
    )

select *
from _address
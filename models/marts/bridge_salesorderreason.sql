with 
    salesorderreason as (
        select *
        from {{ref('int_bridge_salesorderreason')}}
    )

select *
from salesorderreason
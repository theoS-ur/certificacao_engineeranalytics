with 
    sales as (
        select *
        from {{ref('int_fato_sales')}}
    )

select *
from sales
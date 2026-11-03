with
    soma_transacao_2011 as (

        select 
            extract(year from order_date) as ano
            ,sum(gross_price) as total
        from {{ref('int_fato_sales')}}
        group by 1

    )
select *
from soma_transacao_2011
where 
    ano = 2011
    and total not between 12646112.155 and 12646112.165

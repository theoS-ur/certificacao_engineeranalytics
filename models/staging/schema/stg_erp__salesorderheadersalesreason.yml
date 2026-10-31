with 
    source_salesorderheadersalesreason as(
        select *
        from {{source('erp','sales_salesorderheadersalesreason')}}
    )
    , renomeado as(
        select 
            cast(salesreasonid as int) as fk_reason
            , cast(salesorderid as int) as fk_salesorderheader
            
        from source_salesorderheadersalesreason

    )

select *
from renomeado
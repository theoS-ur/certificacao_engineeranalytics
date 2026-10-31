with 
    source_salesreason as(
        select *
        from {{source('erp','sales_salesreason')}}
    )
    , renomeado as(
        select 
            cast(salesreasonid as int) as pk_reason
            , name as reason_name
            , reasontype
            
        from source_salesreason

    )

select *
from renomeado
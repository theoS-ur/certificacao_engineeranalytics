with 
    source_store as(
        select *
        from {{source('erp','sales_store')}}
    )
    , renomeado as(
        select 
            cast(businessentityid as int) as pk_store
            , name as store_name
            
        from source_store

    )

select *
from renomeado
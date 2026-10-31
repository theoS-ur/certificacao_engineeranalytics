with 
    source_address as(
        select *
        from {{source('erp','person_address')}}
    )
    , renomeado as(
        select 
            cast(addressid as int) as pk_address
            ,cast(stateprovinceid as int) as fk_province
            , addressline1 ||coalesce(' ' || addressline2,'') as full_address
            , cast(city as string) as city
            
        from source_address

    )

select *
from renomeado
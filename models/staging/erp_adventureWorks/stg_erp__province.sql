with 
    source_province as(
        select *
        from {{source('erp','person_stateprovince')}}
    )
    , renomeado as(
        select 
            cast(stateprovinceid as int) as pk_province
            ,cast(countryregioncode as string) as fk_country
            ,cast(territoryid as int) as fk_territory
            , name as province_name
            
            
        from source_province

    )

select *
from renomeado
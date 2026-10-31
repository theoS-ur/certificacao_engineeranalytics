with 
    source_country as(
        select *
        from {{source('erp','person_countryregion')}}
    )
    , renomeado as(
        select 
            cast(coalesce(countryregioncode,'NA') as string) as pk_country
            , name as country_name
            
            
        from source_country

    )

select *
from renomeado
order by pk_country
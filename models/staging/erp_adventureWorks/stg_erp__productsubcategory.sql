with 
    source_productsubcategory as(
        select *
        from {{source('erp','production_productsubcategory')}}
    )
    , renomeado as(
        select 
            cast(productsubcategoryid as int) as pk_productsubcategory
            ,cast(productcategoryid as int) as fk_productcategory
            , name as productsubcategory_name
            
        from source_productsubcategory

    )

select *
from renomeado
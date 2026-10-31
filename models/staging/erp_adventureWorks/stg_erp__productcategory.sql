with 
    source_productcategory as(
        select *
        from {{source('erp','production_productcategory')}}
    )
    , renomeado as(
        select 
            cast(productcategoryid as int) as pk_productcategory
            , name as productcategory_name

            
        from source_productcategory

    )

select *
from renomeado
with 
    source_products as(
        select *
        from {{source('erp','production_product')}}
    )
    , renomeado as(
        select 
            cast(productid as int) as pk_product
            ,cast(productsubcategoryid as int) as fk_productsubcategory
            , name as product_name
            , productnumber as product_number
            
        from source_products

    )

select *
from renomeado
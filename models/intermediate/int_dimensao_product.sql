with 
    product as (
        select *
        from {{ref('stg_erp__products')}}
    )
    ,productcategory as (
        select *
        from {{ref('stg_erp__productcategory')}}
    )
    ,productsubcategory as (
        select *
        from {{ref('stg_erp__productsubcategory')}}
    )
    ,product_enriquecido as (
        select
            product.pk_product as pk_product
            ,product.product_name as product_name
            ,product.product_number as product_number
            ,productcategory.productcategory_name as productcategory_name
            ,productsubcategory.productsubcategory_name as productsubcategoy_name
         from product
         left join productsubcategory on product.fk_productsubcategory = productsubcategory.pk_productsubcategory
         left join productcategory on productsubcategory.fk_productcategory = productcategory.pk_productcategory
    )

select *
from product_enriquecido
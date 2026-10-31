with 
    salesorderdetail as (
        select *
        from {{source('erp','sales_salesorderdetail')}}
    )

    ,renomeado as (
        select    
            cast(salesorderdetailid as int) as pk_salesorderdetail
            ,cast(salesorderid as int) as fk_salesorderheader
            ,cast(productid as int) as fk_product
            ,cast(specialofferid as int) as fk_specialoffer
            ,orderqty
            ,unitprice
            ,unitpricediscount
        from salesorderdetail
            
    )

select *
from renomeado


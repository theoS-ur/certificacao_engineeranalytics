with 
    salesorderheader as (
        select *
        from {{source('erp','sales_salesorderheader')}}
    )

    ,renomeado as (
        select    
            cast(salesorderid as int) as pk_salesorderheader
            ,cast(customerid as int) as fk_customer
            ,cast(billtoaddressid as int) as fk_billtoaddress
            ,cast(shiptoaddressid as int) as fk_shiptoaddress
            ,cast(orderdate as date) as order_date
            ,cast(duedate as date) as due_date
            ,cast(orderdate as date) as ship_date
            ,onlineorderflag
            ,subtotal
            ,taxamt
            ,freight
            ,totaldue
        from salesorderheader
            
    )

select *
from renomeado
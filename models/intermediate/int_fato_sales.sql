with
    salesorderdetail as (
        select *
        from{{ref('stg_erp__salesorderdetail')}}
    )
    ,salesorderheader as (
        select *
        from{{ref('stg_erp__salesorderheader')}}
    )
    , salesorderdetail_calculado as (
        select
            salesorderdetail.pk_salesorderdetail as pk_sales            
            ,salesorderdetail.fk_salesorderheader as fk_salesorder
            ,salesorderdetail.fk_product as fk_product
            ,salesorderheader.fk_customer as fk_customer
            ,cast(date_format(salesorderheader.order_date, 'yyyyMMdd') as int) as fk_order_date
            ,coalesce(cast(date_format(salesorderheader.ship_date, 'yyyyMMdd') as int),-1) as fk_ship_date
            ,coalesce(cast(date_format(salesorderheader.due_date, 'yyyyMMdd') as int),-1) as fk_due_date 
            ,salesorderheader.fk_shiptoaddress as fk_ship_to_address
            ,salesorderheader.fk_billtoaddress as fk_bill_to_address
            ,salesorderheader.onlineorderflag as is_online_order
            ,salesorderdetail.orderqty as order_qty
            ,salesorderdetail.unitprice as unit_price
            ,salesorderdetail.unitprice *salesorderdetail.orderqty as gross_price
            ,salesorderdetail.unitprice *salesorderdetail.unitpricediscount as unit_price_discount
            ,salesorderdetail.unitpricediscount as unit_price_discount_pct
            ,salesorderdetail.unitprice *salesorderdetail.orderqty*(1-salesorderdetail.unitpricediscount) as net_price
            ,salesorderheader.freight * (
                (salesorderdetail.unitprice*salesorderdetail.orderqty*(1-salesorderdetail.unitpricediscount))
                /sum(salesorderdetail.unitprice*salesorderdetail.orderqty*(1-salesorderdetail.unitpricediscount)) over (partition by salesorderdetail.fk_salesorderheader))
                 as freight
            ,salesorderheader.taxamt * (salesorderdetail.unitprice*salesorderdetail.orderqty*(1-salesorderdetail.unitpricediscount))/salesorderheader.subtotal as tax
        
        from salesorderdetail
        left join salesorderheader on salesorderdetail.fk_salesorderheader = salesorderheader.pk_salesorderheader

    )
    , salesorderdetail_enriquecido as(
        select *
            , (net_price + freight + tax) as total_price

        from salesorderdetail_calculado
    )

select *
from salesorderdetail_enriquecido



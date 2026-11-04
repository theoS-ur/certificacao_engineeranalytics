with
    salesorderdetail as (
        select *
        from{{ref('stg_erp__salesorderdetail')}}
    )
    ,salesorderheader as (
        select *
        from{{ref('stg_erp__salesorderheader')}}
    )
    ,int_dimensao_customer as (
        select *
        from{{ref('int_dimensao_customer')}}
    )
    , salesorderdetail_calculado as (
        select
            salesorderdetail.pk_salesorderdetail as pk_sales            
            ,salesorderdetail.fk_salesorderheader as fk_salesorder
            ,salesorderdetail.fk_product as fk_product
            ,coalesce(int_dimensao_customer.pk_customer, -1) as fk_customer
            ,salesorderheader.fk_creditcard as fk_creditcard
            ,cast(date_format(salesorderheader.order_date, 'yyyyMMdd') as int) as fk_order_date
            ,coalesce(cast(date_format(salesorderheader.ship_date, 'yyyyMMdd') as int),-1) as fk_ship_date
            ,coalesce(cast(date_format(salesorderheader.due_date, 'yyyyMMdd') as int),-1) as fk_due_date 
            ,salesorderheader.fk_shiptoaddress as fk_ship_to_address
            ,salesorderheader.fk_billtoaddress as fk_bill_to_address
            ,salesorderheader.order_date as order_date
            ,salesorderheader.ship_date as ship_date
            ,salesorderheader.due_date as due_date
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
            ,salesorderdetail.modified_date as modified_date
        
        from salesorderdetail
        left join salesorderheader on salesorderdetail.fk_salesorderheader = salesorderheader.pk_salesorderheader
        left join int_dimensao_customer on salesorderheader.fk_customer = int_dimensao_customer.pk_customer

    )
    , salesorderdetail_enriquecido as(
        select *
            , (net_price + freight + tax) as total_price

        from salesorderdetail_calculado
    )

select *
from salesorderdetail_enriquecido


select *
from {{source('erp', 'sales_salesorderheader')}}
order by customerid
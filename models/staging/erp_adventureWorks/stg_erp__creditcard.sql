with 
    source_creditcard as(
        select *
        from {{source('erp','sales_creditcard')}}
    )
    , renomeado as(
        select 
            cast(creditcardid as int) as pk_creditcard
            ,cardtype as card_type
            , cast(cardnumber as string) as card_number
            ,expmonth as exp_month
            ,expyear as exp_year
        from source_creditcard

    )

select *
from renomeado
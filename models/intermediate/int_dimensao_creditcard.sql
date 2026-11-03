with 
    creditcard as (
        select *
        from {{ref('stg_erp__creditcard')}}
    )
    
    ,creditcard_enriquecido as (
        select
            creditcard.pk_creditcard as pk_creditcard
            ,creditcard.card_type as card_type
            ,creditcard.card_number as card_number
            ,creditcard.exp_month as exp_month
            ,creditcard.exp_year as exp_year
         from creditcard

    )

select *
from creditcard_enriquecido
with 
    customer as (
        select *
        from {{ref('stg_erp__customer')}}
    )
    
    ,person as (
        select *
        from {{ref('stg_erp__person')}}
    )
    ,customer_desconhecido as (
        select 
            -1 as pk_customer
            ,-1 as person_id
            ,'Não Cadastrado' as person_name

    )
    
    , customer_enriquecido as(
        select
            customer.pk_customer as pk_customer
           , person.pk_person as person_id
           , person.person_name as person_name
        from customer
        left join person on customer.fk_person = person.pk_person
    )

select *
from customer_enriquecido


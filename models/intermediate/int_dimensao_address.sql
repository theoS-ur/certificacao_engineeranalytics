with 
    _address as (
        select *
        from {{ref('stg_erp__address')}}
    )
    
    ,province as (
        select *
        from {{ref('stg_erp__province')}}
    )
    ,country as (
        select *
        from {{ref('stg_erp__country')}}
    )

    ,_address_enriquecido as (
        select 
            _address.pk_address as pk_address
            ,_address.full_address as full_address
            ,_address.city as city_name
            ,province.province_name as province_name
            ,country.country_name as country_name
        from _address
        left join province on _address.fk_province = province.pk_province
        left join country on province.fk_country = country.pk_country

    )

select *
from _address_enriquecido
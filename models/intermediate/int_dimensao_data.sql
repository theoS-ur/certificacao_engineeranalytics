with 
    date_spine as(
        {{dbt_utils.date_spine(
                datepart = "day",
                start_date = "cast('2011-05-31' as date)",
                end_date = "cast('2014-07-07' as date)"
        )}}

    )
    , criar_datas as (
        select
           cast(date_format(date_day,'yyyyMMdd') as int) as pk_data
            , cast( date_day as date) as _data
            , extract(day from date_day) as dia
            , extract(month from date_day) as mes
            , extract(year from date_day) as ano
            , extract(quarter from date_day) as trimestre
            , case dayofweek(date_day)
                when 1 then 'Domingo'
                when 2 then 'Segunda'
                when 3 then 'Terça'
                when 4 then 'Quarta'
                when 5 then 'Quinta'
                when 6 then 'Sexta'
                when 7 then 'Sábado'
            end as dia_da_semana
            , case
                when extract(dow from date_day) in (1,7) then true
                else false
            end as is_final_de_semana

        from date_spine

    )

select *
from criar_datas
with 
    date_spine as(
        {{dbt_utils.date_spine(
                datepart = "day",
                start_date = "cast('2011-05-31' as date)",
                end_date = "cast('2014-09-30' as date)"
        )}}

    )
    , criar_datas as (
        select
           cast(date_format(date_day,'yyyyMMdd') as int) as pk_date
            , cast( date_day as date) as _date
            , extract(day from date_day) as _day
            , extract(month from date_day) as _month
            , extract(year from date_day) as _year
            , extract(quarter from date_day) as _quarter
            , case dayofweek(date_day)
                when 1 then 'Domingo'
                when 2 then 'Segunda'
                when 3 then 'Terça'
                when 4 then 'Quarta'
                when 5 then 'Quinta'
                when 6 then 'Sexta'
                when 7 then 'Sábado'
            end as day_of_the_week
            , case
                when extract(dow from date_day) in (1,7) then true
                else false
            end as is_weekend

        from date_spine

    )

select *
from criar_datas
with 
    source_person as(
        select *
        from {{source('erp','person_person')}}
    )
    , renomeado as(
        select 
            cast(businessentityid as int) as pk_person 
            , firstname ||coalesce(' ' || middlename,'') ||coalesce(' ' || lastname,'') as person_name
            , emailpromotion
             
            
        from source_person

    )

select *
from renomeado
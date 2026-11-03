select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

with child as (
    select fk_creditcard as from_field
    from `fea_academy`.`adventure_works`.`fct_sales`
    where fk_creditcard is not null
),

parent as (
    select pk_creditcard as to_field
    from `fea_academy`.`adventure_works`.`dim_creditcard`
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



  
  
      
    )
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select state_code as from_field
    from DBT_VOTER_DATA.normalized.dim_county
    where state_code is not null
),

parent as (
    select code as to_field
    from DBT_VOTER_DATA.normalized.dim_state
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test
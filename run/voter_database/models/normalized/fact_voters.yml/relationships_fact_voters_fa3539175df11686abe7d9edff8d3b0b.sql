select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with child as (
    select SK_ADDRESS_ID as from_field
    from DBT_VOTER_DATA.normalized.fact_voters
    where SK_ADDRESS_ID is not null
),

parent as (
    select SK_ADDRESS_ID as to_field
    from DBT_VOTER_DATA.normalized.dim_address
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null



      
    ) dbt_internal_test
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        DID_MOVE_TO_ANOTHER_STATE as value_field,
        count(*) as n_records

    from DBT_VOTER_DATA.normalized.fact_voters
    group by DID_MOVE_TO_ANOTHER_STATE

)

select *
from all_values
where value_field not in (
    '0','1'
)



      
    ) dbt_internal_test
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        STATE_CODE as value_field,
        count(*) as n_records

    from DBT_VOTER_DATA.cleaned.georgia_voters
    group by STATE_CODE

)

select *
from all_values
where value_field not in (
    'GA'
)



      
    ) dbt_internal_test
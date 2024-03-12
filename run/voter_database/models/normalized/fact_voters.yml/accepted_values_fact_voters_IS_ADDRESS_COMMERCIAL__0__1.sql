select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        IS_ADDRESS_COMMERCIAL as value_field,
        count(*) as n_records

    from DBT_VOTER_DATA.normalized.fact_voters
    group by IS_ADDRESS_COMMERCIAL

)

select *
from all_values
where value_field not in (
    '0','1'
)



      
    ) dbt_internal_test
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select IS_ADDRESS_INVALID
from DBT_VOTER_DATA.normalized.fact_voters
where IS_ADDRESS_INVALID is null



      
    ) dbt_internal_test
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select DID_MOVE_TO_ANOTHER_COUNTY
from DBT_VOTER_DATA.normalized.fact_voters
where DID_MOVE_TO_ANOTHER_COUNTY is null



      
    ) dbt_internal_test
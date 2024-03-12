select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select DID_MOVE_TO_ANOTHER_STATE
from DBT_VOTER_DATA.normalized.fact_voters
where DID_MOVE_TO_ANOTHER_STATE is null



      
    ) dbt_internal_test
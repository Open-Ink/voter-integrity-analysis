select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select DID_MOVE
from DBT_VOTER_DATA.normalized.fact_voters
where DID_MOVE is null



      
    ) dbt_internal_test
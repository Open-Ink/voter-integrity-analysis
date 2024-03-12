select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select VOTER_ID
from DBT_VOTER_DATA.normalized.fact_voters
where VOTER_ID is null



      
    ) dbt_internal_test
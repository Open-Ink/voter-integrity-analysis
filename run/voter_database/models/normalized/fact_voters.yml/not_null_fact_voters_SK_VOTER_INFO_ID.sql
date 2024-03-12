select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select SK_VOTER_INFO_ID
from DBT_VOTER_DATA.normalized.fact_voters
where SK_VOTER_INFO_ID is null



      
    ) dbt_internal_test
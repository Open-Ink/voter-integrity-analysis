select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select COUNTY_CODE
from DBT_VOTER_DATA.cleaned.all_voter_history
where COUNTY_CODE is null



      
    ) dbt_internal_test
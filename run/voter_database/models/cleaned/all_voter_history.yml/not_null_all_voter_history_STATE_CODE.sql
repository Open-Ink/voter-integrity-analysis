select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select STATE_CODE
from DBT_VOTER_DATA.cleaned.all_voter_history
where STATE_CODE is null



      
    ) dbt_internal_test
select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select FILE_DATE
from DBT_VOTER_DATA.cleaned.all_voters
where FILE_DATE is null



      
    ) dbt_internal_test
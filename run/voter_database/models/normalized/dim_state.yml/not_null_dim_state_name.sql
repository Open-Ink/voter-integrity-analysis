select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select name
from DBT_VOTER_DATA.normalized.dim_state
where name is null



      
    ) dbt_internal_test
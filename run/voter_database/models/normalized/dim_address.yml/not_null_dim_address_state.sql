select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select state
from DBT_VOTER_DATA.normalized.dim_address
where state is null



      
    ) dbt_internal_test
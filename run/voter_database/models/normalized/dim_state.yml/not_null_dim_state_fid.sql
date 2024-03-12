select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select fid
from DBT_VOTER_DATA.normalized.dim_state
where fid is null



      
    ) dbt_internal_test
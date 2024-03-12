select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select county_code
from DBT_VOTER_DATA.normalized.dim_county
where county_code is null



      
    ) dbt_internal_test
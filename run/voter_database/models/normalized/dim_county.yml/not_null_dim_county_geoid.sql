select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select geoid
from DBT_VOTER_DATA.normalized.dim_county
where geoid is null



      
    ) dbt_internal_test
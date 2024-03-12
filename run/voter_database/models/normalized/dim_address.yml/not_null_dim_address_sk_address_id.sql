select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select sk_address_id
from DBT_VOTER_DATA.normalized.dim_address
where sk_address_id is null



      
    ) dbt_internal_test
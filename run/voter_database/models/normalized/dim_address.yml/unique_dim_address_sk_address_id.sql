select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    sk_address_id as unique_field,
    count(*) as n_records

from DBT_VOTER_DATA.normalized.dim_address
where sk_address_id is not null
group by sk_address_id
having count(*) > 1



      
    ) dbt_internal_test
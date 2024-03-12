select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    county_id as unique_field,
    count(*) as n_records

from DBT_VOTER_DATA.normalized.dim_county
where county_id is not null
group by county_id
having count(*) > 1



      
    ) dbt_internal_test
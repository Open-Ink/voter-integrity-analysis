select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        address_type as value_field,
        count(*) as n_records

    from DBT_VOTER_DATA.normalized.dim_address
    group by address_type

)

select *
from all_values
where value_field not in (
    'RESIDENCE','MAILING'
)



      
    ) dbt_internal_test
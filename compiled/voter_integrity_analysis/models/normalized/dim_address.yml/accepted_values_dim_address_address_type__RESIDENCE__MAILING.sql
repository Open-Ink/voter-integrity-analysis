
    
    

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



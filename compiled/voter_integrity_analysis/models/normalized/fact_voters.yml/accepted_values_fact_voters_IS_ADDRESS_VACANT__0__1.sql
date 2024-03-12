
    
    

with all_values as (

    select
        IS_ADDRESS_VACANT as value_field,
        count(*) as n_records

    from DBT_VOTER_DATA.normalized.fact_voters
    group by IS_ADDRESS_VACANT

)

select *
from all_values
where value_field not in (
    '0','1'
)



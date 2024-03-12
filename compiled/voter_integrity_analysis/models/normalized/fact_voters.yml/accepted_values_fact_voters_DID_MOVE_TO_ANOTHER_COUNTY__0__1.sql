
    
    

with all_values as (

    select
        DID_MOVE_TO_ANOTHER_COUNTY as value_field,
        count(*) as n_records

    from DBT_VOTER_DATA.normalized.fact_voters
    group by DID_MOVE_TO_ANOTHER_COUNTY

)

select *
from all_values
where value_field not in (
    '0','1'
)



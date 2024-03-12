
    
    

with all_values as (

    select
        DID_VOTE_AFTER_MOVING as value_field,
        count(*) as n_records

    from DBT_VOTER_DATA.normalized.fact_voters
    group by DID_VOTE_AFTER_MOVING

)

select *
from all_values
where value_field not in (
    '0','1'
)



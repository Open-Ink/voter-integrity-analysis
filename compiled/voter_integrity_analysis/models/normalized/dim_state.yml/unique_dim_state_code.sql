
    
    

select
    code as unique_field,
    count(*) as n_records

from DBT_VOTER_DATA.normalized.dim_state
where code is not null
group by code
having count(*) > 1



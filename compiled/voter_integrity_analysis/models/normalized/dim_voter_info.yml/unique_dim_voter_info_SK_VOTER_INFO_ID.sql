
    
    

select
    SK_VOTER_INFO_ID as unique_field,
    count(*) as n_records

from DBT_VOTER_DATA.normalized.dim_voter_info
where SK_VOTER_INFO_ID is not null
group by SK_VOTER_INFO_ID
having count(*) > 1



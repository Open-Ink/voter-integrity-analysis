select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        STATE_CODE, COUNTY_CODE, VOTER_ID, ELECTION_DATE
    from DBT_VOTER_DATA.cleaned.all_voter_history
    group by STATE_CODE, COUNTY_CODE, VOTER_ID, ELECTION_DATE
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test
-- back compat for old kwarg name
  
  begin;
    

        insert into DBT_VOTER_DATA.cleaned.all_voter_history ("STATE_CODE", "COUNTY_CODE", "VOTER_ID", "ELECTION_TYPE", "ELECTION_DATE", "PARTY_VOTED", "VOTING_METHOD", "DATE_OF_VOTING", "WAS_VOTE_COUNTED", "ADDITIONAL_DATA", "CREATED_AT")
        (
            select "STATE_CODE", "COUNTY_CODE", "VOTER_ID", "ELECTION_TYPE", "ELECTION_DATE", "PARTY_VOTED", "VOTING_METHOD", "DATE_OF_VOTING", "WAS_VOTE_COUNTED", "ADDITIONAL_DATA", "CREATED_AT"
            from DBT_VOTER_DATA.cleaned.all_voter_history__dbt_tmp
        );
    commit;
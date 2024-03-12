-- back compat for old kwarg name
  
  begin;
    

        insert into DBT_VOTER_DATA.normalized.dim_voter_info ("SK_VOTER_INFO_ID", "STATE_CODE", "COUNTY_CODE", "NAME_PREFIX", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "NAME_SUFFIX", "VOTER_STATUS", "REGISTRATION_DATE", "MOVE_DATE", "LAST_VOTE_DATE", "LAST_PARTY_VOTED", "CREATED_AT")
        (
            select "SK_VOTER_INFO_ID", "STATE_CODE", "COUNTY_CODE", "NAME_PREFIX", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "NAME_SUFFIX", "VOTER_STATUS", "REGISTRATION_DATE", "MOVE_DATE", "LAST_VOTE_DATE", "LAST_PARTY_VOTED", "CREATED_AT"
            from DBT_VOTER_DATA.normalized.dim_voter_info__dbt_tmp
        );
    commit;
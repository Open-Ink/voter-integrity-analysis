-- back compat for old kwarg name
  
  begin;
    

        insert into DBT_VOTER_DATA.normalized.dim_address ("SK_ADDRESS_ID", "SOURCE_STATE", "LINE_1", "LINE_2", "CITY", "STATE", "ZIPCODE", "COUNTRY", "ADDRESS_TYPE", "CREATED_AT")
        (
            select "SK_ADDRESS_ID", "SOURCE_STATE", "LINE_1", "LINE_2", "CITY", "STATE", "ZIPCODE", "COUNTRY", "ADDRESS_TYPE", "CREATED_AT"
            from DBT_VOTER_DATA.normalized.dim_address__dbt_tmp
        );
    commit;
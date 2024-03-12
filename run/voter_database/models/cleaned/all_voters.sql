-- back compat for old kwarg name
  
  begin;
    

        insert into DBT_VOTER_DATA.cleaned.all_voters ("SK_VOTER_INFO_ID", "FILE_DATE", "STATE_CODE", "COUNTY_CODE", "VOTER_ID", "PREFIX", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "NAME_SUFFIX", "RESIDENCE_ADDRESS_LINE_1", "RESIDENCE_ADDRESS_LINE_2", "RESIDENCE_ADDRESS_CITY", "RESIDENCE_ADDRESS_STATE", "RESIDENCE_ADDRESS_ZIPCODE", "RESIDENCE_ADDRESS_COUNTRY", "BIRTH_YEAR", "BIRTH_MONTH", "BIRTH_DATE", "VOTER_STATUS", "REGISTRATION_DATE", "CONGRESSIONAL_DISTRICT", "STATE_SENATE_DISTRICT", "STATE_HOUSE_DISTRICT", "JUDICIAL_DISTRICT", "COUNTY_COMMISSION_DISTRICT", "SCHOOL_BOARD_DISTRICT", "CITY_COUNCIL_DISTRICT", "COUNTY_PRECINCT", "MUNICIPAL_PRECINCT", "RACE", "GENDER", "MAILING_ADDRESS_LINE_1", "MAILING_ADDRESS_LINE_2", "MAILING_LINE_3", "MAILING_CITY", "MAILING_STATE", "MAILING_ZIPCODE", "MAILING_COUNTRY", "LAST_VOTED_DATE", "LAST_PARTY_VOTED", "CREATED_AT")
        (
            select "SK_VOTER_INFO_ID", "FILE_DATE", "STATE_CODE", "COUNTY_CODE", "VOTER_ID", "PREFIX", "FIRST_NAME", "MIDDLE_NAME", "LAST_NAME", "NAME_SUFFIX", "RESIDENCE_ADDRESS_LINE_1", "RESIDENCE_ADDRESS_LINE_2", "RESIDENCE_ADDRESS_CITY", "RESIDENCE_ADDRESS_STATE", "RESIDENCE_ADDRESS_ZIPCODE", "RESIDENCE_ADDRESS_COUNTRY", "BIRTH_YEAR", "BIRTH_MONTH", "BIRTH_DATE", "VOTER_STATUS", "REGISTRATION_DATE", "CONGRESSIONAL_DISTRICT", "STATE_SENATE_DISTRICT", "STATE_HOUSE_DISTRICT", "JUDICIAL_DISTRICT", "COUNTY_COMMISSION_DISTRICT", "SCHOOL_BOARD_DISTRICT", "CITY_COUNCIL_DISTRICT", "COUNTY_PRECINCT", "MUNICIPAL_PRECINCT", "RACE", "GENDER", "MAILING_ADDRESS_LINE_1", "MAILING_ADDRESS_LINE_2", "MAILING_LINE_3", "MAILING_CITY", "MAILING_STATE", "MAILING_ZIPCODE", "MAILING_COUNTRY", "LAST_VOTED_DATE", "LAST_PARTY_VOTED", "CREATED_AT"
            from DBT_VOTER_DATA.cleaned.all_voters__dbt_tmp
        );
    commit;